table 50122 "Item Imprint Location Master"
{
    DataClassification = ToBeClassified;
    Caption = ' Imprint Location Master';

    fields
    {
        field(1; code; code[20])
        {
            Caption = 'Imprint Location Code';
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Reverse Side"; Boolean)
        {
            Caption = 'Reverse Side';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; code)
        {
            Clustered = true;
        }
    }
    var
        myInt: Integer;

    trigger OnInsert()
    begin
    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;
}
