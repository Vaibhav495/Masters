table 50121 "Customer Type"
{
    DataClassification = CustomerContent;
    LookupPageId = "Customer Type";
    DrillDownPageId = "Customer Type";
    fields
    {
        field(1; Code; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; Code)
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