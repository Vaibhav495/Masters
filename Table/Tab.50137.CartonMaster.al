table 50137 "Carton Master"
{
    Caption = 'Carton Master';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Carton Code"; code[50])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Carton Name"; text[50])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Item No."; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = Item."No.";
        }
        Field(4; Length; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(5; Width; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(6; Height; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(7; Volume; Decimal)
        {
            DataClassification = CustomerContent;
        }
        Field(8; "Length Inches"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(9; "Width Inches"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(10; "Height Inches"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(11; "Carton CBMS"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        // field(15; ItemNo; Integer)
        // {
        //     DataClassification = CustomerContent;
        //     AutoIncrement = true;
        // }
    }
    keys
    {
        key(PK; "Carton Code", "Item No.")
        {
            Clustered = true;
        }
    }

}
