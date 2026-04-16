table 50141 "Order Status"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Status Code"; code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; Status; text[100])
        {
            DataClassification = CustomerContent;
        }
        // field(3; Level; Enum OrderLevel)
        // {
        //     DataClassification = CustomerContent;
        // }
        field(4; "Order Type"; Enum "Sales Document Type")
        {
            DataClassification = CustomerContent;
        }
        field(5; "Bucket"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(6; "Sales Header Status"; Boolean)
        {
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(7; "Sales Line Status"; Boolean)
        {
            DataClassification = CustomerContent;
            InitValue = true;
        }
    }
    keys
    {
        key(PK; "Status Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Status Code", Status)
        {
        }
    }

}
