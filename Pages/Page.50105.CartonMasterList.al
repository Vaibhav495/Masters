page 50105 "Carton Master List"
{
    ApplicationArea = All;
    Editable = true;
    InsertAllowed = true;
    Caption = 'Carton Master List';
    PageType = List;
    UsageCategory = Lists;
    RefreshOnActivate = true;
    SourceTable = "Carton Master";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Carton Code"; Rec."Carton Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Carton Code field.';
                }
                field("Carton Name"; Rec."Carton Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Carton Name field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(Length; Rec.Length)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Length field.';
                }
                field(Width; Rec.Width)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Width field.';
                }
                field(Height; Rec.Height)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Height field.';
                }
                field(Volume; Rec.Volume)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Volume field.';
                }
                field("Length Inches"; Rec."Length Inches")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Length Inches field.';
                }
                field("Width Inches"; Rec."Width Inches")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Width Inches field.';
                }
                field("Height Inches"; Rec."Height Inches")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Height Inches field.';
                }
                field("Carton CBMS"; Rec."Carton CBMS")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Carton CBMS field.';
                }
            }
        }
    }
}
