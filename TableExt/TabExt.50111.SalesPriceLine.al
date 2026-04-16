tableextension 50111 SalesPrice50111 extends "Price List Line"
{
    fields
    {
        field(50000; "Catlog Code"; Code[10])
        {
            Caption = 'Discount Code';
            DataClassification = ToBeClassified;
            TableRelation = Relative.Code;

        }
        field(50001; "Web Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(50003; "Imprint Method"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Imprint Method".Code;
            //  TableRelation = IF (Type = CONST(Item)) "Item Imprint Location"."Imprint Method" WHERE("Item No." = FIELD("Item No."));
        }

        field(50005; "Entered Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50006; "Rush Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;

        }
        field(50007; "Super Rush Price"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        // PW NG 1.0 23102023 - Item Sync >>>
        field(50008; IsActive; Boolean)
        {
            Caption = 'Is Active';
            DataClassification = ToBeClassified;
        }
        field(50009; IsRegularPrice; Boolean)
        {
            Caption = 'Is Regular Price';
            DataClassification = ToBeClassified;
        }
        field(50010; IsCallForPrice; Boolean)
        {
            Caption = 'Is CallFor Price';
            DataClassification = ToBeClassified;
        }
        field(50011; StrikePrice; Decimal)
        {
            Caption = 'Strike Price';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
        }
        field(50012; WebExpirationDate; Date)
        {
            Caption = 'Web Expiration Date';
            DataClassification = ToBeClassified;
        }

        // PW NG 1.0 23102023 - Item Sync <<< 

        field(50013; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(50014; "Selection Imprint Method"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "Vendor Price"; decimal)
        {
            DataClassification = ToBeClassified;
            AutoFormatType = 2;
            MinValue = 0;
        }
        field(50016; "Vendor Rush Cost"; decimal)
        {
            DataClassification = ToBeClassified;
            AutoFormatType = 2;
            MinValue = 0;
        }
        field(50017; "PriceBreakName"; Text[100])   // PW NG 1.0 23102023 - Item Sync <<< 
        {
            Caption = 'Price Break Name';
            DataClassification = ToBeClassified;

        }
        field(50018; "NoteText"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "NoteText2"; Text[2048])
        {
            DataClassification = ToBeClassified;

        }
        field(50020; "Price Attributes"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Web Sales Price Attribute".Code where("Item No." = field("Product No."));
        }
        field(50021; "Price Attributes Seq"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Price Attributes Sequence';
        }
        // PW NG 1.0 23102023 - Item Sync <<< 

        field(50022; "Rush LP"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Rush LP';

        }
        field(50023; "Super Rush LP"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Super Rush LP';

        }
        field(50024; "Rush Discount SP"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Relative.Code;
            Caption = 'Rush Discount Code';
        }
        field(50025; "SuperRush Discount SP"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Relative.Code;
            Caption = 'Super Rush Discount Code';
        }
        field(50026; "Rush SP on web"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Rush LP on Web';
        }
        field(50027; "Super Rush SP onweb"; Decimal)
        {
            DataClassification = ToBeClassified;
            ObsoleteReason = 'not used for imprint ID website Sync';
            ObsoleteState = Pending;
        }
        field(50028; "Super Rush LP on web"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Super Rush LP on Web';

        }
        field(50029; "Super Rush Price Attribute"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Super Rush Price Attributes';
        }
        field(50030; "Rush Price Attribute"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Rush Price Attributes';
        }
        field(50031; "PriceBreakNameNew"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }


}