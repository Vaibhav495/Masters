table 50128 "Item Charge Cost"
{
    DataClassification = ToBeClassified;
    // ObsoleteState = Removed;
    // ObsoleteReason = 'Change In PK';
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
    }

    keys
    {
        key(PK; "Vendor No.")
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