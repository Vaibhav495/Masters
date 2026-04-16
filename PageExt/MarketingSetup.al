pageextension 50501 MarketingSetup extends "Marketing Setup"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("Email Logging Using Graph API")
        {

            action("ImprintColorDetails")

            {
                ApplicationArea = all;

                trigger OnAction()
                var
                    ImprintColor: page "Imprint Color Details FrontUSE";
                begin
                    ImprintColor.Run();
                end;
            }
        }
    }

    var
        myInt: Integer;
}