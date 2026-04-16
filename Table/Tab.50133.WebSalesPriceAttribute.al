table 50133 "Web Sales Price Attribute"
{
    Caption = 'Web Sales Price Attribute';
    DrillDownPageId = "Sales Price Attribute";
    LookupPageId = "Sales Price Attribute";
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
            ValidateTableRelation = false;//0603
            TableRelation = "Imprint Method".Code; //0603
        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
            DataClassification = CustomerContent;
        }
        field(10; Name; Text[2048])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Code", "Item No.", Name)//0603`
        {
            Clustered = true;
        }
    }
}
