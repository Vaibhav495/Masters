table 50124 "Category Imprint_M_Matrix"
{
    DataClassification = ToBeClassified;

    fields
    {
        // field(1; "Item Category"; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = "Item Category".Code;

        // }
        // field(2; "Item sub Category"; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = "Item Category".Code where("Parent Category" = field("Item Category"));

        // }
        // field(3; "Item sub sub Category"; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     // TableRelation = "Item Category".Code where("Parent Category" = field("Item Category"));
        //     TableRelation = "Item Category".Code where("Parent Category" = field("Item sub Category"));

        // }
        field(1; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item."No.";
            Editable = false;
            Caption = 'Item No.';
        }
        field(2; "Imprint Method"; Code[20])
        {
            // DataClassification = ToBeClassified;
            // TableRelation = "Imprint Method".Code where("Vendor No." = field("Vendor No."));

            TableRelation = if ("Vendor No." = filter('')) "Imprint Method".Code else
            "Imprint Method".Code where("Vendor No." = field("Vendor No."));


        }
        field(3; Default; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        // PW NG 1.0 Product Integration >>>
        field(5; "Web Sequence"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 Product Integration <<<
    }

    keys
    {
        key(pk; "Item No.", "Imprint Method", "Vendor No.")
        {
            Clustered = true;
        }
        // key(Key2; "Vendor No.")
        // {
        // }


    }
    fieldgroups
    {
        fieldgroup(DropDown; "Item No.", "Imprint Method", "Vendor No.")
        {
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        if "Imprint Method" = '' then
            Error('Please add Imprint Method');

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