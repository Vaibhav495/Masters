tableextension 50134 WarehouseActivityLine extends "Warehouse Activity Line"
{
    fields
    {
        field(50001; "Order Pick"; Boolean)
        {
            DataClassification = ToBeClassified;
        }// Add changes to table fields here
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