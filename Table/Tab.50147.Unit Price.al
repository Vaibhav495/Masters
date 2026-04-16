table 50147 "Unit Price"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "Unit Price";
    LookupPageId = "Unit Price";
    fields
    {
        field(1; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Imprint Method"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Category Imprint_M_Matrix"."Imprint Method" WHERE("Vendor No." = field("Vendor No."), "Item No." = field("Item No."));
            // TableRelation = "Imprint Method".Code WHERE("Vendor No." = field("Vendor No."));
        }
        field(3; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(4; "Vendor Price"; decimal)
        {
            DataClassification = ToBeClassified;
            AutoFormatType = 2;
            MinValue = 0;
        }
        field(5; "Minimum Quantity"; Decimal)
        {
            Caption = 'Minimum Quantity';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(6; "Sales Price"; Decimal)
        {
            AccessByPermission = tabledata "Sales Price Access" = R;
            DataClassification = CustomerContent;
            //AutoFormatExpression = "Currency Code";
            //AutoFormatType = 2;
            Caption = 'Sales Price';
            MinValue = 0;
            DecimalPlaces = 0 : 2;


        }
        field(7; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;

        }
        field(8; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = CustomerContent;
        }
        field(9; "Catlog Code"; Code[10])
        {
            Caption = 'Discount Code';
            DataClassification = ToBeClassified;
            TableRelation = Relative.Code;

        }
        field(10; "Web Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                RelativePerc: Record "Relative";
                SalesRec: Record "Sales & Receivables Setup";
            begin
                // Clear(RelativePerc);
                // if RelativePerc.Get(Rec."Rush Discount SP") then
                //     Rec."Rush LP" := Rec."Web Price" + ((Rec."Web Price" * RelativePerc.Percentage) / 100);
                // Clear(RelativePerc);
                // if RelativePerc.Get(Rec."SuperRush Discount SP") then
                //     Rec."Super Rush LP" := Rec."Web Price" + ((Rec."Web Price" * RelativePerc.Percentage) / 100);

                SalesRec.Get();
                SalesRec.TestField("Rush Sales Price %");
                SalesRec.TestField("Super Rush Sales Price %");
                // Clear(RelativePerc);
                // if RelativePerc.Get(Rec."Rush Discount SP") then
                Rec."Rush LP" := ROUND(Rec."Web Price" + ((Rec."Web Price" * SalesRec."Rush Sales Price %") / 100), 0.01, '=');
                // Clear(RelativePerc);
                // if RelativePerc.Get(Rec."SuperRush Discount SP") then
                Rec."Super Rush LP" := ROUND(Rec."Web Price" + ((Rec."Web Price" * SalesRec."Super Rush Sales Price %") / 100), 0.01, '=');


            end;
        }
        field(11; "Rush Sales Price"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(12; "Super Rush Sales Price"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(13; "Vendor Rush Cost"; decimal)
        {
            DataClassification = ToBeClassified;
            AutoFormatType = 2;
            MinValue = 0;
        }
        field(14; "Pending update"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(15; "Variant Code Lookup"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Item No."));
            ValidateTableRelation = false;
        }
        field(16; "Sync Through Config"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 23102023 - Item Sync >>>
        field(20; IsActive; Boolean)
        {
            Caption = 'Is Active';
            InitValue = true;
            DataClassification = ToBeClassified;
        }
        field(21; IsRegularPrice; Boolean)
        {
            Caption = 'Is Regular Price';
            DataClassification = ToBeClassified;
        }
        field(22; IsCallForPrice; Boolean)
        {
            Caption = 'Is CallFor Price';
            DataClassification = ToBeClassified;
        }
        field(23; StrikePrice; Decimal)
        {
            Caption = 'Strike Price';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
        }
        field(24; WebExpirationDate; Date)
        {
            Caption = 'Web Expiration Date';
            DataClassification = ToBeClassified;
        }
        field(25; "NoteText"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "NoteText2"; Text[2048])
        {
            DataClassification = ToBeClassified;

        }
        field(27; "Price Attributes"; Code[20])
        {
            DataClassification = ToBeClassified;
            ValidateTableRelation = false; //0603
            TableRelation = "Web Sales Price Attribute".Name where("Item No." = field("Item No."));//0603
                                                                                                   // TableRelation = "Web Sales Price Attribute".Code where("Item No." = field("Item No."));
        }
        field(28; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(29; "Price Attributes Seq"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Price Attributes Sequence';
        }
        // PW NG 1.0 23102023 - Item Sync <<< 

        field(30; "Rush LP"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Rush LP';

        }
        field(31; "Super Rush LP"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Super Rush LP';

        }
        field(32; "Rush Discount SP"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Relative.Code;
            Caption = 'Rush Discount Code';
            trigger OnValidate()
            var
                RelativePerc: Record "Relative";
            begin
                if RelativePerc.Get(Rec."Rush Discount SP") then
                    //Rec."Rush LP" := Rec."Rush LP" + ((Rec."Rush LP" * RelativePerc.Percentage) / 100);
                Rec."Rush LP" := Rec."Web Price" + ((Rec."Web Price" * RelativePerc.Percentage) / 100);
            end;

        }
        field(33; "SuperRush Discount SP"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Relative.Code;
            Caption = 'Super Rush Discount Code';
            trigger OnValidate()
            var
                RelativePerc: Record "Relative";
            begin
                if RelativePerc.Get(Rec."SuperRush Discount SP") then
                    //Rec."Super Rush LP" := Rec."Super Rush LP" + ((Rec."Super Rush LP" * RelativePerc.Percentage) / 100);
                Rec."Super Rush LP" := Rec."Web Price" + ((Rec."Web Price" * RelativePerc.Percentage) / 100);
            end;
        }
        field(34; "Rush SP on web"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Rush LP on Web';

        }
        field(35; "Super Rush SP onweb"; Decimal)
        {
            DataClassification = ToBeClassified;
            ObsoleteReason = 'not used for imprint ID website Sync';
            ObsoleteState = Pending;
        }
        field(36; "Super Rush LP on web"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Super Rush LP on Web';

        }
        field(37; "Super Rush Price Attribute"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Super Rush Price Attributes';
        }
        field(38; "Rush Price Attribute"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Rush Price Attributes';
        }
        field(39; "Vendor Super Rush Cost"; decimal)
        {
            DataClassification = ToBeClassified;
            AutoFormatType = 2;
            MinValue = 0;
        }
        field(40; "Vendor Decoration Price"; decimal)
        {
            Caption = 'Decoration Cost';
            DataClassification = ToBeClassified;
            AutoFormatType = 2;
            MinValue = 0;
        }
        field(41; "Vendor Blank Price"; decimal)
        {
            DataClassification = ToBeClassified;
            AutoFormatType = 2;
            MinValue = 0;
        }
        field(42; "PriceBreakNameNew"; Text[250])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Web Sales Price Attribute".Code where("Item No." = field("Item No."));
            // TableRelation = "Unit Price"."Price Attributes" where("Imprint Method" = field("Imprint Method"), "Item No." = field("Item No."), "Price Attributes" = filter(<> ''));
        }
    }

    keys
    {
        key(Key1; "Item No.", "Imprint Method", "Vendor No.", "Minimum Quantity", "Variant Code Lookup", "Starting Date", "Ending Date", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        UnitPrice: Record "Unit Price";


    trigger OnInsert()
    begin
        Rec."Pending update" := true;
        // UnitPrice.Reset();
        // UnitPrice.SetCurrentKey("Item No.", "Imprint Method", "Vendor No.", "Minimum Quantity", "Variant Code Lookup", "Starting Date", "Ending Date", "Line No.");
        // UnitPrice.SetRange("Item No.", Rec."Item No.");
        // UnitPrice.SetRange("Imprint Method", Rec."Imprint Method");
        // UnitPrice.SetRange("Vendor No.", Rec."Vendor No.");
        // UnitPrice.SetRange("Minimum Quantity", Rec."Minimum Quantity");
        // UnitPrice.SetRange("Variant Code Lookup", Rec."Variant Code Lookup");
        // UnitPrice.SetRange("Starting Date", Rec."Starting Date");
        // UnitPrice.SetRange("Ending Date", Rec."Ending Date");
        // UnitPrice.SetRange("Price Attributes", Rec."Price Attributes");
        // UnitPrice.SetFilter("Line No.", '<>%1', Rec."Line No.");
        // if UnitPrice.FindFirst() then;
        //  Error('Unit Price already exists.');
    end;

    trigger OnModify()
    begin
        Rec."Pending update" := true;
        // UnitPrice.Reset();
        // UnitPrice.SetCurrentKey("Item No.", "Imprint Method", "Vendor No.", "Minimum Quantity", "Variant Code Lookup", "Starting Date", "Ending Date", "Line No.");
        // UnitPrice.SetRange("Item No.", Rec."Item No.");
        // UnitPrice.SetRange("Imprint Method", Rec."Imprint Method");
        // UnitPrice.SetRange("Vendor No.", Rec."Vendor No.");
        // UnitPrice.SetRange("Minimum Quantity", Rec."Minimum Quantity");
        // UnitPrice.SetRange("Variant Code Lookup", Rec."Variant Code Lookup");
        // UnitPrice.SetRange("Starting Date", Rec."Starting Date");
        // UnitPrice.SetRange("Ending Date", Rec."Ending Date");
        // UnitPrice.SetRange("Price Attributes", Rec."Price Attributes");
        // UnitPrice.SetFilter("Line No.", '<>%1', Rec."Line No.");
        // if UnitPrice.FindFirst() then;
        //  Error('Unit Price already exists.');
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin
        Rec."Pending update" := true;
        // UnitPrice.Reset();
        // UnitPrice.SetCurrentKey("Item No.", "Imprint Method", "Vendor No.", "Minimum Quantity", "Variant Code Lookup", "Starting Date", "Ending Date", "Line No.");
        // UnitPrice.SetRange("Item No.", Rec."Item No.");
        // UnitPrice.SetRange("Imprint Method", Rec."Imprint Method");
        // UnitPrice.SetRange("Vendor No.", Rec."Vendor No.");
        // UnitPrice.SetRange("Minimum Quantity", Rec."Minimum Quantity");
        // UnitPrice.SetRange("Variant Code Lookup", Rec."Variant Code Lookup");
        // UnitPrice.SetRange("Starting Date", Rec."Starting Date");
        // UnitPrice.SetRange("Ending Date", Rec."Ending Date");
        // UnitPrice.SetRange("Price Attributes", Rec."Price Attributes");
        // UnitPrice.SetFilter("Line No.", '<>%1', Rec."Line No.");
        // if UnitPrice.FindFirst() then;
        // Error('Unit Price already exists.');
    end;

}