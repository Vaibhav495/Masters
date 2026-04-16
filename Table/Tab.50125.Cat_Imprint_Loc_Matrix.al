table 50125 "Category Imprint Loc Matrix"
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
        //     TableRelation = "Item Category".Code where("Parent Category" = field("Item sub Category"));
        //     //  TableRelation = "Item Category".Code where("Parent Category" = field("Item Category"));

        // }
        field(1; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item."No.";
            Editable = false;
            Caption = 'Item No.';
        }
        field(2; "Imprint Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Imprint Location Master".code;

        }
        field(3; "Imprint Location Description"; Code[100])
        {
            DataClassification = ToBeClassified;

        }
        field(4; Default; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Reverse Side"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 21052024 - Added for Web Integration from D3 to web >>>
        field(6; "Imprint Size"; Text[100])
        {
            Caption = 'Imprint Size';
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 21052024 - Added for Web Integration from D3 to web >>>
    }

    keys
    {
        key(pk; "Item No.", "Imprint Location")
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