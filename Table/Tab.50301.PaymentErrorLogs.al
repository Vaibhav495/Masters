// 
table 50301 "Payment Error Logs"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Code';
        }
        field(2; "Document No"; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Description; Text[2048])
        {
            Caption = 'Description';
        }
        field(4; "Creation DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        // field(5; "Creation Time"; Time)
        // {
        //     DataClassification = ToBeClassified;
        // }
        field(6; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Invoice No"; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Document No", Description) { }

    }
}

