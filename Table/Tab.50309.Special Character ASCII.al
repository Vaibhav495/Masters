table 50309 "Special Character ASCII"
{

    LookupPageId = "Special Character ASCII List";
    DrillDownPageId = "Special Character ASCII List";
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; "Special Character"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "ASCII"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Encoded Value';
        }

    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }

    }
    fieldgroups
    {
        fieldgroup(DropDown; "Special Character", ASCII)
        { }
    }

}
