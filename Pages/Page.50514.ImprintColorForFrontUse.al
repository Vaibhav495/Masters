page 50514 "Imprint Color Details FrontUSE"
{

    Caption = 'Imprint Details FrontUSE';
    PageType = List;
    SourceTable = "Imprint Color Details";
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Art ID"; Rec."Art ID")
                {
                    ToolTip = 'Specifies the value of the Art ID field';
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field';
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field';
                    ApplicationArea = All;
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                    ToolTip = 'Specifies the value of the Document Line No. field';
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field';
                    ApplicationArea = All;
                }
                field(Color; Rec.Color)
                {
                    ToolTip = 'Specifies the value of the Color field';
                    ApplicationArea = All;
                }
                field("Color Name"; Rec."Color Name")
                {
                    ToolTip = 'Specifies the value of the Color Name field';
                    ApplicationArea = All;
                }
                field("PMS Match"; Rec."PMS Match")
                {
                    ToolTip = 'Specifies the value of the PMS Match field';
                    ApplicationArea = All;
                }
                field("PMS Code"; Rec."PMS Code")
                {
                    ToolTip = 'Specifies the value of the PMS Code field';
                    ApplicationArea = All;
                }
                field(Fabric; Rec.Fabric)
                {
                    ToolTip = 'Specifies the value of the Material field';
                    ApplicationArea = All;
                }

            }
        }
    }

}
