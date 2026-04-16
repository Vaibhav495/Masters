table 50101 "Item Carton"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Item No."; code[50])
        {
            CaptionML = ENU = 'Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
        }
        field(2; "Carton Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Carton Master"."Carton Code";
        }
        field(3; "Carton Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Item Quantity"; Decimal)
        {
            CaptionML = ENU = 'Item Quantity';
            DataClassification = ToBeClassified;
        }
        field(5; Length; Decimal)
        {
            CaptionML = ENU = 'Length';
            DataClassification = ToBeClassified;
        }
        field(6; Width; Decimal)
        {
            CaptionML = ENU = 'Width';
            DataClassification = ToBeClassified;
        }
        field(7; Height; Decimal)
        {
            CaptionML = ENU = 'Height';
            DataClassification = ToBeClassified;
        }
        field(8; Weight; Decimal)
        {
            CaptionML = ENU = 'Weight';
            DataClassification = ToBeClassified;
        }
        field(9; "Default Web"; Boolean)
        {
            CaptionML = ENU = 'Default Web';
            DataClassification = ToBeClassified;
        }
        field(10; "Sequence Web"; Integer)
        {
            CaptionML = ENU = 'Sequence Web';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Item No.", "Carton Code")
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