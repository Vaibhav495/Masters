tableextension 50126 Ext50126SalesInvHeader extends "Sales Invoice Header"
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
        // field(50036; "Rush Options"; Option)
        // {
        //     DataClassification = ToBeClassified;
        //     OptionMembers = "Same Day","1 Work Day","2 Work Day","3 Work Day","4 Work Day";

        //     //<<<<<Sales
        // }
        field(50037; "Ship-To-Phone No."; Integer)
        {
            DataClassification = ToBeClassified;
            //  Enabled = false;
        }
        field(50038; Order_Type; Option)
        {
            CaptionML = ENU = 'Order Type';
            OptionCaptionML = ENU = 'Standard,Urgent Order,Super Urgent Order';
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
            TableRelation = IF ("Sell-to Customer Name" = filter('')) Contact."No."
            ELSE
            Contact."No." where("Company Name" = field("Sell-to Customer Name"));
            // TableRelation = Contact."No." where("Company Name" = field("Sell-to Customer Name"));
        }
        field(50042; "Sell To Email New"; Text[100])
        {
            ExtendedDatatype = EMail;
            DataClassification = ToBeClassified;
            TableRelation = IF ("Sell-to Customer Name" = filter('')) Contact."No."
            ELSE
            Contact."No." where("Company Name" = field("Sell-to Customer Name"));
            // TableRelation = Contact."No." where("Company Name" = field("Sell-to Customer Name"));
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
        field(50047; "Cancelled Comments"; Text[1048])
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

        }
        field(50061; "Payment Method Code 2"; Code[10])
        {
            TableRelation = "Payment Method".code;

        }
        field(50062; "Contact Phone No"; Text[30])
        {

            ExtendedDatatype = PhoneNo;
            TableRelation = IF ("Sell-to Customer Name" = filter('')) Contact."No."
            ELSE
            Contact."No." where("Company Name" = field("Sell-to Customer Name"));
        }
        field(50064; "Third Party Zip Code"; Code[20])
        {
            Caption = 'Third Party Zip Code';
            // TableRelation = IF ("Ship-to Country/Region Code" = CONST('')) "Post Code"
            // ELSE
            // IF ("Ship-to Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Ship-to Country/Region Code"));

            // ValidateTableRelation = false;

        }
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
        field(50090; "Artwork Status"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Artwork Status';
        }
        field(50094; "Payment Status"; Text[100])
        {
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
        field(50296; "Redu Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 23042024 - Added for Account Buckets <<<
        field(50292; "PayFabric Transaction No."; Code[100])
        {
            DataClassification = CustomerContent;
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
        field(50307; "Sales Rep"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Artist Name".Name;
        }
        // field(50308; "Vendor_XB"; Boolean)
        // {
        //     //   DataClassification = ToBeClassified;
        //     // FieldClass = FlowField;
        //     // CalcFormula = exist("Sales Line" where("Document No." = Field("No."), Vendor_Type = filter('X-BRANDS VENDOR')));
        //     // //     TableRelation = "Vendor Type"."Vendor code";
        // }
        // field(50309; "Proof Rejected XB"; Boolean)
        // {
        //     FieldClass = FlowField;
        //     CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Order), "Document No." = field("No."), "Cancelled Order" = FILTER(FALSE), "Proof Rejected" = filter(true), Vendor_Type = filter('X-BRANDS VENDOR')));
        //     Caption = 'Needs Revision XB';
        //     // DataClassification = CustomerContent;
        // }

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

    var
        myInt: Integer;
}