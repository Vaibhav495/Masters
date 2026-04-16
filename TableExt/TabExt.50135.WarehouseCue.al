tableextension 50135 MyExtension50135 extends "Warehouse Worker WMS Cue"
{
    fields
    {
        field(50100; "Scrap Handling"; Integer)
        {
            CalcFormula = count("Scrap Handling" where(Processed = filter(false)));
            Editable = false;
            FieldClass = FlowField;
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