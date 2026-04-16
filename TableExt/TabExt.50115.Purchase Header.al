tableextension 50115 Purchase_Header extends "Purchase Header"
{
    fields
    {
        field(50001; "Vendor Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50002; "Sales Order No"; Code[20])
        {
            DataClassification = ToBeClassified;
            // FieldClass = FlowField;
            //CalcFormula = lookup("Purchase Line"."Document No." where("Document No." = field("No.")));

        }
        field(50044; "Shipping Addresses"; Text[1024])
        {
            DataClassification = ToBeClassified;

        }
        field(50045; "In-Hand Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50046; "Shipment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50047; "Tracking No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                PurchaseHeader1: Record "Purchase Header";
                ReleasePurch: Codeunit "Release Purchase Document";
                SalesH: Record "Sales Header";
                SalesLineL: Record "Sales Line";
                SalesLineL1: Record "Sales Line";
                SalesL: Record "Sales Line";
                SHInvoice: Boolean;
                PaymentTerms: Record "Payment Terms";
                RecCust: Record customer;
                TrackingSingleIns: Codeunit "SingleIns Tracking Error";
            begin
                if Rec."Tracking No." <> '' then begin
                    if Rec.Status = Rec.Status::Released then
                        ReleasePurch.PerformManualReopen(Rec);
                    if Rec."Document Type" = Rec."Document Type"::Order then begin
                        // SalesL.Reset();
                        // SalesL.SetRange("Purchase Order No.", Rec."No.");
                        // SalesL.SetRange("Charge Item", false);
                        // if SalesL.Findset() then
                        //     repeat
                        //         SalesL."Package Tracking No." := rec."Tracking No.";
                        //         SalesL."Tracking no." := Rec."Tracking No.";
                        //         SalesL."Shipment Date" := Rec."Shipment Date";
                        //         if SalesL."Next Shipment Date" = 0D then
                        //             SalesL."Next Shipment Date" := Rec."Shipment Date";
                        //         SalesL.modify(false);
                        //         UpdateTrackingDetails(SalesL);//Update tracking details from vendor portal to tables
                        //                                       //  Mails.RemainderEmail(SalesL);//Payment Mail
                        //     until SalesL.Next() = 0;

                        if PaymentTerms.get(Rec."Prepmt. Payment Terms Code") then
                            Rec."Due Date" := CalcDate(PaymentTerms."Due Date Calculation", Today);


                        //>>MR 1.0 7th Dec 2023

                        Rec.CalcFields("Completely Received");
                        if not Rec."Completely Received" then begin
                            // Rec.Validate("Posting Date", WorkDate());
                            // Rec.Receive := true;
                            // Codeunit.Run(90, Rec);


                            //VY POtracking++
                            if not TryPostReceipt(Rec) then begin
                                TrackingSingleIns.SetPostingError(Rec."No.", GetLastErrorText());
                                Error(GetLastErrorText());
                            end;

                            // SalesL.Reset();
                            // SalesL.SetRange("Purchase Order No.", Rec."No.");
                            // SalesL.SetRange("Charge Item", false);
                            // if SalesL.FindSet() then
                            //     repeat
                            //         SalesL."Package Tracking No." := Rec."Tracking No.";
                            //         SalesL."Tracking no." := Rec."Tracking No.";
                            //         SalesL."Shipment Date" := Rec."Shipment Date";
                            //         if SalesL."Next Shipment Date" = 0D then
                            //             SalesL."Next Shipment Date" := Rec."Shipment Date";
                            //         SalesL.Modify(false);
                            //         UpdateTrackingDetails(SalesL);
                            //     until SalesL.Next() = 0;
                        end;

                        ///Auto sales order item invoice+++
                        // if Rec."Completely Received" then begin
                        SHInvoice := false;
                        SalesH.Reset();
                        SalesH.SetRange(SalesH."No.", Rec."Sales Order No");
                        if SalesH.FindFirst() then begin
                            if RecCust.get(SalesH."Sell-to Customer No.") then;
                            if Not RecCust."VIP Customer" then begin
                                SalesLineL.Reset();
                                SalesLineL.SetRange("Document Type", SalesH."Document Type");
                                SalesLineL.SetRange("Document No.", SalesH."No.");
                                // SalesLineL.SetFilter("Quantity Shipped", '<>%1', 0);
                                if SalesLineL.FindSet() then
                                    repeat
                                        if SalesLineL."Quantity Shipped" = 0 then //if all lines are shipped then only auto invoice
                                            SHInvoice := true;
                                    //      if SalesLineL1.GET(SalesLineL."Document Type", SalesLineL."Document No.", SalesLineL."Line No.") then begin
                                    //     if SalesLineL."Purchase Order No." = Rec."No." then begin
                                    //         SalesLineL1.Validate(SalesLineL1."Qty. to Invoice", SalesLineL1.Quantity);
                                    //         SalesLineL1.Modify(true);
                                    //         SHInvoice := true;
                                    //     end else begin
                                    //         SalesLineL1.Validate(SalesLineL1."Qty. to Invoice", 0);
                                    //         SalesLineL1.Modify(true);
                                    //     end;
                                    // end;
                                    until SalesLineL.next() = 0;

                                //>>VY 
                                if not SHInvoice then begin
                                    SalesH.Validate("Posting Date", WorkDate());
                                    SalesH.Invoice := true;
                                    SalesH.Modify(false);
                                    Codeunit.Run(80, SalesH);
                                end;
                            end;
                            //<<VY 
                        end;
                        //end;
                        ///Auto sales order item invoice---
                    end;

                    //PurchaseInvoice and related order Auto Ship with webexsono
                    if Rec."Document Type" = Rec."Document Type"::Invoice then begin
                        Rec.Validate("Posting Date", WorkDate());
                        Rec.Invoice := true;
                        Codeunit.Run(90, Rec);
                        // Sales order ship/invoice
                        SalesH.Reset();
                        SalesH.SetRange(SalesH."No.", Rec."WebEx SO No.");
                        if SalesH.FindFirst() then begin
                            SalesLineL.Reset();
                            SalesLineL.SetRange("Document Type", SalesH."Document Type");
                            SalesLineL.SetRange("Document No.", SalesH."No.");
                            if SalesLineL.FindSet() then
                                repeat
                                    if SalesLineL."Quantity Shipped" = 0 then
                                        SHInvoice := true;
                                    if (SalesLineL."Line No." = Rec."WebEx SO Line No.") OR (SalesLineL."Ref. Line No." = Rec."WebEx SO Line No.") then begin
                                        SalesLineL.Validate(SalesLineL."Qty. to Ship", SalesLineL.Quantity);
                                        SalesLineL.Modify(true);
                                        SHInvoice := true;
                                    end else begin
                                        SalesLineL.Validate(SalesLineL."Qty. to Ship", 0);
                                        SalesLineL.Modify(true);
                                    end;
                                until SalesLineL.next() = 0;
                            //>>VY 
                            if SHInvoice then begin
                                SalesH.Validate("Posting Date", WorkDate());
                                SalesH.Ship := true;
                                SalesH.Invoice := true;
                                SalesH.Modify(false);
                                Codeunit.Run(80, SalesH);
                            end;
                        End;
                    end;





                    // if Rec."Last Receiving No." = '' then begin
                    //     Rec."Tracking No." := '';
                    //     Rec.Modify(false);
                    // end;
                end;
            END;
        }
        // PW NG 1.0 14082023  START- Added for Vendor Portal Integration to maintain the web status
        field(50048; "Order Status"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 14082023  END- Added for Vendor Portal Integration to maintain the web status

        field(50049; "Shipping Agent Code"; Code[10])
        {
            //  AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Agent Code';
            TableRelation = "Item Shipping Agent".Code where(Location = field("Location Code"));
        }
        field(50050; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE("Shipping Agent Code" = FIELD("Shipping Agent Code"));
        }
        // PW NG 1.0 START- 24082023 - For Vendor Portal Pagination
        field(50051; "Page No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 END -24082023 - For Vendor Portal Pagination

        field(50052; "Total Count"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(50053; "PO on Hold"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50054; "Order on Hold Comment"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50055; "cancelled PO"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50056; "Cancelled User ID"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50057; "Cancelled DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(50058; "Cancelled Comments"; Text[1048])
        {
            DataClassification = CustomerContent;
        }
        field(50059; "Order Status VendorP"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50060; "PO Sent Details"; Text[500])
        {
            DataClassification = CustomerContent;
        }
        field(50061; "Validate PO"; Boolean)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                SalesH: Record "Sales Header";
                SalesLineL: Record "Sales Line";
                SalesLineL1: Record "Sales Line";
            begin
                /*
                SalesH.Reset();
                SalesH.SetRange(SalesH."PO No.", Rec."No.");
                if SalesH.FindFirst() then begin
                    SalesLineL.Reset();
                    SalesLineL.SetRange("Document Type", SalesH."Document Type");
                    SalesLineL.SetRange("Document No.", SalesH."No.");
                    if SalesLineL.FindSet() then
                        repeat
                            if SalesLineL1.GET(SalesLineL."Document Type", SalesLineL."Document No.", SalesLineL."Line No.") then begin
                                // if (SalesLineL1."Outstanding Quantity" <> 0) then begin
                                // if (SalesLineL1."Qty. to Ship" = 0) then
                                if SalesLineL."Purchase Order No." = Rec."No." then begin
                                    SalesLineL1.Validate(SalesLineL1."Qty. to Invoice", SalesLineL1.Quantity);
                                    SalesLineL1.Modify(true);
                                end else begin
                                    SalesLineL1.Validate(SalesLineL1."Qty. to Invoice", 0);
                                    SalesLineL1.Modify(true);
                                end;
                                //  end;
                            end;
                        until SalesLineL.next() = 0;


                    //>>VY 
                    //  Rec.CalcFields("Completely Received");
                    if Not Rec."Validate PO" then begin
                        SalesH.Validate("Posting Date", WorkDate());
                        SalesH.Invoice := true;
                        SalesH.Modify(false);
                        Codeunit.Run(80, SalesH);
                    end;
                    //<<VY 
                end;*/
            end;
        }
        field(50062; "Third Party Shipping"; Boolean)
        {
            Caption = 'Third Party Shipping';
            DataClassification = CustomerContent;
        }
        field(50063; "Third Party Shipping Acc. No."; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Third Party Shipping Acc. No.';
        }
        field(50064; "Third Party Zip Code"; Code[20])
        {
            Caption = 'Third Party Zip Code';
            TableRelation = IF ("Ship-to Country/Region Code" = CONST('')) "Post Code"
            ELSE
            IF ("Ship-to Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Ship-to Country/Region Code"));

            ValidateTableRelation = false;
        }

        // PW NG 1.0 AP - Buckets >>>
        field(50065; "BILL TYPE"; Text[100])
        {
            DataClassification = CustomerContent;

        }
        field(50066; "PHONE NO."; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50067; "BILL PAID DATE"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50068; "DAYS OVERDUE"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50069; "Contact Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50070; "Show vendor portal"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50114; "IID Shipping"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50115; "Art Email ID"; Text[1050])
        {
            Caption = 'Art Email ID';
            DataClassification = CustomerContent;
        }
        field(50116; "Account Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Billing Email';
        }
        field(50117; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                if "E-Mail" = '' then
                    exit;
                MailManagement.CheckValidEmailAddresses("E-Mail");
            end;
        }
        // PW NG 1.0 AP - Buckets <<<
        field(50118; "Vendor_Type"; code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Type"."Vendor code";

        }

        field(50119; "WebEx SO No."; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50120; Cancelled; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        //>>PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50121; "QuickBook ID"; Code[100])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 26th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50122; "QuickBook Error"; Text[2048])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 26th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50123; "QuickBook Sync Failed"; Boolean)
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 8th Dec 2024 -- Field Added to map QuickBook ID to BC
        field(50124; "Vendor QuickBook ID"; Code[100])
        {
            //TableRelation = Location.Code;
        }
        field(50125; "Ready for QuickBook"; boolean)
        {

        }
        //<<PW MR 8th Dec 2024 -- Field Added to map QuickBook ID to BC
        field(50126; "Invoiced in QuickBook"; boolean)
        {

        }
        field(50127; "PI Sent Details"; Text[500])
        {
            DataClassification = CustomerContent;
        }
        field(50128; "Xbrand Order"; boolean)
        {

        }
        field(50129; "Web Xbrand Order"; boolean)
        {

        }
        field(50130; "WebEx SO Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(50131; "Xbrand Flag"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50132; "Mail Sent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50133; "Xbrand Filter"; Boolean)
        {

            FieldClass = FlowField;
            CalcFormula = exist("Sales Line" where("Document No." = field("WebEx SO No."), "Line No." = field("WebEx SO Line No."), "Xbrand Flag" = filter(true)));
        }

        field(50134; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(50135; "72 hrs Cancelled Filter"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(50336; "Vendor Refund"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50337; "Vendor Refund Updated in QB"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50338; "Blank Goods PO From Web"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        modify("Pay-to Post Code")
        {
            Caption = 'Pay-to Zip Code';
        }
        modify("Ship-to Post Code")
        {
            Caption = 'Ship-to Zip Code';
        }
        modify("Buy-from Post Code")
        {
            Caption = 'Buy-from Zip Code';
        }
    }
    procedure UpdateTrackingDetails(SalesLine: Record "Sales Line")
    var
        ShipmentTrackingDetails: Record "Shipment Tracking Details";
    begin
        ShipmentTrackingDetails.Init();
        ShipmentTrackingDetails."Entry No." := 0;
        ShipmentTrackingDetails."Item No." := SalesLine."No.";
        ShipmentTrackingDetails."Sales Orders No." := SalesLine."Document No.";
        ShipmentTrackingDetails."Order Line No." := SalesLine."Line No.";
        ShipmentTrackingDetails."Shipping Agent Code" := SalesLine."Shipping Agent Code";
        ShipmentTrackingDetails."Shipping Agent Service Code" := SalesLine."Shipping Agent Service Code";
        ShipmentTrackingDetails."Tracking No." := SalesLine."Tracking no.";
        ShipmentTrackingDetails."Ship-to Code" := SalesLine."Ship to code";
        ShipmentTrackingDetails.Insert();
    end;

    [TryFunction]
    local procedure TryPostReceipt(var PurchHeader: Record "Purchase Header")
    begin
        PurchHeader.Validate("Posting Date", WorkDate());
        PurchHeader.Receive := true;
        Codeunit.Run(90, PurchHeader);
    end;



    var
        myInt: Integer;
}