tableextension 50303 CLEExt extends "Cust. Ledger Entry"
{
    fields
    {

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