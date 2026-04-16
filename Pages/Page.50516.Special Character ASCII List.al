page 50516 "Special Character ASCII List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Special Character ASCII";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(ASCII; Rec.ASCII)
                {
                    ToolTip = 'Specifies the value of the ASCII field.', Comment = '%';
                }
                field("Special Character"; Rec."Special Character")
                {
                    ToolTip = 'Specifies the value of the Special Character field.', Comment = '%';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}