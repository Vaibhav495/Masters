table 50105 Imprint_Options
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; code; Code[80])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(pk; code)
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