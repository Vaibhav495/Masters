table 50130 VendorPortalUsersList
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "User Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(2; "Password"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Vendor Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
            ValidateTableRelation = false;
            trigger OnValidate()
            var
                Vend: Record Vendor;
            BEGIN
                Vend.Reset();
                Vend.SetRange("No.", Rec."Vendor Code");
                IF Vend.FindFirst() THEN
                    Rec.Email := Vend."E-Mail";
            END;
        }
        field(4; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Email; Text[80])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "User Name")
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
