tableextension 50306 BinContentExt extends "Bin Content"
{
    fields
    {

        field(50100; Aisle; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Bin.Aisle where("Location Code" = field("Location Code"), "Zone Code" = field("Zone Code"), Code = field("Bin Code")));
        }
        field(50101; Shelf; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Bin.Shelf where("Location Code" = field("Location Code"), "Zone Code" = field("Zone Code"), Code = field("Bin Code")));

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