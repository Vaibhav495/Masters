
table 50109 "Shipping Setup"
{
    fields
    {
        field(1; "Primary Key"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "UPS License Number"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "UPS User Id"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "UPS Password"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "UPS Shipper Number"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "From City"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "From State"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "From Zip Code"; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "From Country"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "FEDEX User Key"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "FEDEX User Password"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "FEDEX Account Number"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "FEDEX Meter Number"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "FEDEX Cust. Transaction Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Local UPS Shipping File Path"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Local Fedex Shipping File Path"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Fedex Shipping File Path"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Address Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Residential, Commericial';
            OptionMembers = Residential,Commericial;

        }
        field(50000; "USPS User Key"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "USPS User Password"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "USPS Shipping File Path"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Local USPS Shipping File Path"; Text[50])
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
        field(50110; "Recipient Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(Pk; "Primary Key")
        {
            Clustered = True;
        }
    }
}