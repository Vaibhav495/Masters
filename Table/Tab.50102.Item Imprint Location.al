table 50102 "Item Imprint Location"
{
    DataClassification = CustomerContent;
    Caption = 'Item Imprint Location';

    fields
    {
        field(1; "Item No."; code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = Item."No.";
            Caption = 'Item No.';
        }
        field(2; "Imprint Location Code"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Imprint Location Code';
        }

        field(3; "Imprint Location Size"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Imprint Location Size';
        }
        field(4; "Imprint Method"; Code[50])
        {
            DataClassification = CustomerContent;
            //  TableRelation = "Imprint Method".Code;vy
            Caption = 'Imprint Method';
        }
        field(5; "Max Imprint Color"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Max Imprint Color';
        }
    }

    keys
    {
        key(PK; "Item No.", "Imprint Location Code", "Imprint Method")
        {
            Clustered = true;
        }
    }

}