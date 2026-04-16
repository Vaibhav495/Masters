tableextension 50101 SalesPRice50114 extends "Sales Price"
{
    fields
    {
        field(50000; "Catlog Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Web Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }

    var

}