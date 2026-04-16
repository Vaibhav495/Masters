table 50143 "Product Key Master"
{
    Caption = 'Product Key Master';
    DataCaptionFields = "Product Key Code", Description;
    DrillDownPageId = "Product Key List";
    LookupPageId = "Product Key List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Product Key Code"; Code[20])
        {
            Caption = 'Product Key Code';
            DataClassification = CustomerContent;
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Product Key Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Product Key Code", Description) { }
    }
}
