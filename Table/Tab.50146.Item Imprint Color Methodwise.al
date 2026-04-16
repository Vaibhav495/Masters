table 50146 "Item Imprint Color Methodwise"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Imprint Method"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Imprint Method".Code;

            Caption = 'Imprint Method';
        }

        field(2; "Imprint Color"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Imprint Color";
        }
        field(3; "PMS Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Imprint Color Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Imprint Color".Code;
            Caption = 'Imprint Color Code';
            trigger OnValidate()
            var
                ImpClr: Record "Imprint Color";
            begin
                if ImpClr.Get(Rec."Imprint Color Code") then
                    Rec."Imprint Color" := CopyStr(ImpClr.Name, 1, MaxStrLen(Rec."Imprint Color"))
                else
                    Clear("Imprint Color");
            end;
        }
        field(5; "Match the Logo"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(6; Select; Boolean)
        {
            DataClassification = CustomerContent;
        }
        // PW NG 1.0 23102023 - Item Sync >>>

        field(7; IsActive; Boolean)
        {
            Caption = 'Is Active';
            DataClassification = CustomerContent;
        }
        field(8; IsDefault; Boolean)
        {
            Caption = 'Is Default';
            DataClassification = CustomerContent;
        }

        // PW NG 1.0 23102023 - Item Sync <<< 


    }

    keys
    {
        key(PK; "Imprint Method", "Imprint Color")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;



}