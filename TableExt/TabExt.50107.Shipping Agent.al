tableextension 50107 TabExtShipppingAgent extends "Shipping Agent"
{
    fields
    {
        field(50000; "Address Not Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; Pickup; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}