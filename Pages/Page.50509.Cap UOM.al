page 50509 "Capacity UOM"
{
    ApplicationArea = all;
    Caption = 'Capacity UOM';
    PageType = List;
    SourceTable = "Capacity UOM";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = all;
                    ;
                    ToolTip = 'Specifies the unit code.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                    ;
                    ToolTip = 'Specifies the type of unit of measure.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ;
                    ToolTip = 'Specifies the description of the unit of measure.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
    }
}

