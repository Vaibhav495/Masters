page 50511 "Station Master Mapping List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Station Master Mapping";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Station Master"; Rec."Station Master")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Station Master field.';
                }
                field("Station Master Name"; Rec."Station Master Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Station Master Name field.';
                }
                field("Imprint Method"; Rec."Imprint Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Imprint Method field.';
                }
                field("Imprint Method Name"; Rec."Imprint Method Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Imprint Method Name field.';
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
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}