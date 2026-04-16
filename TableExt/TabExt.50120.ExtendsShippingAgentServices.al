tableextension 50120 ExtendsShippingAgentServices extends "Shipping Agent Services"
{
    fields
    {
        field(50100; "Fedex Shipping Agent Code"; Code[100])
        {
            Caption = 'Fedex Shipping Agent Code';
            DataClassification = CustomerContent;
        }
        field(50101; "Fedex Ship Agent Description"; Text[100])
        {
            Caption = 'Fedex Ship Agent Description';
            DataClassification = CustomerContent;
        }
        field(50102; "UPS Shipping Agent Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }
}
