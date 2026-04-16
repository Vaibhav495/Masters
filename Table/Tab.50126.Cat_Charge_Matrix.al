table 50126 "Category Charge Matrix"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Applies To"; Option)
        {
            CaptionML = ENU = 'Applies To';
            OptionCaptionML = ENU = 'All Customers,Customer,Customer Price Group,None';
            OptionMembers = "All Customers",Customer,"Customer Price Group",None;

        }
        field(2; "Applies To Id"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF ("Applies To" = CONST("Customer Price Group")) "Customer Price Group" ELSE
            IF ("Applies To" = CONST(Customer)) Customer;
        }
        field(3; "Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Item,Order';
            OptionMembers = Item,Order;
        }

        // field(4; "Item Category"; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = "Item Category".Code;

        // }
        // field(5; "Item sub Category"; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = "Item Category".Code where("Parent Category" = field("Item Category"));

        // }
        // field(6; "Item sub sub Category"; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = "Item Category".Code where("Parent Category" = field("Item sub Category"));
        //     // TableRelation = "Item Category".Code where("Parent Category" = field("Item Category"));

        // }
        field(7; "Imprint Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Imprint Location Master".code;

        }
        field(8; "Imprint Method"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Vendor No." = filter('')) "Imprint Method".Code else
            "Imprint Method".Code where("Vendor No." = field("Vendor No."));

            //   TableRelation = "Imprint Method".Code where("Vendor No." = field("Vendor No."));

        }
        field(9; "Charge Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";

        }
        field(10; "Charge Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;
        }
        field(12; "Starting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Ending Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Repeat Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; Cost; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;
        }

        field(16; "Minimum Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Specific Charge Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Gift Wrap,Labling';
            OptionMembers = ,"Gift Wrap",Labling;
        }
        field(18; "Catalog Code"; code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Relative.Code;
        }
        field(19; "Website Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;
        }
        field(20; "Exclude Repeat Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Maximum Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Application Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Flat,Quantity';
            OptionMembers = Flat,Quantity;
            /*trigger OnValidate()

            begin
                if "Application Method" = "Application Method"::Custome then
                    TestField("Charge Type", "Charge Type"::Optional);
            end;
            */
        }
        field(23; "Full Color"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Charge Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Standard,Optional';
            OptionMembers = Standard,Optional;

        }
        field(25; "Item Attribute"; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Attribute".Name where(Type = filter(Option | Text));
            ValidateTableRelation = False;
        }
        field(26; Select; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Pantone Color Charge"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(28; Colors; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Single Color Only","1st Color","2nd Color","3rd Color","4th Color","5th Color","6th Color","more than two color","Multi Color","Up-to 3 Colors","3-4 Color Imprint";
            OptionCaptionML = ENU = '  ,Single Color Only,1st Color,2nd Color,3rd Color,4th Color,5th Color,6th Color,more than two color,Multi Color,Up-to 3 Colors,3-4 Color Imprint';
        }
        field(29; "Minimum Stitches"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Maximum Stitches"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(31; "Application Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Per Color,Per Design,Per Location,Per color/ Per design,Per color/Per location,Vendorwise Reverse';
            OptionMembers = " ","Per Color","Per Design","Per Location","Per color/ Per design","Per color/Per location","Vendorwise Reverse";
        }
        field(32; "Reduced By Location"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Parent Product ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Color"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Imprint Options"; Code[80])
        {
            DataClassification = ToBeClassified;
            TableRelation = Imprint_Options.code;
        }
        field(36; "Reduced By"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Item Charge Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;
        }
        field(38; "Diff ART Reverse Side"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Reverse Side"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        // field(40; "Location code"; code[10])
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'Location';
        //     TableRelation = Location;
        // }
        field(40; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(41; "Vendor Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;
        }
        field(42; "SETUP Charge"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "PMS Charge"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Is Active"; Boolean)
        {
            DataClassification = ToBeClassified;
            InitValue = true;

        }
        field(45; "Website Sequence"; Integer)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(pk; "Applies To", "Applies To Id", "Type", "Imprint Location", "Imprint Method", "Charge Code", "Minimum Quantity", "Minimum Stitches")
        {
            Clustered = true;
        }
        key(SK; "Website Sequence")
        {
#pragma warning disable AL0262
            //Clustered = true;
#pragma warning restore AL0262
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}