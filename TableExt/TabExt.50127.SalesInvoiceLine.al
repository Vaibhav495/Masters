tableextension 50127 Ext50127SalesInvLine extends "Sales Invoice Line"
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
            // TableRelation = "Ship To Address split"."Ship-to Code" where("Document No" = field("Document No."), "Item No" = field("No."));
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
            TableRelation = "Category Imprint_M_Matrix"."Imprint Method";// where("Item Category" = field("Item Category"), "Item sub Category" = field("Item sub Category"), "Item sub sub Category" = field("Item sub sub Category"));
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
            Caption = 'Shipping Agent Code';
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

        }
        field(50036; "Item sub Category"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50037; "Item sub sub Category"; Code[20])
        {
            DataClassification = ToBeClassified;

        }

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
        // PW NG 1.0 08072024 - Tracking shipping >>>
        field(50076; "Tracking no."; Text[2048])
        {
            Caption = 'Tracking Nos.';
            DataClassification = CustomerContent;
        }
        field(50077; "Price Attributes"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Web Sales Price Attribute".Code where("Item No." = field("No."));
        }
        // PW NG 1.0 08072024 - Tracking shipping <<<


        field(50081; "Xbrand Flag"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50082; Brand; Code[100])
        {
            DataClassification = CustomerContent;
        }
    }

    var
        myInt: Integer;
}