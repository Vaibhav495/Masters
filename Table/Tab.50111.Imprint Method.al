table 50111 "Imprint Method"
{
    DataClassification = CustomerContent;
    LookupPageId = "Imprint Method List";
    Caption = 'Imprint Method';
    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';
        }
        field(2; "Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
        field(3; Description; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(4; "Color Required"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Color Required';
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Code, Name, "Color Required")
        {
        }
        fieldgroup(Brick; Code, Name, "Color Required")
        {
        }
    }
}