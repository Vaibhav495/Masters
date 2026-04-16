tableextension 50308 MyExtension50308 extends "Marketing Setup"
{
    fields
    {
        field(50000; "Allow to edit contact Email"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50001; "Admin"; Boolean)
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