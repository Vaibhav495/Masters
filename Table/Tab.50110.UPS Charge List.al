table 50110 "UPS Charge  List"
{
    fields
    {
        field(1; "Primary Key"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = True;
        }
        field(2; "Charge Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Charge Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Select; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Quote,Order';
            OptionMembers = Quote,Order;
        }
        field(6; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Charge Code"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Shipment Sequence"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Shipment No."; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Document No."; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50000; "Delivery Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Intransit Bussiness Day"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        Key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}