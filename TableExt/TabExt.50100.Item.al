tableextension 50100 ItemExt extends Item
{

    fields
    {
        field(50001; "Item Color"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Show On PS"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Imprint Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Imprint Location';

        }
        field(50004; "Location code"; code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Prod. Location';
            TableRelation = Location;
        }
        field(50005; Material; Text[250])
        {
            DataClassification = ToBeClassified;

        }

        field(50006; Size; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(50007; "Item Sub Category Code"; Code[20])
        {
            Caption = 'Item Sub Category Code';
            TableRelation = "Item Category".Code;

        }

    }


    var
        myInt: Integer;
}