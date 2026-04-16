table 50303 "Scrap Handling"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Scrap Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Discard Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Move to Sample"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Processed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Imprint Method"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Station; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Item No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Varient; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(11; "Order Line no"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(12; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            TableRelation = Zone.Code where("Location Code" = field("Location Code"));
        }
        field(13; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = if ("Zone Code" = filter('')) Bin.Code where("Location Code" = field("Location Code"))
            else
            if ("Zone Code" = filter(<> '')) Bin.Code where("Location Code" = field("Location Code"),
                                                                               "Zone Code" = field("Zone Code"));

        }
        field(14; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }

    }

    keys
    {
        key(Key1; "Order No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
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