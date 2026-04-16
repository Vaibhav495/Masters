

table 50149 "Capacity UOM"
{
    Caption = 'Capacity UOM';
    DrillDownPageID = "Capacity UOM";
    LookupPageID = "Capacity UOM";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Type; Enum "Capacity Unit of Measure")
        {
            Caption = 'Type';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

