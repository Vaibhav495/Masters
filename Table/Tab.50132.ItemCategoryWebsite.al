table 50132 "Item Category Website"
{
    Caption = 'Item Category Website';
    DataClassification = CustomerContent;
    DrillDownPageId = "Item Category Website";
    LookupPageId = "Item Category Website";

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
            DataClassification = CustomerContent;
        }
        field(11; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category";
            trigger OnValidate()
            var
                ItemCategory: Record "Item Category";
            begin
                if ItemCategory.Get(Rec."Item Category Code") then
                    Rec."Item Category Des" := ItemCategory.Description;
            end;
        }
        field(12; "Item Sub Category Code"; Code[20])
        {
            Caption = 'Item Sub Category Code';
            TableRelation = "Item Category".Code where("Parent Category" = field("Item Category Code"));
            trigger OnValidate()
            var
                ItemCategory: Record "Item Category";
            begin
                if ItemCategory.Get(Rec."Item Sub Category Code") then
                    Rec."Item Sub Category Des" := ItemCategory.Description;
            end;

        }
        field(13; "Item Sub Sub Category Code"; Code[20])
        {
            Caption = 'Item Sub Sub Category Code';
            TableRelation = "Item Category".Code where("Parent Category" = field("Item Sub Category Code"));
            trigger OnValidate()
            var
                ItemCategory: Record "Item Category";
            begin
                if ItemCategory.Get(Rec."Item Sub Sub Category Code") then
                    Rec."Item Sub Sub Category Des" := ItemCategory.Description;
            end;
        }
        field(14; "Item Sub Sub Sub Category Code"; Code[20])
        {
            Caption = 'Item Sub Sub Sub Category Code';
            TableRelation = "Item Category".Code where("Parent Category" = field("Item Sub Sub Category Code"));
            trigger OnValidate()
            var
                ItemCategory: Record "Item Category";
            begin
                if ItemCategory.Get(Rec."Item Sub Sub Sub Category Code") then
                    Rec."Item Sub Sub Sub Category Des" := ItemCategory.Description;
            end;
        }
        field(20; "Item Category Des"; Text[100])
        {
            Caption = 'Item Category Description';
        }
        field(21; "Item Sub Category Des"; Text[100])
        {
            Caption = 'Item Sub Category Description';
        }
        field(22; "Item Sub Sub Category Des"; Text[100])
        {
            Caption = 'Item Sub Sub Category Description';
        }
        field(23; "Item Sub Sub Sub Category Des"; Text[100])
        {
            Caption = 'Item Sub Sub Sub Category Description';
        }

    }
    keys
    {
        key(PK; "Item No.", "Item Category Code", "Item Sub Category Code", "Item Sub Sub Category Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Item No.", "Item Category Code", "Item Sub Category Code", "Item Sub Sub Category Code") { }
    }
}
