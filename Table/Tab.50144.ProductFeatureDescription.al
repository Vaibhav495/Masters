table 50144 "Product Feature Description"
{
    Caption = 'Product Feature Description';
    DataCaptionFields = "Product Code", "Product Group Name", "Product Key Name", Sequence;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Product Code"; Code[20])
        {
            Caption = 'Product Code';
            TableRelation = Item;
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Item: Record Item;
            begin
                if Item.Get(Rec."Product Code") then
                    Rec."Product Description" := Item.Description;

            end;
        }
        field(2; "Product Group Code"; Code[20])
        {
            Caption = 'Product Group Code';
            TableRelation = "Product Group Master";
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                ProductGroupMaster: Record "Product Group Master";
            begin
                if ProductGroupMaster.Get(Rec."Product Group Code") then
                    Rec."Product Group Name" := ProductGroupMaster.Description;
            end;
        }
        field(3; "Product Group Key Code"; Code[20])
        {
            Caption = 'Product Group Key Code';
            TableRelation = "Product Key Master";
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                ProductKeyMaster: Record "Product Key Master";
            begin
                if ProductKeyMaster.Get(Rec."Product Group Key Code") then
                    Rec."Product Key Name" := ProductKeyMaster.Description;
            end;
        }
        field(4; Sequence; Integer)
        {
            Caption = 'Sequence';
            DataClassification = CustomerContent;
        }
        field(10; "Product Description"; Text[100])
        {
            Caption = 'Product Description';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(11; "Product Group Name"; Text[100])
        {
            Caption = 'Product Group Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(12; "Product Key Name"; Text[100])
        {
            Caption = 'Product Key Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(13; "Web Value"; Blob)
        {
            Caption = 'Web Value';
        }
        field(14; "Product Group Seq"; Integer)
        {
            Caption = 'Product Group Sequence';
        }
    }
    keys
    {
        key(PK; "Product Code", "Product Group Code", "Product Group Key Code", Sequence)
        {
            Clustered = true;
        }
        key(SK; "Product Code", Sequence)
        {
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Product Code", "Product Group Name", "Product Key Name", Sequence) { }
    }

    procedure SetDescription(Description: Text)
    var
        OutStream: OutStream;
    begin
        Clear("Web Value");
        "Web Value".CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(Description);
        Modify();
    end;

    procedure GetDescription(): Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields("Web Value");
        "Web Value".CreateInStream(InStream, TEXTENCODING::UTF8);
        exit(TypeHelper.TryReadAsTextWithSepAndFieldErrMsg(InStream, TypeHelper.LFSeparator(), FieldName("Web Value")));
    end;
}
