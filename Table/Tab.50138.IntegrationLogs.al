// PW NG 1.0 11082023 START - Customer Integration Web to BC
table 50138 "Integration Logs"
{
    Caption = 'Integration Logs';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = CustomerContent;
        }
        field(2; "Web Service Name"; Text[100])
        {
            Caption = 'Web Service Name';
            DataClassification = CustomerContent;
        }
        field(3; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            DataClassification = CustomerContent;
        }
        field(4; "Creation Time"; Time)
        {
            Caption = 'Creation Time';
            DataClassification = CustomerContent;
        }
        field(5; "User Id"; Code[50])
        {
            Caption = 'User Id';
            DataClassification = CustomerContent;
        }
        field(6; "Input Request"; Blob)
        {
            Caption = 'Input Request';
            DataClassification = CustomerContent;
        }
        field(7; "Output Request"; Text[2048])
        {
            Caption = 'Output Request';
            DataClassification = CustomerContent;
        }
        field(8; "Request"; Text[2048])
        {
            Caption = 'Request';
            DataClassification = CustomerContent;
        }
        field(9; "Response"; Text[2048])
        {
            Caption = 'Response';
            DataClassification = CustomerContent;
        }
        field(10; "Entry Type"; Enum "Integration Log Type")
        {

            //DataClassification = CustomerContent;
        }
        field(11; "Order No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(12; "Order No. Line no."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(13; Failed; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(14; "Stop Update"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(15; "Scrap update Done"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(17; "Scrap Quantity"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(18; "Produced Quantity"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(19; "Fulfill Scrap/Hold Ship"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(20; "Fulfill Scrap/Partial Ship"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(21; "Partial Ship"; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    procedure InsertInputRequest(InputRequestValue: Text)
    var
        OutStream: OutStream;
    begin
        Clear("Input Request");
        Rec."Input Request".CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(InputRequestValue);
        Modify();
    end;

    procedure ViewInputRequest(): Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields("Input Request");
        "Input Request".CreateInStream(InStream, TEXTENCODING::UTF8);
        exit(TypeHelper.TryReadAsTextWithSepAndFieldErrMsg(InStream, TypeHelper.LFSeparator(), FieldName("Input Request")));
    end;
}
// PW NG 1.0 11082023 START - Customer Integration Web to BC