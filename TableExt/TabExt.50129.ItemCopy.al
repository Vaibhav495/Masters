tableextension 50129 ExtItemCopy extends "Copy Item Buffer"
{
    fields
    {
        field(50001; "Item Imprint color"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Item Cartons"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Item Charge Cost"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Category Imprint Loc"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Category Imprint Method"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Category Charge Setup"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}