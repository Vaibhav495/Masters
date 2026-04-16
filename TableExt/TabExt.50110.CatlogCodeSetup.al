tableextension 50110 TabRelativeCatalog extends Relative
{
    fields
    {
        field(50000; Percentage; Decimal)
        {

        }
        modify(Code)
        {
            Caption = 'Catlog No.';
        }
        // Add changes to table fields here
    }

    fieldgroups
    {

        addlast(Dropdown; code, Percentage)
        { }

    }

    var
        myInt: Integer;

}