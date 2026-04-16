table 50118 ArtworkStatusLog
{
    Caption = 'Artwork Status Log';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            MinValue = 0;
            DataClassification = CustomerContent;
        }
        field(2; "Art Id"; Code[20])
        {
            Caption = 'Art Id';
            DataClassification = CustomerContent;

        }
        field(3; "Order No"; Code[20])
        {
            Caption = 'Order No';
            DataClassification = CustomerContent;
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
        }
        field(5; "Variant Code"; Code[20])
        {
            Caption = 'Variant Code';
            DataClassification = CustomerContent;
        }
        field(6; "Order Line"; Integer)
        {
            Caption = 'Order Line';
            DataClassification = CustomerContent;
        }
        field(7; "Status Code"; Code[50])
        {
            Caption = 'Status Code';
            DataClassification = CustomerContent;
        }
        field(8; Status; Text[100])
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(9; Date; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(10; "User Id"; Code[50])
        {
            Caption = 'User Id';
            DataClassification = CustomerContent;
        }
        field(11; CurrentDateTime; DateTime)
        {
            Caption = 'CurrentDateTime';
            DataClassification = CustomerContent;
        }
        field(12; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
            DataClassification = CustomerContent;
        }
        field(13; "Imprint Location"; Code[50])
        {
            Caption = 'Imprint Location';
            DataClassification = CustomerContent;

        }
        field(14; "Imprint Method"; Code[20])
        {
            Caption = 'Imprint Method';
            DataClassification = CustomerContent;
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
