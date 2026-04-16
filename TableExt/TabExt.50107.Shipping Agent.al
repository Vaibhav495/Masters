tableextension 50107 TabExt50107 extends "Shipping Agent"
{
    fields
    {
        field(50000; "Address Not Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}