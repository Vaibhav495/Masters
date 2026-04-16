table 50129 "Item Charge Costs"
{
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Vendor No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

        }
        field(2; "Vendor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Item No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
        }
        field(4; "Item Charge Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";
        }
        field(5; "Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;
        }
        field(6; "Imprint Method"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Imprint Method".Code;

        }
    }

    keys
    {
        key(PK; "Vendor No.", "Imprint Method", "Item No.", "Item Charge Code")
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