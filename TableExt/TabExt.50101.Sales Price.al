tableextension 50101 TabExtSalesPrice extends "Sales Price"
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
        field(50006; "PriceBreakName"; Text[100])
        {
            Caption = 'Price Break Name';
            DataClassification = ToBeClassified;

        }

    }


    var


}