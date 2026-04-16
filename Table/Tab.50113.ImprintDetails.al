table 50113 "Imprint Details"
{
    DataClassification = CustomerContent;
    Caption = 'Imprint Details';

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
        field(5; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
        }

        field(6; "Imprint Location"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Item Imprint Location"."Imprint Location Code" where("Item No." = field("Item No."));
            Caption = 'Imprint Location';
            trigger OnValidate()
            var
                RecItemImprintDetails: Record "Item Imprint Location";
            begin
                RecItemImprintDetails.Reset();
                RecItemImprintDetails.SetRange("Item No.", Rec."Item No.");
                RecItemImprintDetails.SetRange("Imprint Location Code", Rec."Imprint Location");
                if RecItemImprintDetails.FindFirst() then
                    Rec.Validate("Imprint Method", RecItemImprintDetails."Imprint Method");
            end;
        }
        field(7; "Imprint Method"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Item Imprint Location"."Imprint Method" where("Item No." = field("Item No."));
            Caption = 'Imprint Method';

            trigger OnValidate()
            var
                RecArtwork: Record Artwork;
            begin
                RecArtwork.Reset();
                RecArtwork.SetRange("Art ID", Rec."Art ID");
                if RecArtwork.FindFirst() then begin
                    if Rec."Imprint Method" = 'FULL COLOR' then
                        RecArtwork.Composition := RecArtwork.Composition::"Full Color";

                    if Rec."Imprint Method" = 'SPOT COLOR' then
                        RecArtwork.Composition := RecArtwork.Composition::"Spot Color";
                    RecArtwork.Modify()
                end;
            end;
        }
        field(8; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item."No.";
            Editable = false;
            Caption = 'Item No.';
        }
        field(9; "Variant Code"; code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Item Variant";
            Caption = 'Variant Code';

        }
        field(10; "Proof Image"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image';
        }
        field(11; "Proof Pdf"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf';
        }
        field(12; "Proof Image 2"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image 2';
        }
        field(13; "Proof Pdf 2"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf 2';
        }
        field(14; "Proof Image 3"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image 3';
        }
        field(15; "Proof Pdf 3"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf 3';
        }
        field(16; "Proof Image 4"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image 4';
        }
        field(17; "Proof Pdf 4"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf 4';
        }
        field(18; "Proof Status 1"; Enum "Proof Status")
        {

            FieldClass = FlowField;
            CalcFormula = lookup(Artwork."Proof Status 1" where("Art ID" = field("Art ID"), "Document No." = field("Document No."), "Document Line No." = field("Document Line No."), "Proof Image" = field("Proof Image")));
            Caption = 'Proof Status 1';
        }
        field(19; "Proof Status 2"; Enum "Proof Status")
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Artwork."Proof Status 2" where("Art ID" = field("Art ID"), "Document No." = field("Document No."), "Document Line No." = field("Document Line No."), "Proof Image 2" = field("Proof Image 2")));
            Caption = 'Proof Status 2';

        }
        field(20; "Proof Status 3"; Enum "Proof Status")
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Artwork."Proof Status 3" where("Art ID" = field("Art ID"), "Document No." = field("Document No."), "Document Line No." = field("Document Line No."), "Proof Image 3" = field("Proof Image 3")));
            Caption = 'Proof Status 3';

        }
        field(21; "Repeat SIDE1 Imprint"; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Document Type", "Document No.", "Document Line No.", "Item No.", "Art ID", "Line No.")
        {
            Clustered = true;
        }
    }



    trigger OnInsert()
    Var
        Artwork: Record Artwork;
    begin
        if Artwork.Get(Rec."Document Type", Rec."Document No.", Rec."Document Line No.", Rec."Art ID") then begin
            Rec."Document Type" := Artwork."Document Type";
            Rec."Document No." := Artwork."Document No.";
            Rec."Document Line No." := Artwork."Document Line No.";
            Rec."Item No." := Artwork."Item No.";
            Rec."Art ID" := Artwork."Art ID";
            Rec."Line No." := FindMaxLocLineImprintDetail(Artwork);
            Rec."Variant Code" := Artwork."Variant Code";
        end;

    end;

    trigger OnModify()
    var
        ImpColorDetail: Record "Imprint Color Details";
    begin
        ImpColorDetail.Reset();
        ImpColorDetail.SetRange("Document Type", Rec."Document Type");
        ImpColorDetail.SetRange("Document No.", Rec."Document No.");
        ImpColorDetail.SetRange("Document Line No.", Rec."Document Line No.");
        ImpColorDetail.SetRange("Art ID", Rec."Art ID");
        ImpColorDetail.SetRange("Loc Line No.", Rec."Line No.");
        ImpColorDetail.ModifyAll("Imprint Location", Rec."Imprint Location", true);
        ImpColorDetail.ModifyAll("Imprint Method", Rec."Imprint Method", true);

    end;

    trigger OnDelete()
    var
        ImpColorDetail: Record "Imprint Color Details";
    begin
        ImpColorDetail.Reset();
        ImpColorDetail.SetRange("Document Type", Rec."Document Type");
        ImpColorDetail.SetRange("Document No.", Rec."Document No.");
        ImpColorDetail.SetRange("Document Line No.", Rec."Document Line No.");
        ImpColorDetail.SetRange("Art ID", Rec."Art ID");
        ImpColorDetail.SetRange("Loc Line No.", Rec."Line No.");
        ImpColorDetail.DeleteAll();

    end;

    procedure FindMaxLocLineImprintDetail(var Artwork: Record Artwork): Integer
    var
        ImprintDetail: Record "Imprint Details";
    begin
        ImprintDetail.Reset();
        ImprintDetail.SetRange("Document Type", Artwork."Document Type");
        ImprintDetail.SetRange("Document No.", Artwork."Document No.");
        ImprintDetail.SetRange("Document Line No.", Artwork."Document Line No.");
        ImprintDetail.SetRange("Item No.", Artwork."Item No.");
        ImprintDetail.SetRange("Art ID", Artwork."Art ID");
        if ImprintDetail.FindLast() then
            exit(ImprintDetail."Line No." + 10000)
        else
            exit(10000);

    end;


}