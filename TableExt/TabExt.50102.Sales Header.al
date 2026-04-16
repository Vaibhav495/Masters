tableextension 50102 TabExtSalesHeader extends "Sales Header"
{
    fields
    {
        //>>>>>Customer
        field(50000; "Shipping Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Shipping Email';
        }
        field(50001; "Billing Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Billing Email';
        }
        field(50002; "Ack Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Ack Email';
        }
        field(50003; "Credit on Hold"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Credit on Hold';
        }
        field(50004; "Third Party Shipping"; Boolean)
        {
            Caption = 'Third Party Shipping';
            DataClassification = CustomerContent;
        }
        field(50005; "Third Party Shipping Acc. No."; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Third Party Shipping Acc. No.';
        }
        field(50006; "Credit on Hold DateTime"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(50007; "Is Residential"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50008; "Middle Name"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        //<<<<<Customer

        //>>>>>Sales
        field(50009; "Sample Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50010; "Blank Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        // field(50011; "Rush Order"; Boolean)
        // {
        //     DataClassification = CustomerContent;
        // }
        field(50012; "Assorted Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50013; "Split Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50014; "Low Stock"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50015; "Order on Hold"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50016; "Order on Hold Comment"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50017; LTM; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50018; "Repeat Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50019; "Old Customer PO"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(50020; "Old PO Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50021; "Art Name"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(50022; "Warehouse Notes"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50023; "Rush Order"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Rush Order';
        }
        field(50024; "Art Email ID"; Text[1050])
        {
            Caption = 'Art Email ID';
            DataClassification = CustomerContent;
        }
        field(50025; "Proof All Orders"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof All Orders';
        }
        field(50026; "Mandatory Approval"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Proof Approval Required';
        }
        field(50027; "Email Proof"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Email Proof';
        }

        field(50028; "Proof Internally Approved"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Internally Approved';
        }
        field(50029; "Proof Internally Rejected"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Internally Rejected';
        }
        field(50030; "No Proof Required"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'No Proof Required';
        }
        field(50031; "Sent To Art"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Sent To Art';
        }
        field(50032; "Own Shipping"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50033; "Insured Shipment"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50034; "Less than min Qty"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50036; "Rush Options"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Same Day","1 Work Day","2 Work Day","3 Work Day","4 Work Day";

            //<<<<<Sales
        }
        field(50037; "Ship-To-Phone No."; Integer)
        {
            DataClassification = ToBeClassified;
            // Trigger onValidate()
            // var
            //     PhoneNoCannotLessthan10charErr: Label 'Phone no should be 10 digit';
            // BEGIN
            //     IF Rec."Ship-To-Phone No." <> 0 THEN BEGIN
            //         IF StrLen(Format("Ship-To-Phone No.")) <> 10 THEN
            //             Error(PhoneNoCannotLessthan10charErr);
            //     END;
            // END;
            // var
            //     Char: DotNet Char;
            //     i: Integer;
            //     PhoneNoCannotContainLettersErr: Label 'You cannot enter letters in this field.';
            // begin
            //     for i := 1 to StrLen("Ship-To-Phone No.") do
            //         if Char.IsLetter("Ship-To-Phone No."[i]) then
            //             Error(PhoneNoCannotContainLettersErr);

            // end;
            //  Enabled = false;
        }
        field(50038; Order_Type; Option)
        {
            CaptionML = ENU = 'Order Type';
            OptionCaptionML = ENU = 'Standard,Rush Order,Super Rush Order';
            OptionMembers = "Standard","Rush Order","Super Rush Order";

        }
        field(50039; "Internal Comments"; Text[250])
        {
            DataClassification = ToBeClassified;

        }
        field(50040; "cancelled Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50041; "Sell To Contact NameNew"; Text[250])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Contact.Name where("Company Name" = field("Sell-to Customer Name"));
            ValidateTableRelation = false;

            TableRelation = IF ("Sell-to Customer Name" = filter('')) Contact.Name where(Type = filter('Person'))
            ELSE
            Contact.Name where("Company Name" = field("Sell-to Customer Name"), Type = filter('Person'));

        }
        field(50042; "Sell To Email New"; Text[100])
        {
            OptimizeForTextSearch = true;
            ExtendedDatatype = EMail;
            //TableRelation = Contact."E-Mail" where("Company Name" = field("Sell-to Customer Name"));
            ValidateTableRelation = false;
            DataClassification = ToBeClassified;
            TableRelation = IF ("Sell-to Customer Name" = filter('')) Contact."No." where(Type = filter('Person'))
            ELSE
            Contact."No." where("Company Name" = field("Sell-to Customer Name"), Type = filter('Person'));

        }
        field(50043; "Order Status"; Text[100])
        {
            Caption = 'Order Status';
            DataClassification = CustomerContent;
        }
        field(50044; "Shipping Addresses"; Text[1024])
        {
            DataClassification = ToBeClassified;

        }
        field(50045; "Cancelled User ID"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50046; "Cancelled DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(50047; "Cancelled Comments"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50048; "Order From Sales Quote"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50049; "Ship to Address Change"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50050; "Ship-To-PhoneNo"; Text[20])
        {
            Caption = 'Ship-To-Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
            // Trigger onValidate()
            // var
            //     PhoneNoCannotLessthan10charErr: Label 'Phone no should be 10 digit';
            // BEGIN
            //     IF Rec."Ship-To-PhoneNo" <> '' THEN BEGIN
            //         IF StrLen("Ship-To-PhoneNo") <> 10 THEN
            //             Error(PhoneNoCannotLessthan10charErr);
            //     END;
            // END;
        }
        field(50051; "Upload Customer PO"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Upload Customer PO';
        }
        field(50052; "Upload Customer PO Text"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Upload Customer PO';
        }
        field(50053; "In-Hand Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50054; "Item Charge"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50055; "Shipping Charge"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50056; "Customer Email"; Text[250])
        {
            OptimizeForTextSearch = true;
            DataClassification = CustomerContent;
            Caption = 'Customer Email';
        }
        field(50057; "Quote Sent"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50058; "SO Confirmation Send"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50059; "Super Rush Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50060; "Sell-to Customer Name New"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            DataClassification = CustomerContent;
            // TableRelation = Customer."No.";
            TableRelation = Customer.Name;
            ValidateTableRelation = false;

            // trigger OnLookup()
            // var
            //     CustomerName: Text;
            // begin
            //     CustomerName := "Sell-to Customer Name New";
            //     //    LookupSellToCustomerName(CustomerName);
            //     "Sell-to Customer Name New" := CopyStr(CustomerName, 1, MaxStrLen("Sell-to Customer Name"));
            // end;

        }
        field(50061; "Payment Method Code 2"; Code[10])
        {
            TableRelation = "Payment Method".code;

            // trigger OnValidate()
            // begin
            //     Rec.UpdateDirectDebitPmtTermsCode();

            //     "Bal. Account Type" := PaymentMethod."Bal. Account Type";
            //     "Bal. Account No." := PaymentMethod."Bal. Account No.";
            //     if "Bal. Account No." <> '' then begin
            //         TestField("Applies-to Doc. No.", '');
            //         TestField("Applies-to ID", '');
            //         Clear("Payment Service Set ID");
            //     end;
            // end;
        }
        field(50062; "Contact Phone No"; Text[30])
        {

            ExtendedDatatype = PhoneNo;
            //    TableRelation = IF ("Sell-to Customer Name" = filter('')) Contact."No."
            // ELSE
            // Contact."No." where("Company Name" = field("Sell-to Customer Name"));
            // Trigger onValidate()
            // var
            //     PhoneNoCannotLessthan10charErr: Label 'Phone no should be 10 digit';
            // BEGIN
            //     IF Rec."Contact Phone No" <> '' THEN BEGIN
            //         IF StrLen("Contact Phone No") <> 10 THEN
            //             Error(PhoneNoCannotLessthan10charErr);
            //     END;
            // END;

        }
        field(50063; "Aggregate Shipping Charge"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50064; "Third Party Zip Code"; Code[20])
        {
            Caption = 'Third Party Zip Code';
            TableRelation = IF ("Ship-to Country/Region Code" = CONST('')) "Post Code"
            ELSE
            IF ("Ship-to Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Ship-to Country/Region Code"));

            ValidateTableRelation = false;
        }
        //OrderwiseChangeVY24082023
        field(50065; "Vendor_USPP"; Boolean)
        {
            //   DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = exist("Sales Line" where("Document No." = Field("No."), Vendor_Type = filter('US PRODUCTION PARTNER')));
            //     TableRelation = "Vendor Type"."Vendor code";
        }
        field(50066; "Vendor_iiD"; Boolean)
        {
            //   DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = exist("Sales Line" where("Document No." = Field("No."), "Charge Item" = filter(false), Vendor_Type = filter('IID FACILITY'), "In Production" = filter(false)));
            //     TableRelation = "Vendor Type"."Vendor code";
        }
        field(50067; "Proof awaiting Cust Approval"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = Filter(Order), "Document No." = field("No."), "Move to In Prodcution" = filter(false), "In Production" = filter(false), "Proof awaiting Cust Approval" = filter(true), Status = filter("Awaiting Customer Proof Approval")));
        }
        field(50068; "Needs Rivision"; Boolean)
        {
            Caption = 'Needs Revision USPP';
            // Editable = FALSE;
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Order), "Document No." = field("No."), "Cancelled Order" = FILTER(FALSE), "Proof Rejected" = filter(true)));
        }
        field(50069; "Proof Rejected Order"; Boolean)
        {
            // FieldClass = FlowField;
            // CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Order), "Document No." = field("No."), "Cancelled Order" = FILTER(FALSE), "Proof Rejected" = filter(true), Vendor_Type = filter('US PRODUCTION PARTNER')));
            Caption = 'Needs Revision USPP';
            DataClassification = CustomerContent;
        }
        field(50070; "Assigned To"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
            Caption = 'Assigned To USPP';
        }
        field(50071; "Proof Approve Order"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Order), "Document No." = field("No."), "Cancelled Order" = FILTER(FALSE), Status = filter("Customer Approved Paper Proof"), Vendor_Type = filter('US PRODUCTION PARTNER')));
            // DataClassification = CustomerContent;
        }
        field(50072; "Proof Approve Order iid"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Order), "Document No." = field("No."), "Cancelled Order" = FILTER(FALSE), Status = filter("Customer Approved Paper Proof"), Vendor_Type = filter('IID FACILITY')));
            // DataClassification = CustomerContent;
        }
        field(50073; "Proof Rejected IID"; Boolean)
        {
            Caption = 'Needs Revision IID';
            // Editable = FALSE;
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Order), "Document No." = field("No."), "Cancelled Order" = FILTER(FALSE), "Proof Rejected" = filter(true), Vendor_Type = filter('IID FACILITY')));
        }
        field(50074; "Proof Rejected USPP"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Order), "Document No." = field("No."), "Cancelled Order" = FILTER(FALSE), "Proof Rejected" = filter(true), Vendor_Type = filter('US PRODUCTION PARTNER')));
            Caption = 'Needs Revision USPP';
            // DataClassification = CustomerContent;
        }
        field(50075; "Proof awaiting Approval iD"; Boolean)
        {
            FieldClass = FlowField;
            Caption = 'Proof awaiting approval IID';
            CalcFormula = exist("Artwork" WHERE("Document Type" = Filter(Order), "Document No." = field("No."), "Proof awaiting Cust Approval" = filter(true), Status = filter("Awaiting Customer Proof Approval"), Vendor_Type = filter('IID FACILITY')));

        }
        field(50076; "Allow Payment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50077; "Approval Status"; enum "Approval Order Status")
        {
            DataClassification = ToBeClassified;
        }
        field(50078; "Fully Approved"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(50079; "SentToART DateTime"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(50080; "Assigned To IID"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
            Caption = 'Assigned To IID';
        }
        // PW NG 27102023 - START - Post Prepayments & Credit Memo >>>
        field(50081; "Email PrePayment Invoice"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50082; "Email PrePayment Credit Memo"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        // PW NG 27102023 - START - Post Prepayments & Credit Memo <<<
        // PW NG 1.0 14112023 START - Imprint ID - Waiting for prepayment Invoice - Once SO ack. is sent then order should move to 'Waiting For Prepayment Invoices' bucket >>>
        field(50083; "Is Revised prepayment"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50084; "Is Item available"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Sales Line" where("Document No." = field("No."), "No." = filter(<> ''), Type = const(Item)));
        }
        field(50085; "Prepayment Post"; Boolean)
        {
            DataClassification = CustomerContent;
        }

        field(50086; "Vendor_Overseas"; Boolean)
        {
            //   DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = exist("Sales Line" where("Document No." = Field("No."), "Charge Item" = filter(false), Vendor_Type = filter('OVERSEAS VENDOR')));
            //     TableRelation = "Vendor Type"."Vendor code";
        }
        field(50087; "Proof awaiting CustApp over"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = Filter(Order), "Document No." = field("No."), "Move to In Prodcution" = filter(false), "In Production" = filter(false), "Proof awaiting Cust Approval" = filter(true), Status = filter("Awaiting Customer Proof Approval"), Vendor_Type = filter('OVERSEAS VENDOR')));

        }
        field(50088; "Proof Rejected Overs"; Boolean)
        {
            Caption = 'Needs Revision Overs';
            // Editable = FALSE;
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Order), "Document No." = field("No."), "Cancelled Order" = FILTER(FALSE), "Proof Rejected" = filter(true), Vendor_Type = filter('OVERSEAS VENDOR')));
        }
        field(50089; "Proof Approve Order_Over"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Order), "Document No." = field("No."), "Cancelled Order" = FILTER(FALSE), "Move to In Prodcution" = filter(true), Status = filter("Customer Approved Paper Proof"), Vendor_Type = filter('OVERSEAS VENDOR')));
            // DataClassification = CustomerContent;
        }
        field(50090; "Artwork Status"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Artwork Status';
        }
        field(50091; "Payment Received"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50092; "Quote Sent Details"; Text[500])
        {
            DataClassification = CustomerContent;
        }
        field(50093; "Acknow Sent Details"; Text[500])
        {
            DataClassification = CustomerContent;
        }
        //>> PW MR 1.0 26122023
        field(50094; "Payment Status"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        //<<PW MR 1.0 26122023
        field(50095; "Last Payment Remainder Sent"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50096; "Factory Order Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50097; "Sales Order Number"; code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50098; "Payment Entry Posted"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50101; "Payment Bucket Filter"; Boolean)
        {

            DataClassification = CustomerContent;
        }
        field(50102; "PO No."; code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Header"."No." where("Sales Order No" = field("No.")));
        }
        field(50103; "Payment Status From Web"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50104; "Payment Details From Web"; Text[500])
        {
            DataClassification = CustomerContent;
        }
        field(50105; "Remaining Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        //Release order without payments comments
        field(50106; "Release Order Comments"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50107; "30Days filter Order Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50108; "PO No for Quote"; code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Header"."No." where("Sales Order No" = field("Sales Order Number")));
        }
        field(50109; "VIP Customer"; Boolean)
        {
            Caption = 'VIP Customer';
            DataClassification = CustomerContent;
        }

        field(50110; "Proof awaiting QuoteApproval"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = Filter(Quote), "Document No." = field("No."), "In Production" = filter(false), Status = filter("Awaiting Customer Proof Approval")));

        }
        field(50111; "Proof Rejected Quote"; Boolean)
        {
            // Editable = FALSE;
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Quote), "Document No." = field("No."), "Cancelled Order" = FILTER(FALSE), Status = filter("Customer Rejected Paper Proof")));
        }
        field(50112; "Proof ApproveQuote"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Quote), "Document No." = field("No."), "Cancelled Order" = FILTER(FALSE), Status = filter("Customer Approved Paper Proof" | "Proof Internally Approved")));
            // DataClassification = CustomerContent;
        }
        field(50113; "Sample Type"; enum "Sample Type")
        {
            DataClassification = ToBeClassified;
            InitValue = 1;
        }
        field(50114; "IID Shipping"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        // field(50115; AgingNew; Integer)
        // {
        //     FieldClass = FlowField;
        //     //CalcFormula=count("Sales Header"."Due Date"-Today)
        // }

        // PW NG 1.0 23042024 - Added for Account Buckets >>>
        field(50271; Aging; Integer)
        {
            Caption = 'AGING (DAYS)';
            DataClassification = CustomerContent;
        }
        field(50272; "Last Delivered"; Date)
        {
            Caption = 'LAST DELIVERED';
            DataClassification = CustomerContent;
        }
        field(50273; "Acc Notes"; Text[2048])
        {
            Caption = 'ACC NOTES';
            DataClassification = CustomerContent;
        }
        field(50274; "Balance"; Decimal)
        {
            Caption = 'BALANCE';
            DataClassification = CustomerContent;
        }
        field(50275; "Invoice No."; Code[20])
        {
            Caption = 'INVOICE NO.';
            DataClassification = CustomerContent;
        }
        field(50276; "Ready For Shipment"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50277; "Invoice Closed"; Boolean)
        {
            Caption = 'Invoice Closed';
            DataClassification = CustomerContent;
        }
        field(50278; WaitingPayWareBucketFilter; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50289; "Await Proof filter"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = Filter(Order), "Document No." = field("No."), "Sent To Art" = filter(true), Status = filter("Awaiting Proof")));

            // CalcFormula = exist("Artwork" WHERE("Document Type" = Filter(Order), "Document No." = field("No."), "Move to In Prodcution" = filter(false), "In Production" = filter(false), "Sent To Art" = filter(true), Status = filter("Awaiting Proof"), Vendor_Type = filter('OVERSEAS VENDOR')));
        }
        field(50290; "Vendor No."; Code[20])
        {
            DataClassification = CustomerContent;
            // FieldClass = FlowField;
            //  CalcFormula = lookup("Sales Line"."Buy-from Vendor No." where("Document Type" = field("Document Type"), "Document No." = Field("No.")));

        }
        field(50291; "Item Category"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50292; "PayFabric Transaction No."; Code[100])
        {
            DataClassification = CustomerContent;
        }
        field(50293; "Tracking no."; Text[2048])
        {
            Caption = 'Tracking Nos.';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Line"."Tracking no." where("Document Type" = field("Document Type"), "Document No." = Field("No."), "Tracking no." = filter(<> '')));

        }
        field(50294; "Show on Web"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50295; "Vendor No.New"; Code[20])
        {
            // DataClassification = CustomerContent;
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Line"."Buy-from Vendor No." where("Document Type" = field("Document Type"), "Document No." = Field("No."), "Buy-from Vendor No." = filter(<> '')));
        }
        field(50296; "Redu Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        //>>PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50297; "QuickBook ID"; Code[100])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 26th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50298; "QuickBook Error"; Text[2048])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 26th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50299; "QuickBook Sync Failed"; Boolean)
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 3rd Dec 2024 -- Field Added to map WebEx to BC
        field(50300; "Order Not sent to WebEx"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50301; "WebEx Response"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        //<<PW MR 3rd Dec 2024 -- Field Added to map WebEx to BC
        //>>PW MR 8th Dec 2024 -- Field Added to map QuickBook ID to BC
        field(50302; "Customer QuickBook ID"; Code[100])
        {
            //TableRelation = Location.Code;
        }
        field(50303; "Ready for QuickBook"; boolean)
        {

        }
        //<<PW MR 8th Dec 2024 -- Field Added to map QuickBook ID to BC
        field(50304; "Invoiced in QuickBook"; boolean)
        {

        }
        field(50305; "Blank Order Ready To Ship"; Boolean)
        {
            DataClassification = CustomerContent;
        }

        field(50306; "WebEx Sync Failed"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Integration Logs" where("Order No." = field("No."), Failed = filter(true)));
            Editable = false;
        }
        field(50307; "Sales Rep"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Artist Name".Name;
        }

        // field(50294; "Quote Sent to Show Web"; Boolean)
        // {
        //     DataClassification = CustomerContent;
        // }
        // field(50294; "Vendor No.New"; Code[20])
        // {
        //     // DataClassification = CustomerContent;
        //     FieldClass = FlowField;
        //     CalcFormula = lookup("Sales Line"."Buy-from Vendor No." where("Document Type" = field("Document Type"), "Document No." = Field("No.")));

        // }

        // field(50278; "Random sampleIID"; Boolean)
        // {
        //     DataClassification = CustomerContent;
        // }
        // PW NG 1.0 23042024 - Added for Account Buckets <<<
        // field(50068; "Needs Rivision"; Boolean)
        // {
        //     Caption = 'Needs Rivision USPP';
        //     // Editable = FALSE;
        //     FieldClass = FlowField;
        //     CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Order), "Document No." = field("No."), "Cancelled Order" = FILTER(FALSE), "Proof Rejected" = filter(true)));
        // }
        // PW NG 1.0 14112023 END - Imprint ID - Waiting for prepayment Invoice - Once SO ack. is sent then order should move to 'Waiting For Prepayment Invoices' bucket <<<

        //   field(50072; "Proof awaiting Cust "; Boolean)
        // {
        //     FieldClass = FlowField;
        //     CalcFormula = exist("Artwork" WHERE("Document Type" = Filter(Order), "Document No." = field("No."), "Proof awaiting Cust Approval" = filter(true)));

        // }
        // field(50106; "No Proof Required Order"; Integer)
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = count("Artwork" WHERE("Proof Required" = filter(False), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
        //     Caption = 'No Proof Required';
        // }
        //OrderwiseChangeVY24082023


        field(50308; "Vendor_XB"; Boolean)
        {
            //   DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = exist("Sales Line" where("Document No." = Field("No."), "Charge Item" = filter(false), Vendor_Type = filter('X-BRANDS VENDOR')));
            //     TableRelation = "Vendor Type"."Vendor code";
        }
        field(50309; "Proof Rejected XB"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Order), "Document No." = field("No."), "Cancelled Order" = FILTER(FALSE), "Proof Rejected" = filter(true), Vendor_Type = filter('X-BRANDS VENDOR')));
            Caption = 'Needs Revision XB';
            // DataClassification = CustomerContent;
        }
        field(50310; "Blind Shipment"; Boolean)
        {
            DataClassification = CustomerContent;
        }

        field(50311; "Invoice Email Sent from QB"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50312; "Ready to be Invoiced from QB"; Boolean)
        {
            Caption = 'Ready to email invoice from QB';
            DataClassification = CustomerContent;
        }
        field(50313; Reference; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50314; "Shipping Notes"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50315; "QB Payment URL"; Text[2048])
        {
            DataClassification = CustomerContent;
        }

        field(50316; "Paid Amount"; Decimal)
        {
            Caption = 'Paid Amount';
            FieldClass = FlowField;
            CalcFormula = Sum("Cust. Ledger Entry".Amount where("Document No." = field("No."), "Document Type" = const(Payment)));
            Editable = false;
        }
        field(50317; "Refund Amount"; Decimal)
        {
            Caption = 'Refund Amount';
            FieldClass = FlowField;
            CalcFormula = Sum("Cust. Ledger Entry".Amount where("Document No." = field("No."), "Document Type" = const(Refund)));
            Editable = false;
        }
        field(50318; "Customer Refund"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50319; "Customer Refund Updated in QB"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50320; "PO Mail Sent"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50321; "PendingPOStatusFilter"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Sales Line" where("Document No." = Field("No."), "Vendor Portal Status" = filter('Pending PO Conversion')));
        }
        field(50322; "Proof Approve Order_Xbrand"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Order), "Document No." = field("No."), "Cancelled Order" = FILTER(FALSE), "Move to In Prodcution" = filter(true), Status = filter("Customer Approved Paper Proof"), Vendor_Type = filter('X-BRANDS VENDOR')));
            // DataClassification = CustomerContent;
        }

        field(50324; Brand; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Line".Brand where("Document Type" = field("Document Type"), "Document No." = Field("No."), "Charge Item" = filter(false)));
        }
        field(50325; "ShippingChargeBI"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Sales Line" where("Document No." = Field("No."), "Shipping Charges" = filter(true), "Is Item changed" = filter(true)));
        }
        field(50326; "ItemChargeBI"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Sales Line" where("Document No." = Field("No."), "Shipping Charges" = filter(false), "Is Item changed" = filter(true)));
        }
        field(50327; "ShippingChargeBIValue"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Amount Including VAT" where("Document No." = Field("No."), "Shipping Charges" = filter(true), "Is Item changed" = filter(true)));
        }
        field(50328; "ItemChargeBIValue"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Amount Including VAT" where("Document No." = Field("No."), "Shipping Charges" = filter(false), "Is Item changed" = filter(true)));
        }


        modify("Bill-to Post Code")
        {
            Caption = 'Bill-to Zip Code';
        }
        modify("Sell-to Post Code")
        {
            Caption = 'Sell-to Zip Code';
        }
        modify("Ship-to Post Code")
        {
            Caption = 'Ship-to Zip Code';
        }
    }
    // keys
    // {
    //     key(mykey2; "Sell To Contact NameNew", "Sell To Email New")
    //     { }
    // }
    // fieldgroups
    // {
    //     addlast(DropDown; "Sell To Contact NameNew", "Sell To Email New")
    //     { }
    // }

    // trigger OnInsert()
    // begin
    //     Rec."Order Insert" := true;
    // end;

    // trigger OnModify()
    // begin
    //     Rec."Order Modify" := true;
    // end;
}