page 50202 "Item Category Website"
{
    ApplicationArea = All;
    Caption = 'Item Category Website';
    PageType = List;
    SourceTable = "Item Category Website";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ToolTip = 'Specifies the value of the Item Category Code field.', Comment = '%';
                }
                field("Item Sub Category Code"; Rec."Item Sub Category Code")
                {
                    ToolTip = 'Specifies the value of the Item Sub Category Code field.', Comment = '%';
                }
                field("Item Sub Sub Category Code"; Rec."Item Sub Sub Category Code")
                {
                    ToolTip = 'Specifies the value of the Item Sub Sub Category Code field.', Comment = '%';
                }
                field("Item Sub Sub Sub Category Code"; Rec."Item Sub Sub Sub Category Code")
                {
                    ToolTip = 'Specifies the value of the Item Sub Sub Sub Category Code field.', Comment = '%';
                }
            }
        }
    }
}
