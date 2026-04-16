tableextension 50302 WareHShipLine extends "Warehouse Shipment Line"
{
    fields
    {
        field(50001; "Shipping Agent Code"; Code[10])
        {
            //  AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Agent Code';
            TableRelation = "Item Shipping Agent".Code;// where(Location = field("Location Code"));
        }
        // field(50002; "Shipping Agent ServiceCode"; Code[10])
        // {
        //     Caption = 'Shipping Agent Service Code';
        //     TableRelation = "Shipping Agent Services".Code WHERE("Shipping Agent Code" = FIELD("Shipping Agent Code"));
        // }
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