table 50118 ArtworkStatusLog
{
    Caption = 'Artwork Status Log';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            MinValue = 0;
            DataClassification = CustomerContent;
        }
        field(2; "Art Id"; Code[20])
        {
            Caption = 'Art Id';
            DataClassification = CustomerContent;

        }
        field(3; "Order No"; Code[20])
        {
            Caption = 'Order No';
            DataClassification = CustomerContent;
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
        }
        field(5; "Variant Code"; Code[100])
        {
            Caption = 'Product Colors';
            DataClassification = CustomerContent;
        }
        field(6; "Order Line"; Integer)
        {
            Caption = 'Order Line';
            DataClassification = CustomerContent;
        }
        field(7; "Status Code"; Code[50])
        {
            Caption = 'Status Code';
            DataClassification = CustomerContent;
        }
        field(8; Status; Text[100])
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(9; Date; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(10; "User Id"; Code[50])
        {
            Caption = 'User Id';
            DataClassification = CustomerContent;
        }
        field(11; CurrentDateTime; DateTime)
        {
            Caption = 'CurrentDateTime';
            DataClassification = CustomerContent;
        }
        field(12; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
            DataClassification = CustomerContent;
        }
        field(13; "Imprint Location"; Code[50])
        {
            Caption = 'Imprint Location';
            DataClassification = CustomerContent;

        }
        field(14; "Imprint Method"; Code[20])
        {
            Caption = 'Imprint Method';
            DataClassification = CustomerContent;
        }
        field(15; "Artist Comment"; Text[1048])
        {
            DataClassification = CustomerContent;
            // Caption = 'Note To Customer';
        }
        field(16; "Customer Comments"; Text[1048])
        {
            DataClassification = CustomerContent;
            //  Caption = 'Note To Customer';
        }
        field(17; "Tracking No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Customer PO#"; Code[35])
        {
            DataClassification = CustomerContent;
            //FieldClass = FlowField;
            // CalcFormula = lookup("Sales Header"."External Document No." where("Document Type" = field("Document Type"), "No." = field("Order No")));
            Caption = 'Customer PO';
        }
        field(19; "PO No."; Code[35])
        {
            DataClassification = CustomerContent;
            // FieldClass = FlowField;
            // CalcFormula = lookup("Sales Line"."Purchase Order No." where("Document No." = Field("Order No"), "Line No." = field("Order Line")));
        }
        field(20; "Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Product Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Latest Status"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; Quantity; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(24; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Contact No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50042; "Sell To Email"; Text[100])
        {
            ExtendedDatatype = EMail;
            DataClassification = ToBeClassified;
        }
        field(50043; "Payment Status"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50044; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50045; "Shipping Agent Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50046; "Shipping Agent Service Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50047; "Line Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50048; "Paid"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50049; "Invoice No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50050; "Art Approve Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50051; "Art Sent Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50052; "Release Order Comments"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        // PW NG 1.0 08072024 - Tracking shipping >>>
        field(50076; "Tracking nos."; Text[2048])
        {
            Caption = 'Tracking Nos.';
            DataClassification = CustomerContent;
        }
        // PW NG 1.0 08072024 - Tracking shipping <<<
        field(50053; "Customer Signature"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(26; "Rejected Proof"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Payment StatusNew"; Text[100])
        {
            // DataClassification = CustomerContent;
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."Payment Status" where("No." = field("Order No")));
            Caption = 'Payment Status';
        }
        field(28; "Order Created At"; DateTime)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header".SystemCreatedAt where("No." = field("Order No")));
        }
        field(29; "Sample Type"; enum "Sample Type")
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."Sample Type" where("Document Type" = field("Document Type"), "No." = field("Order No")));
        }
        field(30; "Credit On Hold"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."Credit on Hold" where("Document Type" = field("Document Type"), "No." = field("Order No")));
        }
        field(31; PrePaymentOrder; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."Payment Bucket Filter" where("Document Type" = field("Document Type"), "No." = field("Order No")));
        }
        field(32; "Quote No"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."Quote No." where("Document Type" = field("Document Type"), "No." = field("Order No")));
        }
        field(33; Invoice; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header".Invoice where("Document Type" = field("Document Type"), "No." = field("Order No")));
        }
        field(34; "Show on web"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = lookup(ArtOrderStatus."Show on web" where("Status Code" = field("Status Code")));
        }

    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}
