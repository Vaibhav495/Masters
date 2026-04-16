page 50200 "Product Key List"
{
    ApplicationArea = All;
    Caption = 'Product Key List';
    PageType = List;
    RefreshOnActivate = true;
    Editable = false;
    CardPageId = "Product Key Card";
    SourceTable = "Product Key Master";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Product Key Code"; Rec."Product Key Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Product Key Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
