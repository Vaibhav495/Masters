table 50131 "Vendor Type"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Serial No"; Integer)
        {
            DataClassification = ToBeClassified;


        }
        field(2; "Vendor code"; Code[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Vendor Name"; Text[250])
        {
            DataClassification = ToBeClassified;


        }

    }
    keys
    {
        key(PK; "Serial No", "Vendor code")
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
