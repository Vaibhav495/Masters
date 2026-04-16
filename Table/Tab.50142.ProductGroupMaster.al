table 50142 "Product Group Master"
{
    Caption = 'Product Group Master';
    DataCaptionFields = "Group Code", Description;
    DrillDownPageId = "Product Group List";
    LookupPageId = "Product Group List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Group Code"; Code[20])
        {
            Caption = 'Group Code';
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
        key(PK; "Group Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Group Code", Description) { }
    }

}
