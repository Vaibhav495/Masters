page 50197 "Product Group List"
{
    ApplicationArea = All;
    Caption = 'Product Group List';
    PageType = List;
    Editable = false;
    CardPageId = "Product Groups Card";
    RefreshOnActivate = true;
    SourceTable = "Product Group Master";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
