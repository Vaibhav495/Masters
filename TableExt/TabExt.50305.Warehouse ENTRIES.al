tableextension 50305 WhseEntriesExt extends "Warehouse Entry"
{
    fields
    {

        field(50100; Aisle; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50101; Shelf; Text[50])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}