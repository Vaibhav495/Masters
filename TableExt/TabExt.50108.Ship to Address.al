tableextension 50108 TabExt50108 extends "Ship-to Address"
{
    fields
    {
        field(50000; Residential; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }

    var
        myInt: Integer;
}