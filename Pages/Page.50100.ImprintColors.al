page 50100 "Imprint Colors"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Imprint Color";
    Caption = 'Imprint Colors';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Select; Rec.Select)
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("PMS Code"; Rec."PMS Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PMS Code field.';
                }
                field("PMS Match"; Rec."PMS Match")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PMS Match field.';
                }
            }
        }
    }

}