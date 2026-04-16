table 50106 "Charge Setup Buffer"
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

        }
        field(3; "Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Item,Order';
            OptionMembers = Item,Order;

        }
        field(4; "No."; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Charge Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";

        }
        field(6; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Product ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Starting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(10; "Ending Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Imprint Location"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(12; "Imprint Method"; Code[50])
        {
            DataClassification = ToBeClassified;
            // TableRelation = IF (Type = CONST (Item)) "Item Imprint Location"."Imprint Method" WHERE ("Item No." = FIELD ("No."));
        }
        field(13; Cost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Reduced By"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Minimum Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Specific Charge Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Gift Wrap,Labling';
            OptionMembers = ,"Gift Wrap",Labling;
        }
        field(17; "Catalog Code"; code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Website Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Exclude Repeat Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Maximum Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Application Method"; Option)
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
        field(22; "Full Color"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Charge Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Standard,Optional';
            OptionMembers = Standard,Optional;

        }
        field(24; "Item Attribute"; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Attribute".Name where(Type = filter(Option | Text));
            ValidateTableRelation = False;
        }
        field(25; Select; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Pantone Color Charge"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; Colors; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Single Color Only","1st Color","2nd Color","3rd Color","4th Color","5th Color","6th Color","more than two color","Multi Color","Up-to 3 Colors","3-4 Color Imprint";
            OptionCaptionML = ENU = '  ,Single Color Only,1st Color,2nd Color,3rd Color,4th Color,5th Color,6th Color,more than two color,Multi Color,Up-to 3 Colors,3-4 Color Imprint';
        }
        field(28; "Minimum Stitches"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Maximum Stitches"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Repeat Orders Only"; Boolean)
        {
            DataClassification = ToBeClassified;

        }

        field(31; "Application Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Per Color,Per Design,Per Location,Per color/ Per design,Per color/Per location';
            OptionMembers = " ","Per Color","Per Design","Per Location","Per color/ Per design","Per color/Per location";
        }
        field(32; "Reduced By Location"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(50999; "Order No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Applies To", "Applies To Id", "Type", "No.", "Imprint Location", "Imprint Method", "Charge Code", "Starting Date", "Minimum Quantity", "Minimum Stitches")
        {
            Clustered = true;
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
