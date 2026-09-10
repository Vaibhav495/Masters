table 50313 "Vendor Inven Color Error Log"
{
    Caption = 'Vendor Inventory Color Log';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }

        field(2; "BC Item No."; Code[20])
        {
            Caption = 'BC Item No.';
        }

        field(3; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
        }

        field(4; "Vendor Product Code"; Text[100])
        {
            Caption = 'Vendor Product Code';
        }

        field(5; "Vendor Color Name"; Text[100])
        {
            Caption = 'Vendor Color Name';
        }

        field(6; "Error Message"; Text[250])
        {
            Caption = 'Error Message';
        }

        field(7; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}