page 50102 ArtOrderStatusList
{

    ApplicationArea = All;
    Caption = 'Art Order Status List';
    PageType = List;
    SourceTable = ArtOrderStatus;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Status Code"; Rec."Status Code")
                {
                    ToolTip = 'Specifies the value of the Status Code field';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field';
                    ApplicationArea = All;
                }
                field("Show on web"; Rec."Show on web")
                {
                    ApplicationArea = all;
                }

            }
        }
    }

}
