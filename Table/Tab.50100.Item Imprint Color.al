table 50100 "Item Imprint Color"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
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


    }

    keys
    {
        key(PK; "Item No.", "Imprint Color")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;



}