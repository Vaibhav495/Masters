table 50107 "Freight Parameters"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Shipper Street Address"; Text[70])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Shipper City"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Shipper State"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Shipper Country"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Shipper Zip Code"; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Recipient Street Address"; Text[70])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Recipient City"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Recipient State"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Recipient Country"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Recipient Zip Code"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Package Length"; text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Package Width"; text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Package Height"; text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "IsResidentialDelivery"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Sales Order Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Carton Capacity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Carton Count"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Exported to XML"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; Residential; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; IsShipment; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Shipment Sequence"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Shipment No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Package Weight"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50100; "Shipment Method"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Shipper Address 1"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Shipper Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Shipper Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Shipper Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Recipient Address 1"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50106; "Recipient Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "Recipient Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "Recipient Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50109; "Shipper Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "Recipient Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "Shipment Date"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50112; "Insured Shipment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50113; "Declared Value"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.", "No.", "Shipment Sequence")
        {
            Clustered = True;
        }
    }
}