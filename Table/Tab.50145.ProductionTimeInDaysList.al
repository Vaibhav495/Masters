// PW NG 1.0 23102023 - Item Sync <<< 
table 50145 "Production Time In Days List"
{
    Caption = 'Production Time In Days List';
    DrillDownPageId = "Production Time In Days";
    LookupPageId = "Production Time In Days";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Code, Description) { }
        fieldgroup(Brick; Code, Description) { }
    }
}
// PW NG 1.0 23102023 - Item Sync <<< 
