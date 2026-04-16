tableextension 50300 UPSExtendsCompanyInformation extends "Company Information"
{
    fields
    {
        field(50300; "UPS Shipment Url"; Text[500])
        {
            Caption = 'UPS Shipment Url';
            DataClassification = CustomerContent;
        }
        field(50301; "UPS Reprint Label Shipment Url"; Text[500])
        {
            Caption = 'UPS Reprint Label Shipment Url';
            DataClassification = CustomerContent;
        }
        field(50302; "UPS Cancel Shipment Url"; Text[500])
        {
            Caption = 'UPS Cancel Shipment Url';
            DataClassification = CustomerContent;
        }
        field(50304; "UPS Shipment Tracking Url"; Text[500])
        {
            Caption = 'UPS Shipment Tracking Url';
            DataClassification = CustomerContent;
        }
        field(50311; "UPS User Name"; Text[16])
        {
            Caption = 'UPS User Name';
            DataClassification = CustomerContent;
        }
        field(50312; "UPS User Password"; Text[26])
        {
            Caption = 'UPS User Password';
            DataClassification = CustomerContent;
        }
        field(50313; "UPS Access License Number"; Text[16])
        {
            Caption = 'UPS Access License Number';
            DataClassification = CustomerContent;
        }
        field(50314; "UPS Account Number"; Text[6])
        {
            Caption = 'UPS Account Number';
            DataClassification = CustomerContent;
        }
        field(50315; "Dispaly UPS Json"; Boolean)
        {
            Caption = 'Dispaly UPS Json';
            DataClassification = CustomerContent;
        }

    }
}
