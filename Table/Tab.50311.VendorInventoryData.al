table 50312 "Vendor Inventory Data"
{
    Caption = 'Vendor Inventory Color Data';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }

        field(2; "BC Item No."; Code[20])
        {
        }

        field(3; "BC Variant Code"; Code[20])
        {
        }

        field(4; "Vendor Product Code"; Text[100])
        {
        }

        field(5; "Vendor Color Name"; Text[100])
        {
        }

        field(6; "Label Size"; Text[100])
        {
        }

        field(7; "Vendor No"; Code[20])
        {
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