tableextension 50100 TabExtItem extends Item
{

    fields
    {
        field(50001; "Item Color"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Show On PS"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Imprint Location"; Code[20])
        {

            DataClassification = ToBeClassified;
            Caption = 'Imprint Location';

        }
        field(50004; "Location code"; code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Prod. Location';
            TableRelation = Location;
        }
        field(50005; Material; Text[250])
        {
            DataClassification = ToBeClassified;

        }

        field(50006; Size; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(50007; "Item Sub Category Code"; Code[20])
        {
            Caption = 'Item Sub Category Code';
            TableRelation = "Item Category".Code where("Parent Category" = field("Item Category Code"));

        }
        //Vy++
        field(50008; "Third Party Shipping"; Boolean)
        {
            Caption = 'Third Party Shipping';
            DataClassification = CustomerContent;
        }
        field(50009; "Third Party Shipping Acc. No."; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Third Party Shipping Acc. No.';
        }
        field(50010; "Shipping Agent Code"; Code[10])
        {
            //  AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Agent Code';
            TableRelation = "Item Shipping Agent".Code where(Location = field("Location Code"));
        }
        field(50011; "Shipping Agent ServiceCode"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE("Shipping Agent Code" = FIELD("Shipping Agent Code"));
        }
        field(50012; "Is Accessories"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Is Accessories';
        }
        field(50013; "Rush Item"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Rush Item';
        }
        field(50014; "Item Sub Sub Category Code"; Code[20])
        {
            Caption = 'Item Sub Sub Category Code';
            TableRelation = "Item Category".Code where("Parent Category" = field("Item Sub Category Code"));
            //  TableRelation = "Item Category".Code where("Parent Category" = field("Item Category Code"));
        }
        field(50015; "Charge Item"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50016; "Item_Type"; Enum ItemType)
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "Add Attachment"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50018; "Vendor_Type"; code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Type"."Vendor code";

        }
        // field(50019; "Item Type"; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = "Item Types"."No.";

        //  }
        //vy--

        // PW NG 1.0 23102023 - Item Sync >>>
        field(50019; AreSamplesAvailable; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Web Description"; BLOB)
        {
            Caption = 'Web Description';
        }
        field(50021; "Web Further Description"; BLOB)
        {
            Caption = 'Web Further Description';
        }
        field(50022; IsActive; Boolean)
        {
            Caption = 'IsActive';
        }
        field(50023; IsBillableSample; Boolean)
        {
            Caption = 'IsBillableSample';
        }
        field(50024; IsBlank; Boolean)
        {
            Caption = 'IsBlank';
        }
        field(50025; IsDeleted; Boolean)
        {
            Caption = 'IsDeleted';
        }
        field(50026; ProductVirtualSampleLink; Text[2048])
        {
            Caption = 'ProductVirtualSampleLink';
        }
        field(50027; ProductionTimeInDays; Code[20])
        {
            Caption = 'Production Time In Days';
            TableRelation = "Production Time In Days List";
        }
        // PW NG 1.0 23102023 - Item Sync <<< 

        field(50028; "Vendor Imprint Method"; Code[20])
        {

            DataClassification = ToBeClassified;
            Caption = 'Vendor Imprint Method';

        }
        field(50029; "Imprint Method Filter"; Code[1048])
        {

            DataClassification = ToBeClassified;
            Caption = 'Imprint Method Filter';

        }
        field(50030; "Goods Supplier"; Code[20])
        {

            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

        }
        // PW NG 1.0 21052024 - Added for web integration from D3 to web site >>>
        field(50031; "Post Code"; Code[20])
        {
            Caption = 'Zip Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            ValidateTableRelation = false;
            trigger OnLookup()
            begin

                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(50032; County; Text[30])
        {

            Caption = 'State Code';
        }
        field(50033; "Country/Region Code"; Code[10])
        {
            Caption = 'Country Code';
            TableRelation = "Country/Region";
            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");

            end;

        }
        field(50034; "City"; Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            ValidateTableRelation = false;
            trigger OnLookup()
            begin
                PostCode.LookupPostCode(Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code");
            end;

            trigger OnValidate()

            begin
                PostCode.ValidateCity(Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;

        }
        field(50035; "Meta Keyword"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50036; "Meta Description"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 21052024 - Added for web integration from D3 to web site <<<
        field(50037; "Non Material Vendor"; Code[30])
        {
            TableRelation = Vendor."No.";
        }
        field(50038; "Non Material Vendor Loc"; Code[30])
        {
            TableRelation = Location.Code;
        }
        //>>PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50039; "QuickBook ID"; Code[100])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC

        //>>PW MR 26th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50040; "QuickBook Error"; Text[2048])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 26th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50041; "QuickBook Sync Failed"; Boolean)
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC

        // field(50042; "Wh IID Inven Qty"; Decimal)
        // {
        //     CalcFormula = sum("Bin Content".Quantity where("Location Code" = filter('IID'),
        //                                                         "Item No." = field("No."),
        //                                                         "Bin Type Code" = filter('PUTPICK')));
        //     FieldClass = FlowField;
        // }
        // field(50043; "Wh IID InvPick Qty (Base)"; Decimal)
        // {
        //     CalcFormula = sum("Warehouse Activity Line"."Qty. Outstanding (Base)" where("Location Code" = filter('IID'),
        //                                                                                  "Item No." = field("No."),
        //                                                                                  "Assemble to Order" = const(false)));
        //     FieldClass = FlowField;
        // }

        field(50044; "Vendor Ref. No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = "Item Reference"."Reference Type No." where("Reference Type" = const(Vendor), "Item No." = field("No."));
            //This property is currently not supported
            //TestTableRelation = true;
            ValidateTableRelation = true;

            // trigger OnValidate()
            // var
            //     ItemRef: Record "Item Reference";
            // begin
            //     Rec.Validate("Vendor No.", Rec."Vendor Ref. No.");
            //     ItemRef.Reset();
            //     ItemRef.SetRange(ItemRef."Reference Type", ItemRef."Reference Type"::Vendor);
            //     ItemRef.SetRange(ItemRef."Reference Type No.", Rec."Vendor Ref. No.");
            //     ItemRef.SetRange(ItemRef."Item No.", Rec."No.");
            //     IF ItemRef.FindFirst() THEN
            //         Rec."Vendor Item No." := ItemRef."Reference No.";
            // end;
        }

        field(50045; Brand; Code[100])
        {
            DataClassification = CustomerContent;
            TableRelation = Brand.Code;
        }

        field(50046; BulkSynch; Boolean)
        {
            Caption = 'BulkSynch';
        }
        field(50047; "Category Attribute"; Text[250])
        {
            DataClassification = CustomerContent;

        }
    }
    // PW NG 1.0 23102023 - Item Sync >>>

    // trigger OnInsert()
    // var
    //     SalesRecSetup: record "Sales & Receivables Setup";
    // begin
    //     if Rec."No." <> '' then begin
    //         SalesRecSetup.Get();
    //         Rec."Gen. Prod. Posting Group" := SalesRecSetup."GenProdPosting Group for Item";
    //         Rec."Sales Unit of Measure" := SalesRecSetup.BUOM;
    //     end;

    //     Rec.Item_Type := Rec.Item_Type::"China Vendor";
    // end;
    var
        PostCode: Record "Post Code";

    procedure SetWebDescription(NewWebDescription: Text)
    var
        OutStream: OutStream;
    begin
        Clear("Web Description");
        "Web Description".CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(NewWebDescription);
        Modify();
    end;

    procedure GetWebDescription() WebDescription: Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields("Web Description");
        "Web Description".CreateInStream(InStream, TEXTENCODING::UTF8);
        InStream.ReadText(WebDescription);
        exit(WebDescription);
        // exit(TypeHelper.TryReadAsTextWithSepAndFieldErrMsg(InStream, TypeHelper.LFSeparator(), FieldName("Web Description")));
    end;

    procedure SetFurtherDescription(NewFurtherDescription: Text)
    var
        OutStream: OutStream;
    begin
        Clear("Web Further Description");
        "Web Further Description".CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(NewFurtherDescription);
        Modify();
    end;

    procedure GetFurtherDescription() FurtherDescription: Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields("Web Further Description");
        "Web Further Description".CreateInStream(InStream, TEXTENCODING::UTF8);
        InStream.ReadText(FurtherDescription);
        exit(FurtherDescription);
        // exit(TypeHelper.TryReadAsTextWithSepAndFieldErrMsg(InStream, TypeHelper.LFSeparator(), FieldName("Web Further Description")));
    end;
    // PW NG 1.0 23102023 - Item Sync <<<
}