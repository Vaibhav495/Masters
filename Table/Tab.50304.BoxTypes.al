table 50304 "Box Types"
{

    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; "Box Type"; text[50])
        {
            DataClassification = CustomerContent;
        }
        Field(4; Value; Decimal)
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.", "Box Type")
        {
            Clustered = true;
        }
    }

}
