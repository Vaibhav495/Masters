page 50104 "Item Shipping Agent"
{
    PageType = List;
    SourceTable = "Item Shipping Agent";
    Editable = TRUE;
    UsageCategory = Administration;
    ApplicationArea = All;
    InsertAllowed = TRUE;
    Caption = 'Item Shipping Agent';


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(code; rec.code)
                {
                    ApplicationArea = all;

                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = all;
                }
                field("Shipping Agent ServiceCode"; Rec."Shipping Agent ServiceCode")
                {
                    Caption = 'Shipping Agent service Code';
                    ApplicationArea = all;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = all;
                }
                field("Internet Address"; rec."Internet Address")
                {
                    ApplicationArea = all;
                }
                field("Account No."; rec."Account No.")
                {
                    ApplicationArea = all;
                }
                field("Coupled to CRM"; Rec."Coupled to CRM")
                {
                    ApplicationArea = all;
                }
            }
        }

    }





}