table 50104 "Imprint Color"
{
    LookupPageId = "Imprint Colors";
    DataClassification = CustomerContent;
    Caption = 'Imprint Color';

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';
        }
        field(2; Name; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
        field(3; "PMS Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'PMS Code';
        }
        field(4; "PMS Match"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'PMS Match';
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
        fieldgroup(DropDown; Code, Name, "PMS Code", "PMS Match")
        { }
    }


}