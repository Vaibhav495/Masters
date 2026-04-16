table 50116 Fabric
{
    DataClassification = CustomerContent;
    Caption = 'Fabric';
    fields
    {
        field(1; Code; code[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';
        }
        field(2; Description; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
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
        fieldgroup(DropDown; Code, Description)
        {

        }
    }


}