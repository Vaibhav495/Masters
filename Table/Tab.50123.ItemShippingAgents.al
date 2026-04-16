table 50123 "Item Shipping Agent"
{
    Caption = 'Item Shipping Agent';
    DataCaptionFields = "Code", Location, "Shipping Agent ServiceCode";
    DrillDownPageID = "Item Shipping Agent";
    LookupPageID = "Item Shipping Agent";


    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
            DataClassification = CustomerContent;

        }
        field(2; "Location"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Location.Code;
        }
        field(3; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;

        }
        field(4; "Internet Address"; Text[250])
        {
            Caption = 'Internet Address';
            ExtendedDatatype = URL;
            DataClassification = CustomerContent;

        }
        field(5; "Account No."; Text[30])
        {
            Caption = 'Account No.';
        }
        field(6; "Coupled to CRM"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Coupled to Dataverse';
            Editable = false;
        }
        field(7; "Address Not Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Shipping Agent ServiceCode"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code;// WHERE("Shipping Agent Code" = FIELD("Shipping Agent ServiceCode"));
        }
    }
    keys
    {
        key(Key1; "Code", Location, "Shipping Agent ServiceCode")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", "Shipping Agent ServiceCode")
        {
        }
    }


}

