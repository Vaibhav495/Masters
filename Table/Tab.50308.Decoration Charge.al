table 50308 "Decoration Charge"
{

    LookupPageId = "Decoration Charge";
    DrillDownPageId = "Decoration Charge";
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; "Imprint Method"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Imprint Method".Code;

        }
        field(3; "Decoration Cost"; Decimal)
        {
            DataClassification = ToBeClassified;


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
        fieldgroup(DropDown; "Imprint Method", "Decoration Cost")
        { }
    }

}
