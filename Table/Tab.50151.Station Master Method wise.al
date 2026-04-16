table 50151 "Station Master Mapping"
{
    LookupPageId = "Station Master Mapping List";
    DrillDownPageId = "Station Master Mapping List";

    Caption = 'Station Master Mapping';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Station Master"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Station Master"."No.";
            trigger OnValidate()
            var
                StationMaster: Record "Station Master";
            BEGIN
                IF StationMaster.Get(Rec."Station Master") THEN
                    Rec."Station Master Name" := StationMaster.Name;
            END;
        }
        field(2; "Station Master Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Imprint Method"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Imprint Method".Code;
            trigger OnValidate()
            var
                ImprintMethod: Record "Imprint Method";
            BEGIN
                ImprintMethod.Reset();
                ImprintMethod.SetRange(ImprintMethod.Code, Rec."Imprint Method");
                IF ImprintMethod.FindFirst() THEN
                    Rec."Imprint Method Name" := ImprintMethod.Name;
            END;
        }
        field(4; "Imprint Method Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Station Master", "Imprint Method")
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