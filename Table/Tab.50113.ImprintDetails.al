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
            // AutoIncrement = true;
        }

        field(6; "Imprint Location"; Code[50])
        {
            DataClassification = CustomerContent;
            //  ValidateTableRelation = true;
            TableRelation = "Category Imprint Loc Matrix"."Imprint Location" where("Item No." = field("Item No."));//("Item Category" = field("Item Category"), "Item sub Category" = field("Item sub Category"), "Item sub sub Category" = field("Item sub sub Category"));
            //  TableRelation = "Item Imprint Location"."Imprint Location Code" where("Item No." = field("Item No."));
            Caption = 'Imprint Location';
            trigger OnValidate()
            var
                RecItemImprintDetails: Record "Item Imprint Location";
            begin
                // Added by Nikhil 223-12-2022 S
                //check the option to where imprint location is selcted then no. of colors should be updated to 1
                //now its getting updated once we move cursor from the imprint location
                // if Rec."Document Type" = Rec."Document Type"::Order then
                //  Rec."Number of Color" := 1;
                // Added by Nikhil 223-12-2022 E


                // RecItemImprintDetails.Reset();
                // RecItemImprintDetails.SetRange("Item No.", Rec."Item No.");
                // RecItemImprintDetails.SetRange("Imprint Location Code", Rec."Imprint Location");
                // if RecItemImprintDetails.FindFirst() then
                //     Rec.Validate("Imprint Method", RecItemImprintDetails."Imprint Method");
            end;
        }
        field(7; "Imprint Method"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Category Imprint_M_Matrix"."Imprint Method" where("Item No." = field("Item No."));//where(= field("Item Category"), "Item sub Category" = field("Item sub Category"), "Item sub sub Category" = field("Item sub sub Category"));
            //  TableRelation = "Item Imprint Location"."Imprint Method" where("Item No." = field("Item No."));
            //  ValidateTableRelation = true;
            Caption = 'Imprint Method';

            trigger OnValidate()
            var
                RecArtwork: Record Artwork;
                SalesLine: Record "Sales Line";
                ImprintMethod: Record "Imprint Method";
                ImprintColorDetails: Record "Imprint Color Details";
            begin
                // PW NG 1.0 1608203 START- Imprint Colors are not required for Full Color. Number of Color should be 0. Validations of imprint colors should be removed for Full Color method
                if ImprintMethod.Get(Rec."Imprint Method") then begin
                    Rec."Number of Color" := ImprintMethod."No of Imprint Colors";
                    if ImprintMethod."Color Required" then begin
                        ImprintColorDetails.Reset();
                        ImprintColorDetails.SetRange("Document Type", Rec."Document Type");
                        ImprintColorDetails.SetRange("Document No.", Rec."Document No.");
                        ImprintColorDetails.SetRange("Document Line No.", Rec."Document Line No.");
                        ImprintColorDetails.SetRange("Art ID", Rec."Art ID");
                        if not ImprintColorDetails.IsEmpty then
                            ImprintColorDetails.DeleteAll();
                    end;
                end;
                // PW NG 1.0 1608203 END- Imprint Colors are not required for Full Color. Number of Color should be 0. Validations of imprint colors should be removed for Full Color method
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
        field(9; "Variant Code"; code[100])
        {
            DataClassification = CustomerContent;
            TableRelation = "Item Variant";
            Caption = 'Product Colors';

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
        field(22; "Number of Color"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(23; "Match the LOGO"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(24; "Item Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Item Category".Code;

        }
        field(25; "Item sub Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            //   TableRelation = "Item Category".Code where("Parent Category" = field("Item Category"));

        }
        field(26; "Item sub sub Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Item Category".Code where("Parent Category" = field("Item sub Category"));

        }
        field(27; "Super Rush Order"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Super Rush Order';
        }
        // Added by Nikhil 08-02-2022 for JIRA ID EI-115 +++
        field(28; "Proof Image 5"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image 5';
        }
        field(29; "Proof Pdf 5"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf 5';
        }
        // Added by Nikhil 08-02-2022 for JIRA ID EI-115 +++
        field(30; "Different ART"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(31; "Back Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Document Type", "Document No.", "Document Line No.", "Item No.", "Art ID", "Line No.", "Item Category", "Item sub Category", "Item sub sub Category")
        {
            Clustered = true;
        }
    }



    trigger OnInsert()
    Var
        Artwork: Record Artwork;
        RecITem: Record Item;
        SalesL: Record "Sales Line";
    begin
        if Artwork.Get(Rec."Document Type", Rec."Document No.", Rec."Document Line No.", Rec."Art ID", "Item Category", "Item sub Category", "Item sub sub Category") then begin
            Rec."Document Type" := Artwork."Document Type";
            Rec."Document No." := Artwork."Document No.";
            Rec."Document Line No." := Artwork."Document Line No.";
            Rec."Item No." := Artwork."Item No.";
            Rec."Art ID" := Artwork."Art ID";
            Rec."Line No." := FindMaxLocLineImprintDetail(Artwork);
            Rec."Item Category" := Artwork."Item Category";
            Rec."Item sub Category" := Artwork."Item sub Category";
            Rec."Item sub sub Category" := Artwork."Item sub sub Category";
            Rec."Variant Code" := Artwork."Variant Code";
            // Rec."Imprint Location" := Artwork."Imprint Location";
            // Rec."Imprint Method" := Artwork."Imprint Method";
            //  if Rec."Document Type" = Rec."Document Type"::Order then
            //  Rec."Number of Color" := 1;

            SalesL.Reset();
            SalesL.SetRange("Document Type", Rec."Document Type");
            SalesL.SetRange("Document No.", Rec."Document No.");
            SalesL.SetRange("No.", Rec."Item No.");
            SalesL.SetRange("Is Item Charge Calculated", true);
            if SalesL.FindFirst() then
                SalesL.ModifyAll("Is Item Charge Calculated", false);
        end;


    end;

    trigger OnModify()
    var
        ImpColorDetail: Record "Imprint Color Details";
        RecITem: Record Item;
        SalesL: Record "Sales Line";
    begin

        ImpColorDetail.Reset();
        ImpColorDetail.SetRange("Document Type", Rec."Document Type");
        ImpColorDetail.SetRange("Document No.", Rec."Document No.");
        ImpColorDetail.SetRange("Document Line No.", Rec."Document Line No.");
        ImpColorDetail.SetRange("Art ID", Rec."Art ID");
        ImpColorDetail.SetRange("Loc Line No.", Rec."Line No.");
        ImpColorDetail.ModifyAll("Imprint Location", Rec."Imprint Location", true);
        ImpColorDetail.ModifyAll("Imprint Method", Rec."Imprint Method", true);

        if Rec."Imprint Location" <> xRec."Imprint Location" then begin
            SalesL.Reset();
            SalesL.SetRange("Document Type", Rec."Document Type");
            SalesL.SetRange("Document No.", Rec."Document No.");
            SalesL.SetRange("No.", Rec."Item No.");
            SalesL.SetRange("Is Item Charge Calculated", true);
            if SalesL.FindFirst() then
                SalesL.ModifyAll("Is Item Charge Calculated", false);
        end;
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