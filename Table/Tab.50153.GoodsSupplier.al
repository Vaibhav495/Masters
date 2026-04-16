// 
table 50153 "Goods Supplier"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Goods Supplier No"; Code[20])
        {
            // Caption = 'Code';
        }

        field(10; "Supplier Name"; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Goods Supplier No")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Goods Supplier No", "Supplier Name") { }
    }
}

