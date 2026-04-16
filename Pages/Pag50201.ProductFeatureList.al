page 50201 "Product Feature List"
{
    ApplicationArea = All;
    Caption = 'Product Feature List';
    PageType = List;
    RefreshOnActivate = true;
    Editable = true;
    SourceTable = "Product Feature Description";
    UsageCategory = Administration;
    SourceTableView = sorting("Product Code", Sequence) order(ascending);

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Product Code"; Rec."Product Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Product Code field.';
                }
                field("Product Description"; Rec."Product Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Product Description field.';
                }
                field("Product Group Code"; Rec."Product Group Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Product Group Code field.';
                }
                field("Product Group Name"; Rec."Product Group Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Product Group Name field.';
                }
                field("Product Group Seq"; Rec."Product Group Seq")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Product Group Seq field.';
                }
                field("Product Group Key Code"; Rec."Product Group Key Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Product Group Key Code field.';
                }
                field("Product Key Name"; Rec."Product Key Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Product Key Name field.';
                }
                field(ItemFeatureValue; ItemFeatureValue)
                {
                    Caption = 'Value';
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Item Feature Value field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec.SetDescription(ItemFeatureValue);
                    end;
                }
                field(Sequence; Rec.Sequence)
                {
                    ApplicationArea = All;
                    Caption = 'Attibute Sequence';
                    ToolTip = 'Specifies the value of the Sequence field.';
                }
            }
        }

    }
    // PW NG 1.0 22112024 - Adding the Feature data from Excel ------------->>>>
    actions
    {
        area(Processing)
        {
            action(ExcelImport)
            {
                Caption = 'Export Data';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Excel;
                trigger OnAction()
                var
                    TempExcelBuffer: Record "Excel Buffer" temporary;
                    ProductFeatureDetails: Record "Product Feature Description";
                    GetWebValue: Text;
                    ReportHeader: Label 'Product Feature';
                    ExcelFileName: Label 'Product Feature_%1_%2';
                    OutStream: OutStream;
                begin
                    TempExcelBuffer.Reset();
                    TempExcelBuffer.DeleteAll();
                    TempExcelBuffer.NewRow();
                    // Produc No.
                    TempExcelBuffer.AddColumn(Rec.FieldCaption("Product Code"), false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    // Product Group
                    TempExcelBuffer.AddColumn(Rec.FieldCaption("Product Group Code"), false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(Rec.FieldCaption("Product Group Seq"), false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    // Product Group Name
                    TempExcelBuffer.AddColumn(Rec.FieldCaption("Product Group Name"), false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    // Product Group Seq
                    TempExcelBuffer.AddColumn(Rec.FieldCaption("Product Group Key Code"), false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    //"Product Key Name"
                    TempExcelBuffer.AddColumn(Rec.FieldCaption("Product Key Name"), false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    // Web Value
                    TempExcelBuffer.AddColumn('Value', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    //"Product Key sequence
                    TempExcelBuffer.AddColumn(Rec.FieldCaption(Sequence), false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    ProductFeatureDetails.Reset();
                    ProductFeatureDetails.SetAutoCalcFields("Web Value");
                    ProductFeatureDetails.SetRange("Product Code", Rec."Product Code");
                    if ProductFeatureDetails.FindSet() then
                        repeat
                            GetWebValue := '';
                            TempExcelBuffer.NewRow();
                            // Produc No.
                            TempExcelBuffer.AddColumn(ProductFeatureDetails."Product Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                            // Product Group
                            TempExcelBuffer.AddColumn(ProductFeatureDetails."Product Group Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                            TempExcelBuffer.AddColumn(ProductFeatureDetails."Product Group Seq", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                            // Product Group Name
                            TempExcelBuffer.AddColumn(ProductFeatureDetails."Product Group Name", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                            // "Product Key
                            TempExcelBuffer.AddColumn(ProductFeatureDetails."Product Group Key Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                            //"Product Key Name"
                            TempExcelBuffer.AddColumn(ProductFeatureDetails."Product Key Name", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

                            GetWebValue := ProductFeatureDetails.GetDescription();
                            // Web Value
                          //  TempExcelBuffer.AddColumn(GetWebValue, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);  //VY++++commit
                            
                             //VY++++
                            if StrLen(GetWebValue) < 250 then
                                TempExcelBuffer.AddColumn(
                                    GetWebValue,
                                    false, '', false, false, false, '',
                                    TempExcelBuffer."Cell Type"::Text)
                            else begin
                                TempExcelBuffer.AddColumn(
                                    '', false, '', false, false, false, '',
                                    TempExcelBuffer."Cell Type"::Text);

                                TempExcelBuffer."Cell Value as Blob".CreateOutStream(OutStream);
                                OutStream.WriteText(GetWebValue);
                            end;
                            //VY---

                            //"Product Key sequence
                            TempExcelBuffer.AddColumn(ProductFeatureDetails.Sequence, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                        until
                        ProductFeatureDetails.Next() = 0;
                    TempExcelBuffer.CreateNewBook(ReportHeader);
                    TempExcelBuffer.WriteSheet(ReportHeader, CompanyName, UserId);
                    TempExcelBuffer.CloseBook();
                    TempExcelBuffer.SetFriendlyFilename(StrSubstNo(ExcelFileName, CurrentDateTime, UserId));
                    TempExcelBuffer.OpenExcel();

                end;
            }
            action(ImportExcel)
            {
                Caption = 'Import Data';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Excel;
                trigger OnAction()
                begin
                    ReadExcelSheet();
                    ImportExcelData();
                end;

            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        Clear(ItemFeatureValue);
        ItemFeatureValue := Rec.GetDescription();
    end;

    trigger OnAfterGetRecord()
    begin
        Clear(ItemFeatureValue);
        ItemFeatureValue := Rec.GetDescription();
    end;

    var
        ItemNo: Code[20];
        ItemFeatureValue: Text;
        FileName: Text[100];
        SheetName: Text[100];
        TempExcelBuffer: Record "Excel Buffer" temporary;
        UploadExcelMsg: Label 'Please Choose the Excel file.';
        NoFileFoundMsg: Label 'No Excel file found!';
        BatchISBlankMsg: Label 'Batch name is blank';
        ExcelImportSucess: Label 'Excel is successfully imported.';

    local procedure ReadExcelSheet()
    var
        FileManagement: Codeunit "File Management";
        InStream: InStream;
        FromFile: Text[100];
    begin
        UploadIntoStream(UploadExcelMsg, '', '', FromFile, InStream);
        if FromFile <> '' then begin
            FileName := FileManagement.GetFileName(FromFile);
            SheetName := TempExcelBuffer.SelectSheetsNameStream(InStream);
        end else
            Error(NoFileFoundMsg);
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(InStream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    local procedure ImportExcelData()
    var
        ProductFeatureDetails: Record "Product Feature Description";
        Item: Record Item;
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        OutStream: OutStream;
    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        LineNo := 0;
        ProductFeatureDetails.Reset();
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRowNo := TempExcelBuffer."Row No.";
        end;
        for RowNo := 2 to MaxRowNo do begin
            ProductFeatureDetails.Init();
            ItemNo := '';
            ItemNo := GetValueAtCell(RowNo, 1);
            if ItemNo = '' then
                Error('Product No. should not be blank.');
            Evaluate(ProductFeatureDetails."Product Code", ItemNo);
            if Item.Get(ItemNo) then
                ProductFeatureDetails."Product Description" := Item.Description;
            Evaluate(ProductFeatureDetails."Product Group Code", GetValueAtCell(RowNo, 2));
            Evaluate(ProductFeatureDetails."Product Group Seq", GetValueAtCell(RowNo, 3));
            Evaluate(ProductFeatureDetails."Product Group Name", GetValueAtCell(RowNo, 4));
            Evaluate(ProductFeatureDetails."Product Group Key Code", GetValueAtCell(RowNo, 5));
            Evaluate(ProductFeatureDetails."Product Key Name", GetValueAtCell(RowNo, 6));
            ProductFeatureDetails.CalcFields("Web Value");
            ProductFeatureDetails."Web Value".CreateOutStream(OutStream, TEXTENCODING::UTF8);
            OutStream.WriteText(GetValueAtCellBlob(RowNo, 7));
            Evaluate(ProductFeatureDetails.Sequence, GetValueAtCell(RowNo, 8));
            ProductFeatureDetails.Insert();
        end;
        Message(ExcelImportSucess);
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin

        TempExcelBuffer.Reset();
        If TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

    local procedure GetValueAtCellBlob(RowNo: Integer; ColNo: Integer): Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
        ReturnText: Text;
    begin
        TempExcelBuffer.Reset();
        If TempExcelBuffer.Get(RowNo, ColNo) then begin
            TempExcelBuffer.CalcFields("Cell Value as Blob");
            if TempExcelBuffer."Cell Value as Blob".HasValue then begin
                TempExcelBuffer."Cell Value as Blob".CreateInStream(InStream, TEXTENCODING::UTF8);
                Clear(ReturnText);
                ReturnText := TypeHelper.TryReadAsTextWithSepAndFieldErrMsg(InStream, TypeHelper.LFSeparator(), FieldName(Rec."Web Value"));
                exit(ReturnText);
            end else
                exit(TempExcelBuffer."Cell Value as Text");

        end else
            exit('');
    end;
    // PW NG 1.0 22112024 - Adding the Feature data from Excel -------------<<<<
}
