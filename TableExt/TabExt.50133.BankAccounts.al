tableextension 50133 BankAccounts extends "Bank Account"
{
    fields
    {
        field(50501; "Default Bank"; Boolean)
        {
            DataClassification = ToBeClassified;
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