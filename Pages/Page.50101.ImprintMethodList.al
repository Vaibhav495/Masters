page 50101 "Imprint Method List"
{
    PageType = List;
    SourceTable = "Imprint Method";
    Editable = TRUE;
    UsageCategory = Administration;
    ApplicationArea = All;
    InsertAllowed = TRUE;
    Caption = 'Imprint Method List';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Color Required"; Rec."Color Required")
                {
                    Caption = 'Color Not Required';
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Color Not Required field.';
                }
            }
        }

    }

}