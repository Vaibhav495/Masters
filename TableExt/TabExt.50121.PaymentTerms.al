tableextension 50121 TabExtPaymentTerms extends "Payment Terms"
{
    fields
    {
        field(50001; "Credit Limit Check"; Boolean)
        {
            DataClassification = CustomerContent;

        }
        field(50002; "Credit Limit"; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(50003; "Prepayment %"; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(50004; "Payment Check"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        // For bucket filter created PUAA&PUR
        field(50005; "Payment Remainder"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        // For bucket filter created PUAA&PUR

        field(50006; "Payment Remainder On"; DateFormula)
        {
            DataClassification = CustomerContent;
        }
        //>>PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50007; "QuickBook ID"; Code[100])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 26th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50008; "QuickBook Error"; Text[2048])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 26th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50009; "QuickBook Sync Failed"; Boolean)
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC

    }

    var
        myInt: Integer;
}