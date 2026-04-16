tableextension 50103 TabExtSalessLine extends "Sales Line"
{
    fields
    {
        //>>>>>Sales
        field(50000; "Sample Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50001; "Blank Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50002; "Rush Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50003; "Assorted Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50004; "Split Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50005; "Low Stock"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50006; "Order on Hold"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        //-------------------
        field(50007; LTM; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50008; "Repeat Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50009; "Customer Approved"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Approved';
        }
        field(50010; "Auto Calculated Charge"; Boolean)
        {
            Caption = 'Auto Calculate Shipping Charge';
            DataClassification = ToBeClassified;
        }
        field(50014; "Group Item No."; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "Shipping Charges"; Boolean)
        {
            Caption = 'Is Shipping Charge Calculated';
            DataClassification = ToBeClassified;
        }

        field(50016; "Charge Code"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "Free Item"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "Group Ref. No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "Is Pre-Production Sample Line"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Ref. Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Ref. Item No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Ship to code"; code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Ship To Address split"."Ship-to Code" where("Document No" = field("Document No."), "Item No" = field("No."));
            // ValidateTableRelation = true;
        }
        field(50023; "Shipment Sequence"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        //>>>>>For CSR Profile
        field(50024; "Cancelled Order"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "Sample No Proof Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50026; "Sample on Hold Orders"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50027; "Sample Order Type"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50028; "Sample Pre Flight"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50029; "Imprint Method"; Code[50])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = IF (Type = CONST(Item)) "Item Imprint Location"."Imprint Method" WHERE("Item No." = FIELD("No."));
            // TableRelation = "Category Imprint_M_Matrix"."Imprint Method" where("Item No." = field("No."));//("Item Category" = field("Item Category"), "Item sub Category" = field("Item sub Category"), "Item sub sub Category" = field("Item sub sub Category"));
            TableRelation = "Category Imprint_M_Matrix"."Imprint Method" where("Item No." = field("No."), "Vendor No." = field("Buy-from Vendor No."));
        }
        field(50030; "Imprint Options"; Code[80])
        {
            DataClassification = ToBeClassified;
            TableRelation = Imprint_Options.code;
        }
        field(50031; "Art ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Art ID';
        }

        field(50032; "Art Options"; Enum ArtOptions)
        {
            DataClassification = CustomerContent;
            Caption = 'Art Options';
        }
        field(50033; "Shipping Agent CodeItem"; Code[10])
        {
            //  AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Agent Code';
            //   TableRelation = "Shipping Agent".Code;
            TableRelation = "Item Shipping Agent".Code where(location = field("location code"));
        }
        field(50034; "Cancelled Qty"; Decimal)
        {
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
        }
        field(50035; "Item Category"; Code[20])
        {
            DataClassification = ToBeClassified;

            // TableRelation = "Item Category".Code;

        }
        field(50036; "Item sub Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            //   TableRelation = "Item Category".Code where("Parent Category" = field("Item Category"));

        }
        field(50037; "Item sub sub Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Item Category".Code where("Parent Category" = field("Item sub Category"));

        }
        // field(50011; "Shipping Agent ServiceCode"; Code[10])
        // {
        //     Caption = 'Shipping Agent Service Code';
        //     TableRelation = "Shipping Agent Services".Code WHERE("Shipping Agent Code" = FIELD("Shipping Agent Code"));
        // }
        //<<<<<Sales
        field(50038; "Imprint Location"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50039; "Auto Calculated Item Charge"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50040; "IMP Location"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50042; "IMP Color"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50043; "Super Rush Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50044; "Cancel Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        // Added by 09-02-2023 Nikhil JIRA ID EI-93 +++
        field(50045; "Is Item changed"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50046; "Prev Item NO."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        // Added by 09-02-2023 Nikhil JIRA ID EI-93 +++
        field(50047; "Buy-from Vendor No."; Code[20])
        {
            DataClassification = CustomerContent;
            //TableRelation=Vendor."No.";
            TableRelation = "Item Vendor"."Vendor No." where("Item No." = field("No."));
        }
        field(50048; "Is Item Charge Calculated"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50049; "Charge Item"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50050; "Add Attachment"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50051; "Quote Sent"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50052; "Vendor_Type"; code[100])
        {
            DataClassification = ToBeClassified;
            //     TableRelation = "Vendor Type"."Vendor code";
        }
        field(50053; "Is Accessories"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Is Accessories';
        }
        FIELD(50054; "Back Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50055; "Next Shipment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        //ID sequence change by VY for FEDEX and Thirdparty Fields 21082023

        // modify("No.")
        // {
        //     TableRelation = IF (Type = CONST(Item), Item where("Is Accessories"=filter(true));
        // }

        // PW NG 1.0 21072023 START - FedEx Shipping Charge Integration
        field(50056; "Fedex Service Code"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50057; "Fedex Service Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50058; "Fedex Charge"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50059; "Charge Line"; Boolean)
        {
            Caption = 'Identify Double Item';
            DataClassification = ToBeClassified;
        }
        field(50060; "Quantity Charge"; Decimal)
        {
            DataClassification = ToBeClassified;
        }


        // PW NG 1.0 21072023 END - FedEx Shipping Charge Integration

        field(50061; "Third Party Shipping"; Boolean)
        {
            Caption = 'Third Party Shipping';
            DataClassification = CustomerContent;
        }
        // PW NG 1.0 14082023 START - EI-333 - Imprint ID - Third party shipping fields - Please add third party zip code and third party account number in sales line.
        field(50062; "Third Party Shipping Acc. No."; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Third Party Shipping Acc. No.';
        }
        field(50063; "Third Party Zip Code"; Code[20])
        {
            Caption = 'Third Party Zip Code';
            TableRelation = "Post Code";
            ValidateTableRelation = false;
        }
        // PW NG 1.0 14082023 END - EI-333 - Imprint ID - Third party shipping fields - Please add third party zip code and third party account number in sales line.
        field(50064; "Blank Order Ready for Prod"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50065; "Blank Order InProduction"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50066; "Vendor Portal Status"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = ArtOrderStatus."Status Code";
        }
        field(50067; "Ready for Prod"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50068; "In Production"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50069; "Sent Revised prepayment"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50070; Status; Enum ArtStatusOptions)
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
        }
        field(50071; "SETUP CHARGE"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50072; "Ship Service Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        //MR

        field(50073; "Scrap Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50074; "Scrap Assigned"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        //MR
        field(50075; "ProofOFFlagforWeb"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        // PW NG 1.0 08072024 - Tracking shipping >>>
        field(50076; "Tracking no."; Text[2048])
        {
            Caption = 'Tracking Nos.';
            DataClassification = CustomerContent;
        }
        field(50077; "Price Attributes"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Unit Price"."Price Attributes" where("Price Attributes" = filter(<> ''), "Imprint Method" = field("Imprint Method"), "Item No." = field("No."));
            TableRelation = "Web Sales Price Attribute".Code where("Item No." = field("No."));
        }
        // PW NG 1.0 08072024 - Tracking shipping <<<

        field(50078; "Qty to ship For Wh"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50079; Accessory; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(50080; "Blank Order Ready To Ship"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50081; "Xbrand Flag"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50082; Brand; Code[100])
        {
            DataClassification = CustomerContent;
        }
        field(50083; "Manual Charges"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        // modify("No.")
        // {
        //     TableRelation = Item where("Charge Item" = const(false));
        // }

    }



    trigger OnDelete()
    var
        ImprintColodetails: Record "Imprint Color Details";
        ImpDetail: Record "Imprint Details";
        artwork: Record Artwork;
        SalesLine: Record "Sales Line";
        purchLine: Record "Purchase Line";
        ArtworkLog: record Artworkstatuslog;
        salesL: Record "Sales Line";
        SalesRecSetup: Record "Sales & Receivables Setup";
        SalesShipmentLineCarton: Record "Sales Shipment Line Carton";
    begin
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."Document No.");
        SalesLine.setrange("Ref. Item No.", Rec."No.");
        SalesLine.SetRange("Ref. Line No.", Rec."Line No.");
        if salesline.FindFirst() then
            SalesLine.DeleteAll(false);

        SalesRecSetup.Get();
        salesL.Reset();
        salesL.SetRange("Document Type", Rec."Document Type");
        salesL.SetRange("Document No.", Rec."Document No.");
        salesL.SetRange("No.", Rec."Ref. Item No.");
        salesL.SetRange("Line No.", Rec."Ref. Line No.");
        salesL.Setrange("Charge Item", false);
        if salesL.FindFirst() then begin
            salesL."Is Item Charge Calculated" := false;
            if (Rec."Charge Item") AND (rec."No." = SalesRecSetup."Shipping Charge Acc No.") then begin
                salesL."Shipping Charges" := false;
                salesL.Modify(false);
            end;
        end;

        artwork.Reset();
        artwork.SetRange("Document Type", Rec."Document Type");
        artwork.SetRange("Document No.", Rec."Document No.");
        artwork.SetRange("Document Line No.", Rec."Line No.");
        artwork.SetRange("Art ID", Rec."Art ID");
        if not artwork.IsEmpty then // PW NG 1.0 16082023 - Error on deleting sales line if Artwork sheet is blank
            artwork.DeleteAll(true);

        ImpDetail.Reset();
        ImpDetail.SetRange("Document Type", Rec."Document Type");
        ImpDetail.SetRange("Document No.", Rec."Document No.");
        ImpDetail.SetRange("Document Line No.", Rec."Line No.");
        ImpDetail.SetRange("Art ID", Rec."Art ID");
        if not ImpDetail.IsEmpty then // PW NG 1.0 16082023 - Error on deleting sales line if Artwork sheet is blank
            ImpDetail.DeleteAll(true);

        ImprintColodetails.Reset();
        ImprintColodetails.SetRange("Document Type", Rec."Document Type");
        ImprintColodetails.SetRange("Document No.", Rec."Document No.");
        ImprintColodetails.SetRange("Document Line No.", Rec."Line No.");
        ImprintColodetails.SetRange("Art ID", Rec."Art ID");
        if not ImprintColodetails.IsEmpty then  // PW NG 1.0 16082023 - Error on deleting sales line if Artwork sheet is blank
            ImprintColodetails.DeleteAll(true);

        ArtworkLog.Reset();
        ArtworkLog.SetRange("Document Type", Rec."Document Type");
        ArtworkLog.SetRange("Order No", Rec."Document No.");
        ArtworkLog.setrange("Item No.", Rec."No.");
        ArtworkLog.SetRange("Art ID", Rec."Art ID");
        if not ArtworkLog.IsEmpty then
            ArtworkLog.DeleteAll(true);
        // if ArtworkLog.FindFirst() then
        //     ArtworkLog.Delete(true);

        purchLine.Reset();
        purchLine.SetRange("Sales Order No.", "Document No.");
        purchLine.SetRange("Sales Order Line No.", "Line No.");
        if not purchLine.IsEmpty then // PW NG 1.0 16082023 - Error on deleting sales line if Artwork sheet is blank
            purchLine.DeleteAll(false);

        SalesShipmentLineCarton.Reset();
        SalesShipmentLineCarton.SetRange("Document Type", Rec."Document Type");
        SalesShipmentLineCarton.SetRange("Document No.", Rec."Document No.");
        SalesShipmentLineCarton.SetRange("Sales Line No.", Rec."Line No."); // PW NG 1.0 13062024 - •	If multiple items are there in sales line then carton details are showing same for both the items even quantity is different.
        // SalesShipmentLineCarton.SetRange("Line No.", SalesLine."Line No.");
        //SalesShipmentLineCarton.SetRange("Shipment Sequence", 0);
        SalesShipmentLineCarton.SetRange(Shipped, false);//PartialChange++
        if not SalesShipmentLineCarton.IsEmpty then
            SalesShipmentLineCarton.DeleteAll(false);


    end;

    /* trigger OnModify()
     var
         ImprintColodetails: Record "Imprint Color Details";
         ImpDetail: Record "Imprint Details";
         artwork: Record Artwork;
         SalesLine: Record "Sales Line";
     begin
         if Rec."No." <> xRec."No." then begin
             SalesLine.Reset();
             SalesLine.SetRange("Document Type", Rec."Document Type");
             SalesLine.SetRange("Document No.", Rec."Document No.");
             SalesLine.setrange(SalesLine."Ref. Item No.", Rec."No.");
             SalesLine.SetRange("Ref. Line No.", Rec."Line No.");
             if salesline.FindFirst() then
                 SalesLine.Delete(true);

             artwork.Reset();
             artwork.SetRange("Document Type", Rec."Document Type");
             artwork.SetRange("Document No.", Rec."Document No.");
             artwork.SetRange("Document Line No.", Rec."Line No.");
             // artwork.SetRange("Art ID", Rec."Art ID");
             artwork.DeleteAll(true);

             ImpDetail.Reset();
             ImpDetail.SetRange("Document Type", Rec."Document Type");
             ImpDetail.SetRange("Document No.", Rec."Document No.");
             ImpDetail.SetRange("Document Line No.", Rec."Line No.");
             //  ImpDetail.SetRange("Art ID", Rec."Art ID");
             ImpDetail.DeleteAll(true);

             ImprintColodetails.Reset();
             ImprintColodetails.SetRange("Document Type", Rec."Document Type");
             ImprintColodetails.SetRange("Document No.", Rec."Document No.");
             ImprintColodetails.SetRange("Document Line No.", Rec."Line No.");
             // ImprintColodetails.SetRange("Art ID", Rec."Art ID");
             ImprintColodetails.DeleteAll(true);
         end;
     end;

 */


    var
        myInt: Integer;
}