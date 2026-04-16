page 50101 "Imprint Method List"
{
    PageType = List;
    SourceTable = "Imprint Method";
    Editable = TRUE;
    UsageCategory = Lists;
    ApplicationArea = All;
    InsertAllowed = TRUE;
    Caption = 'Imprint Method Master List';

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
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
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
                field("Imprint color"; Rec."Imprint color")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Imprint color field.';
                }
                field("Max Imprint Color"; Rec."Max Imprint Color")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                    ToolTip = 'Specifies the value of the Max Imprint Color field.';
                }
                field(Default; Rec.Default)
                {
                    ApplicationArea = all;
                }
                // field("Discount Code"; Rec."Discount Code")
                // {
                //     ApplicationArea = all;
                // }
                // field("Run Charge"; Rec."Run Charge")
                // {
                //     ApplicationArea = all;
                // }
                // field("Web Run Charge"; Rec."Web Run Charge")
                // {
                //     ApplicationArea = all;
                // }
                // field("SETUP Charge"; Rec."SETUP Charge")
                // {
                //     ApplicationArea = all;
                // }
                // field("Web SETUP Charge"; Rec."Web SETUP Charge")
                // {
                //     ApplicationArea = all;
                // }
                field("No of Imprint Colors"; Rec."No of Imprint Colors")
                {
                    ApplicationArea = all;
                }
                field("Max No of Imprint Colors"; rec."Max No of Imprint Colors")
                {
                    ApplicationArea = all;
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
    actions
    {

        area(Processing)
        {
            action("Assigned Station Master")
            {
                ApplicationArea = all;
                Image = MachineCenter;
                RunObject = Page "Station Master Mapping List";
                RunPageLink = "Imprint Method" = field(Code);

            }
        }
    }

}