page 50506 "Unit Price"
{
    PageType = List;
    // ApplicationArea = All;
    // UsageCategory = Lists;
    RefreshOnActivate = true;
    AutoSplitKey = true;
    DelayedInsert = true;
    SourceTable = "Unit Price";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Imprint Method"; Rec."Imprint Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Imprint Method field.';
                    StyleExpr = Color;
                    trigger OnValidate()
                    BEGIN
                        IF xRec."Imprint Method" <> Rec."Imprint Method" THEN
                            PriceUpdated := true;
                    END;
                }
                field("Variant Code Lookup"; Rec."Variant Code Lookup")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Variant Code field.';
                    trigger OnValidate()
                    BEGIN
                        IF xRec."Variant Code Lookup" <> Rec."Variant Code Lookup" THEN
                            PriceUpdated := true;
                    END;
                }
                field("Minimum Quantity"; Rec."Minimum Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Minimum Quantity field.';
                    StyleExpr = Color;
                    trigger OnValidate()
                    BEGIN
                        IF xRec."Minimum Quantity" <> Rec."Minimum Quantity" THEN
                            PriceUpdated := true;
                    END;

                }
                field("Web Price"; Rec."Web Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Web Price field.';
                    StyleExpr = Color;
                }
                field("Catlog Code"; Rec."Catlog Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discount Code field.';
                    StyleExpr = Color;
                }
                field("Sales Price"; Rec."Sales Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Price field.';
                    StyleExpr = Color;
                }
                field("Vendor Blank Price"; Rec."Vendor Blank Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Blank Price field.', Comment = '%';
                    StyleExpr = Color;
                    trigger OnValidate()
                    BEGIN
                        Rec."Vendor Price" := Rec."Vendor Blank Price" + Rec."Vendor Decoration Price";
                    END;
                }
                field("Vendor Decoration Price"; Rec."Vendor Decoration Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Decoration Price field.', Comment = '%';
                    StyleExpr = Color;
                    TableRelation = "Decoration Charge"."Decoration Cost" where("Imprint Method" = field("Imprint Method"));

                    trigger OnValidate()
                    BEGIN
                        Rec."Vendor Price" := Rec."Vendor Blank Price" + Rec."Vendor Decoration Price";
                    END;
                }
                field("Vendor Price"; Rec."Vendor Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Price field.';
                    StyleExpr = Color;

                }


                field("Rush LP"; Rec."Rush LP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rush LP field.';
                    StyleExpr = Color;
                }
                field("Rush Discount SP"; Rec."Rush Discount SP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the  Rush SP field.';
                    StyleExpr = Color;
                }
                field("Rush Sales Price"; Rec."Rush Sales Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rush Sales Price field.';
                    StyleExpr = Color;
                    trigger OnValidate()
                    begin
                        if Rec."Rush Sales Price" > Rec."Super Rush Sales Price" then
                            Error('Rush Sales Price Should not be greater than the Super Rush Sales Price');
                        //  Error('Rush Sales Price should be less than Super Rush Sales Price.');
                    end;
                }
                field("Rush SP on web"; Rec."Rush SP on web")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the  Rush SP field.';
                    StyleExpr = Color;
                }
                field("Super Rush LP"; Rec."Super Rush LP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Super Rush LP field.';
                    StyleExpr = Color;
                }
                field("SuperRush Discount SP"; Rec."SuperRush Discount SP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Super Rush SP field.';
                    StyleExpr = Color;
                }

                field("Super Rush Sales Price"; Rec."Super Rush Sales Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Super Rush Sales Price field.';
                    StyleExpr = Color;
                    trigger OnValidate()
                    begin
                        if Rec."Super Rush Sales Price" < Rec."Rush Sales Price" then
                            Error('Super Rush Sales Price should not be less than the Rush Sales Price');
                    end;
                }
                field("Super Rush LP on web"; Rec."Super Rush LP on web")
                {
                    ApplicationArea = All;
                    StyleExpr = Color;
                    ToolTip = 'Specifies the value of the Super Rush LP on Web field.';
                }
                field("Vendor Rush Cost"; Rec."Vendor Rush Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Rush Cost field.';
                    StyleExpr = Color;
                }
                field("Vendor Super Rush Cost"; Rec."Vendor Super Rush Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Rush Cost field.';
                    StyleExpr = Color;
                }
                field("Rush Price Attribute"; Rec."Rush Price Attribute")
                {
                    ApplicationArea = All;
                    StyleExpr = Color;
                    Editable = (Rec."Rush SP on web");
                    ToolTip = 'Specifies the value of the Rush Price Attributes field.';

                }
                field("Super Rush Price Attribute"; Rec."Super Rush Price Attribute")
                {
                    ApplicationArea = All;
                    StyleExpr = Color;
                    Editable = (Rec."Super Rush LP on web");
                    ToolTip = 'Specifies the value of the Super Rush Price Attributes field.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Starting Date field.';
                    StyleExpr = Color;
                    trigger OnValidate()
                    BEGIN
                        IF xRec."Starting Date" <> Rec."Starting Date" THEN
                            PriceUpdated := true;
                    END;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ending Date field.';
                    StyleExpr = Color;
                    trigger OnValidate()
                    BEGIN
                        IF xRec."Ending Date" <> Rec."Ending Date" THEN
                            PriceUpdated := true;
                    END;
                }
                // PW NG 1.0 23102023 - Item Sync >>>
                field("Price Attributes"; Rec."Price Attributes")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Price Attributes field.';
                }

                // field(PriceBreakNameNew; Rec.PriceBreakNameNew)
                // {
                //     ApplicationArea = all;

                // }
                field("Price Attributes Seq"; Rec."Price Attributes Seq")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Price Attributes Sequence field.';
                }
                field(IsActive; Rec.IsActive)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Is Active field.';
                }
                field(IsRegularPrice; Rec.IsRegularPrice)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Is Regular Price field.';
                }
                field(IsCallForPrice; Rec.IsCallForPrice)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Is CallFor Price field.';
                }
                field(StrikePrice; Rec.StrikePrice)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Strike Price field.';
                }
                field(WebExpirationDate; Rec.WebExpirationDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Web Expiration Date field.';
                }
                field(NoteText; Rec.NoteText)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Web NoteText field.';
                }
                field(NoteText2; Rec.NoteText2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Web NoteText2 field.';
                }
                // PW NG 1.0 23102023 - Item Sync <<<

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
            action("Update Price")
            {
                ApplicationArea = All;
                ToolTip = 'Executes the Update Price action.';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction();
                var
                    ImprintMethodMaster: Record "Imprint Method";
                    PriceListHeader: Record "Price List Header";
                    PriceListLine: Record "Price List Line";
                    UnitPrice: Record "Unit Price";
                    LineNo: Integer;
                begin
                    IF Confirm('Do you want to update Price?') THEN BEGIN
                        //>>Check Imprint wise Price code
                        ImprintMethodMaster.Reset();
                        ImprintMethodMaster.SetRange(ImprintMethodMaster."Vendor No.", Rec."Vendor No.");
                        IF ImprintMethodMaster.FindSet() THEN
                            REPEAT
                                //>>Delete existing lines
                                PriceListHeader.Reset();
                                PriceListHeader.SetRange(PriceListHeader.Code, ImprintMethodMaster.Code);
                                IF PriceListHeader.FindFirst() THEN BEGIN
                                    PriceListLine.Reset();
                                    PriceListLine.SetRange(PriceListLine."Price List Code", PriceListHeader.Code);
                                    PriceListLine.SetRange(PriceListLine."Asset No.", Rec."Item No.");
                                    IF PriceListLine.FindSet() THEN
                                        PriceListLine.DeleteAll();
                                END
                                //<<Delete existing lines
                                ELSE
                                //>>If Imprint method not found then create price code
                                BEGIN
                                    PriceListHeader.Init();
                                    PriceListHeader.Code := ImprintMethodMaster.Code;
                                    PriceListHeader.Description := ImprintMethodMaster.Code;
                                    PriceListHeader."Source Type" := PriceListHeader."Source Type"::"All Customers";
                                    PriceListHeader."Source Group" := PriceListHeader."Source Group"::Customer;
                                    PriceListHeader."Price Type" := PriceListHeader."Price Type"::Sale;
                                    PriceListHeader.Status := PriceListHeader.Status::Active;
                                    PriceListHeader.Insert();
                                END;
                                //<<If Imprint method not found then create price code


                                //>>Insert Lines
                                LineNo := 0;
                                PriceListLine.Reset();
                                PriceListLine.SetRange(PriceListLine."Price List Code", ImprintMethodMaster.Code);
                                IF PriceListLine.FindLast() THEN
                                    LineNo := PriceListLine."Line No.";


                                UnitPrice.Reset();
                                UnitPrice.SetRange(UnitPrice."Vendor No.", Rec."Vendor No.");
                                UnitPrice.SetRange(UnitPrice."Item No.", Rec."Item No.");
                                UnitPrice.SetRange(UnitPrice."Imprint Method", ImprintMethodMaster.Code);
                                IF UnitPrice.FindSet() THEN
                                    REPEAT
                                        PriceListLine.Init();
                                        PriceListLine."Price List Code" := UnitPrice."Imprint Method";
                                        LineNo += 10000;
                                        PriceListLine."Line No." := LineNo;
                                        PriceListLine."Source Type" := PriceListLine."Source Type"::"All Customers";
                                        PriceListLine."Asset Type" := PriceListLine."Asset Type"::Item;
                                        PriceListLine.validate("Asset No.", UnitPrice."Item No.");
                                        PriceListLine."Price Type" := PriceListLine."Price Type"::Sale;
                                        PriceListLine."Source Group" := PriceListLine."Source Group"::Customer;
                                        PriceListLine.Validate("Product No.", UnitPrice."Item No.");
                                        PriceListLine.Status := PriceListLine.Status::Active;
                                        PriceListLine."Minimum Quantity" := UnitPrice."Minimum Quantity";
                                        PriceListLine."Catlog Code" := UnitPrice."Catlog Code";
                                        PriceListLine."Web Price" := UnitPrice."Web Price";
                                        PriceListLine."Unit Price" := UnitPrice."Sales Price";
                                        PriceListLine."Rush Price" := UnitPrice."Rush Sales Price";
                                        PriceListLine."Super Rush Price" := UnitPrice."Super Rush Sales Price";
                                        PriceListLine."Starting Date" := UnitPrice."Starting Date";
                                        PriceListLine."Ending Date" := UnitPrice."Ending Date";
                                        PriceListLine."Vendor Price" := UnitPrice."Vendor Price";
                                        PriceListLine."Vendor Rush Cost" := UnitPrice."Vendor Rush Cost";
                                        PriceListLine.Validate("Variant Code Lookup", UnitPrice."Variant Code Lookup");
                                        // PW NG 1.0 11072024 - Item Integraton Fields >>>
                                        PriceListLine."Imprint Method" := UnitPrice."Imprint Method";
                                        PriceListLine.IsActive := UnitPrice.IsActive;
                                        PriceListLine.IsRegularPrice := UnitPrice.IsRegularPrice;
                                        PriceListLine.IsCallForPrice := UnitPrice.IsCallForPrice;
                                        PriceListLine.StrikePrice := UnitPrice.StrikePrice;
                                        PriceListLine.WebExpirationDate := UnitPrice.WebExpirationDate;
                                        PriceListLine.NoteText := UnitPrice.NoteText;
                                        // UnitPrice.TestField(NoteText2);
                                        PriceListLine.NoteText2 := UnitPrice.NoteText2;
                                        //   UnitPrice.TestField("Price Attributes");
                                        PriceListLine."Price Attributes" := UnitPrice."Price Attributes";
                                        PriceListLine."Price Attributes Seq" := UnitPrice."Price Attributes Seq";
                                        // PW NG 1.0 11072024 - Item Integraton Fields <<<

                                        PriceListLine."Rush LP" := UnitPrice."Rush LP";
                                        PriceListLine."Super Rush LP" := UnitPrice."Super Rush LP";
                                        PriceListLine."Rush Discount SP" := UnitPrice."Rush Discount SP";
                                        PriceListLine."SuperRush Discount SP" := UnitPrice."SuperRush Discount SP";
                                        PriceListLine."Rush SP on web" := UnitPrice."Rush SP on web";
                                        PriceListLine."Super Rush LP on web" := UnitPrice."Super Rush LP on web";
                                        PriceListLine."Super Rush Price Attribute" := UnitPrice."Super Rush Price Attribute";
                                        PriceListLine."Rush Price Attribute" := UnitPrice."Rush Price Attribute";
                                        //PriceListLine.PriceBreakNameNew := UnitPrice.PriceBreakNameNew;
                                        PriceListLine.Insert();
                                        UnitPrice."Pending update" := false;
                                        UnitPrice.Modify(false);
                                    UNTIL UnitPrice.Next() = 0;
                                //<<Insert Lines
                                //>>Verify Lines
                                begin
                                    PriceListManagement.ActivateDraftLines(PriceListHeader);
                                end;
                            //<<Verify Lines
                            UNTIL ImprintMethodMaster.Next() = 0;
                        //<<Check Imprint wise Price code
                        //CurrPage.Update(false);
                        PriceUpdated := false;
                        Message('Price Updated Succesfully');
                    END;
                end;
            }
            // action(ValidateWebPriceALL)
            // {
            //     ApplicationArea = All;
            //     // PromotedCategory = Process;
            //     trigger OnAction()
            //     var
            //         UnitPriceUpdate: Record "Unit Price";
            //     begin
            //         if UnitPriceUpdate.FindSet() then
            //             repeat
            //                 UnitPriceUpdate.Validate("Web Price");
            //             until UnitPriceUpdate.Next() = 0
            //     end;

            // }
        }
    }

    VAR
        Color: Code[50];
        PriceListManagement: Codeunit "Price List Management";

        PriceUpdated: Boolean;


    trigger OnOpenPage()
    BEGIN
        PriceUpdated := false;
    END;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    BEGIN
        IF PriceUpdated THEN
            Error('Please click on Update Price');
    END;

    trigger OnClosePage()
    BEGIN

    END;

    trigger OnDeleteRecord(): Boolean
    BEGIN
        PriceUpdated := true;
    END;



    trigger OnModifyRecord(): Boolean
    BEGIN
        //Message('Modified');
        PriceUpdated := true;
    END;



    trigger OnAfterGetRecord()
    BEGIN
        IF Rec."Pending update" THEN
            Color := 'Unfavorable'
        ELSE
            Color := 'Standard';
        // IF Rec."Web Price" = xRec."Web Price" THEN
        //     CurrPage.Update(false);
    END;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    BEGIN
        PriceUpdated := true;
        BEGIN
            IF Rec."Imprint Method" = '' THEN
                Error('Imprint Method must have value');
        END;
    END;
}