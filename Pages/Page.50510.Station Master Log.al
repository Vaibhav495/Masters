page 50510 "Station Master Log"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Artwork;
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;

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
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Customer PO#"; Rec."Customer PO#")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer PO# field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Line No. field.';
                }

                field(Sequence; Rec.Sequence)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sequence field.';
                }
                field("Start Date Time"; Rec."Start Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Date Time field.';
                }
                field("End Date Time"; Rec."End Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date Time field.';
                }

                field("Art ID"; Rec."Art ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Art ID field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Product Colors field.';
                }
                field("Item Category"; Rec."Item Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Category field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Fabric; Rec.Fabric)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fabric field.';
                }
                field("Factory Ink"; Rec."Factory Ink")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Factory Ink field.';
                }
                field("In Hand Date"; Rec."In Hand Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the In-Hand Date field.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Date field.';
                }
                field("PO No"; Rec."PO No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PO No field.';
                }
                field("Production Location"; Rec."Production Location")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prod. Location field.';
                }

                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shipment Date field.';
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Assigned User ID field.';
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