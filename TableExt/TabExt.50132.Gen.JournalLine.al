tableextension 50132 GenJournalLineExt extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "Online Payment"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50001; "Transaction Key"; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}