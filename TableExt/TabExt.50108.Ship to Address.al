tableextension 50108 TabExtShipToAddress extends "Ship-to Address"
{
    fields
    {
        field(50000; Residential; Boolean)
        {
            DataClassification = CustomerContent;
        }
        modify("Post Code")
        {
            Caption = 'Zip Code';
        }
    }


    var
        myInt: Integer;
}