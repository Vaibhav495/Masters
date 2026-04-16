table 50310 "Vendor API Setup"
{
    DataClassification = ToBeClassified;
    Caption = 'Vendor API Setup';

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }

        field(2; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
        }

        field(3; "Base URL"; Text[250])
        {
            Caption = 'API Base URL';
        }

        field(4; "API Key"; Text[250])
        {
            Caption = 'API Key';
        }

        field(5; "API Secret"; Text[250])
        {
            Caption = 'API Secret';
        }

        field(6; "Auth Token"; Text[250])
        {
            Caption = 'Auth Token';
        }

        field(7; "Inventory Endpoint"; Text[250])
        {
            Caption = 'Inventory Endpoint';
        }

        field(8; "Is Active"; Boolean)
        {
            Caption = 'Active';
        }

        field(9; "Last Sync DateTime"; DateTime)
        {
            Caption = 'Last Sync Date';
        }
    }

    keys
    {
        key(PK; "Vendor No.")
        {
            Clustered = true;
        }
    }
}