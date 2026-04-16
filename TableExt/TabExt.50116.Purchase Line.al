tableextension 50116 PurchaseLine extends "Purchase Line"
{
    fields
    {
        field(50001; "Vendor Invoice Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Art ID"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Charge Item"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Charge Type"; Enum "Charge Type")
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 14082023  START- Added for Vendor Portal Integration to maintain the web status
        field(50005; "Order Status"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 14082023  END- Added for Vendor Portal Integration to maintain the web status

        field(50006; "Imprint Method"; Code[50])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = IF (Type = CONST(Item)) "Item Imprint Location"."Imprint Method" WHERE("Item No." = FIELD("No."));
            TableRelation = "Category Imprint_M_Matrix"."Imprint Method" where("Item No." = field("No."));//("Item Category" = field("Item Category"), "Item sub Category" = field("Item sub Category"), "Item sub sub Category" = field("Item sub sub Category"));

        }
        field(50007; "Charge Code"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Suggested Unit Price VendorP"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 AP - Buckets >>>
        field(50066; "Vendor_Type"; code[100])
        {
            DataClassification = ToBeClassified;

        }
        field(50067; "Vendor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50068; "Contact Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50069; "Bill Amount"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            DataClassification = ToBeClassified;
        }
        field(50070; "Open Balance"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            DataClassification = ToBeClassified;
        }
        field(50071; "Bill Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50072; "Invoiced Closed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 AP - Buckets <<<
        // PW NG 1.0 14052024 - Flow Shipping agent and service code form SO to PO >>>
        field(50073; "Shipping Agent Code"; Code[10])
        {
            AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
            trigger OnValidate()
            begin
                TestStatusOpen();
                if "Shipping Agent Code" <> xRec."Shipping Agent Code" then
                    Validate("Shipping Agent Service Code", '');
            end;
        }
        field(50074; "Shipping Agent Service Code"; Code[10])
        {
            AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code where("Shipping Agent Code" = field("Shipping Agent Code"));
            trigger OnValidate()
            begin
                TestStatusOpen();
            end;
        }
        // PW NG 1.0 14052024 - Flow Shipping agent and service code form SO to PO <<<


        field(50075; "Ref. Item No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50076; "Ref. Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(50077; "Show vendor portal"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50078; "SO No.WebEx"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50079; "SO Line No.WebEx"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50080; Accessory; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50081; "Price Attributes"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Web Sales Price Attribute".Code where("Item No." = field("No."));
        }
        field(50082; "Shipping Charges"; Boolean)
        {
            Caption = 'Is Shipping Charge Calculated';
            DataClassification = ToBeClassified;
        }
        //>>
        field(50100; "Vendor Decoration Price"; decimal)
        {
            Caption = 'Decoration Cost';
            DataClassification = ToBeClassified;
            AutoFormatType = 2;
            MinValue = 0;
        }
        field(50101; "Vendor Blank Price"; decimal)
        {
            DataClassification = ToBeClassified;
            AutoFormatType = 2;
            MinValue = 0;
        }
        field(50102; "Vendor Price"; decimal)
        {
            DataClassification = ToBeClassified;
            AutoFormatType = 2;
            MinValue = 0;
        }
        //<<
        field(50103; "WebEx Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }


}