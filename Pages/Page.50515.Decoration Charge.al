page 50515 "Decoration Charge"
{

    Caption = 'Decoration Charge';
    PageType = List;
    ApplicationArea = ALL;
    UsageCategory = Administration;
    SourceTable = "Decoration Charge";
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Imprint Method"; Rec."Imprint Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Imprint Method field.', Comment = '%';
                }
                field("Decoration Cost"; Rec."Decoration Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Decoration Cost field.', Comment = '%';
                }
            }
        }
    }

}
