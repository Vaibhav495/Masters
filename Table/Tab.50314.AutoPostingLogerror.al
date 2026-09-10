table 50314 "Auto Invoice Posting Log"
{
    Caption = 'Auto Invoice Posting Log';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }

        field(2; "Sales Order No."; Code[20])
        {
            Caption = 'Sales Order No.';
        }

        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }

        field(4; "Posting Time"; Time)
        {
            Caption = 'Posting Time';
        }

        field(5; "Error Message"; Text[2048])
        {
            Caption = 'Error Message';
        }

        field(6; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }

        key(SalesOrder; "Sales Order No.")
        {
        }

        key(PostingDate; "Posting Date")
        {
        }
    }
}