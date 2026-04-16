table 50111 "Imprint Method"
{
    DataClassification = CustomerContent;
    LookupPageId = "Imprint Method List";
    Caption = 'Imprint Method';
    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';
        }
        field(2; "Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
        field(3; Description; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(4; "Color Required"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Color Required';
        }
        field(5; "Max Imprint Color"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Max Imprint Color';
        }
        field(6; "Run Charge"; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(7; "SETUP Charge"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(8; "No of Imprint Colors"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(9; "Max No of Imprint Colors"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(10; "Sales Price Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Price List Line"."Unit Price";
        }
        field(11; "Discount Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Relative.Code;
        }
        field(12; "Web Run Charge"; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(13; "Web SETUP Charge"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(14; "Vendor No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = vendor."No."; //; where("Item No." = field("No."));
        }
        field(15; "Imprint color"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Imprint Color".Code;
        }
        field(16; Default; Boolean)
        {
            DataClassification = ToBeClassified;

        }
    }
    keys
    {
        key(PK; Code, "Vendor No.")
        {
            Clustered = true;
        }
        // key(key2; Default)
        // {
        // }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Code, Name, "Color Required")
        {
        }
        fieldgroup(Brick; Code, "Vendor No.", Name, "Color Required")
        {
        }
    }
}