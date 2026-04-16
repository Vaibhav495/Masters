table 50114 "Imprint Color Details"
{
    DataClassification = CustomerContent;
    Caption = 'Imprint Color Details';

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Document Type';

        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
        }
        field(3; "Document Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Document Line No.';
        }
        field(4; "Art ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Art ID';
        }
        field(5; "Loc Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Loc Line No.';
        }
        field(6; "Imprint Location"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Item Imprint Location"."Imprint Location Code";
            Caption = 'Imprint Location';
        }
        field(7; "Imprint Method"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Item Imprint Location"."Imprint Location Code";
            Caption = 'Imprint Method';
        }
        field(8; Color; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Imprint Color".Code;
            Caption = 'Color';
            trigger OnValidate()
            var
                ImpColor: Record "Imprint Color";
            begin
                If ImpColor.GET(Rec.Color) then begin
                    Rec."PMS Code" := ImpColor."PMS Code";
                    Rec."PMS Match" := ImpColor."PMS Match";
                    Rec."Color Name" := ImpColor.Name;
                end else begin
                    Clear("PMS Code");
                    Clear("PMS Match");
                    Clear("Color Name");
                end;
            end;
        }
        Field(9; "PMS Match"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'PMS Match';
        }
        field(10; "PMS Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'PMS Code';
        }
        field(11; "Color Name"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Color Name';
        }
        field(12; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item."No.";
            Editable = false;
            Caption = 'Item No.';
        }
        Field(13; Fabric; code[250])
        {
            DataClassification = CustomerContent;
            TableRelation = Fabric;
            Caption = 'Material';
        }
        field(14; "Variant Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Variant Code';
        }
        field(15; "Pantone Color Match"; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {

        key(PK; "Document Type", "Document No.", "Document Line No.", "Art ID", "Loc Line No.", "Item No.", Color)
        {
            Clustered = true;
        }

    }
    var
        RecImprintDetails: Record "Imprint Details";


    trigger OnInsert()
    var
        ImpDetails: Record "Imprint Details";
        ImprintMethod: Record "Imprint Method";

    begin
        RecImprintDetails.Reset();
        RecImprintDetails.SetRange("Document Type", Rec."Document Type");
        RecImprintDetails.SetRange("Document Line No.", Rec."Document Line No.");
        if RecImprintDetails.FindFirst() then
            if Rec."Loc Line No." = 0 then
                Error('Not Allowed Color for Blank Imprint Location on Imprint Details');
        if ImpDetails.GET(Rec."Document Type", Rec."Document No.", Rec."Document Line No.", Rec."Item No.", Rec."Art ID", Rec."Loc Line No.") then begin
            if ImprintMethod.Get(ImpDetails."Imprint Method") And ImprintMethod."Color Required" then
                error('Imprint Color does not required for method "%1".', ImpDetails."Imprint Method");
            Rec."Document Type" := ImpDetails."Document Type";
            Rec."Document No." := ImpDetails."Document No.";
            Rec."Document Line No." := ImpDetails."Document Line No.";
            Rec."Art ID" := ImpDetails."Art ID";
            Rec."Loc Line No." := ImpDetails."Line No.";
            Rec."Item No." := ImpDetails."Item No.";
            Rec."Variant Code" := ImpDetails."Variant Code";
            Rec."Imprint Location" := CopyStr(ImpDetails."Imprint Location", 1, MaxStrLen(Rec."Imprint Location"));
            Rec."Imprint Method" := CopyStr(ImpDetails."Imprint Method", 1, MaxStrLen(Rec."Imprint Method"));
        end;

    end;

}