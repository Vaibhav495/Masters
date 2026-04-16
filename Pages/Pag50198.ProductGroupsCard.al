page 50198 "Product Groups Card"
{
    Caption = 'Product Groups Card';
    PageType = Card;
    SourceTable = "Product Group Master";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Group Code"; Rec."Group Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Group Code field.';
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
