table 50302 FedExShipmentLabel
{
    Caption = 'FedExShipmentLabel';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Sales Order No."; Code[20])
        {
            Caption = 'Sales Order No.';
            DataClassification = CustomerContent;
        }
        field(2; Sequence; Integer)
        {
            Caption = 'Sequence';
            DataClassification = CustomerContent;
        }
        field(3; "Shipping Label"; Blob)
        {
            Caption = 'Shipping Label';
            DataClassification = CustomerContent;
            Subtype = Bitmap;
        }

    }
    keys
    {
        key(PK; "Sales Order No.", Sequence)
        {
            Clustered = true;
        }
    }
}
