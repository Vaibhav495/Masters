table 50135 "Shipping Setup UPS"
{
    Caption = 'Shipping Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }

        field(10; "UPS Freight Charge Url"; Text[500])
        {
            Caption = 'UPS Freight Charge Url';
            DataClassification = CustomerContent;
        }
        field(14; "UPS User Name"; Text[16])
        {
            Caption = 'UPS User Name';
            DataClassification = CustomerContent;
        }
        field(15; "UPS User Password"; Text[26])
        {
            Caption = 'UPS User Password';
            DataClassification = CustomerContent;
        }
        field(16; "UPS Access License Number"; Text[16])
        {
            Caption = 'UPS Access License Number';
            DataClassification = CustomerContent;
        }
        field(17; "UPS Account Number"; Text[6])
        {
            Caption = 'UPS Account Number';
            DataClassification = CustomerContent;
        }
        field(18; "Dispaly UPS Json"; Boolean)
        {
            Caption = 'Dispaly UPS Json';
            DataClassification = CustomerContent;
        }
        field(19; "Shipping Charge Acc No."; Code[20])
        {
            Caption = 'Shipping Charge Acc No.';
            TableRelation = Item."No.";
            DataClassification = CustomerContent;
        }
        field(20; "Show Freight List"; Boolean)
        {
            Caption = 'Show Freight List';
            DataClassification = CustomerContent;
        }

        field(21; "client id"; Text[100])
        {
            Caption = 'Client id';
            DataClassification = CustomerContent;
        }
        field(22; "client secret"; Text[100])
        {
            Caption = 'Client secret';
            DataClassification = CustomerContent;
            ExtendedDatatype = Masked;
        }
        field(23; "FedEx Token URL"; Text[500])
        {
            Caption = 'FedEx Token URL';
            DataClassification = CustomerContent;
        }
        field(24; "FedEx account Number"; Text[100])
        {
            Caption = 'FedEx Shipper account Number';
            DataClassification = CustomerContent;
        }
        field(25; "FedEx Freight Charge Url"; Text[500])
        {
            Caption = 'FedEx Freight Charge Url';
            DataClassification = CustomerContent;
        }
        field(26; "Dispaly FedEx Json"; Boolean)
        {
            Caption = 'Dispaly FedEx Json';
            DataClassification = CustomerContent;
        }
        field(27; "FedEx Shipping Charge Acc No."; Code[20])
        {
            Caption = 'FedEx Shipping Charge Acc No.';
            TableRelation = Item."No.";
            DataClassification = CustomerContent;
        }
        field(28; "FedEx Show Freight List"; Boolean)
        {
            Caption = 'FedEx Show Freight List';
            DataClassification = CustomerContent;
        }
        field(37; "Dispaly UPS Json track"; Boolean)
        {
            Caption = 'Dispaly UPS Json';
            DataClassification = CustomerContent;
        }
        field(38; "FedEx Account Number track"; Text[20])
        {
            Caption = 'FedEx Account Number';
            DataClassification = CustomerContent;
        }
        field(39; "FedEx client Id"; Text[250])
        {
            Caption = 'FedEx client Id';
            DataClassification = CustomerContent;
        }
        field(40; "FedEx client secret"; Text[250])
        {
            Caption = 'FedEx client secret';
            DataClassification = CustomerContent;
        }
        field(41; "FedEx oauth token Url"; Text[500])
        {
            Caption = 'FedEx oauth token Url';
            DataClassification = CustomerContent;
        }
        field(42; "FedEx Shipment Url"; Text[500])
        {
            Caption = 'FedEx Shipment Url';
            DataClassification = CustomerContent;
        }
        field(43; "FedEx Shipment cancel Url"; Text[500])
        {
            Caption = 'FedEx Shipment cancel Url';
            DataClassification = CustomerContent;
        }
        field(44; "FedEx Shipment Tracking Url"; Text[500])
        {
            Caption = 'FedEx Shipment Tracking Url';
            DataClassification = CustomerContent;
        }
        field(45; "Dispaly FedEx Json track"; Boolean)
        {
            Caption = 'Dispaly FedEx Json';
            DataClassification = CustomerContent;
        }
        field(46; "UPS UP Charge"; Decimal)
        {
            Caption = 'UPS UP Charge';
            DataClassification = CustomerContent;
        }
        field(47; "UPS Negotiated Rates"; Boolean)
        {
            Caption = 'UPS Negotiated Rates';
            DataClassification = CustomerContent;
        }
        field(48; "UPS Client Secret"; Text[2048])
        {
            Caption = 'UPS Client Secret';
            DataClassification = CustomerContent;
        }
        field(49; "UPS oauth token API"; Text[2048])
        {
            Caption = 'UPS oauth token API';
            DataClassification = CustomerContent;
        }
        field(50; "UPS oauth token Display"; Boolean)
        {
            Caption = 'UPS oauth token Display';
            DataClassification = CustomerContent;
        }
        field(51; "UPS Client ID"; Text[2048])
        {
            Caption = 'UPS Client ID';
            DataClassification = CustomerContent;
        }
        field(52; "UPS Shipment Url"; Text[2048])
        {
            Caption = 'UPS Shipment Url';
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
