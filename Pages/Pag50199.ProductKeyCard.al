page 50199 "Product Key Card"
{
    Caption = 'Product Key Card';
    PageType = Card;
    SourceTable = "Product Key Master";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

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
