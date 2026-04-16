tableextension 50123 LocationMaster extends location
{
    fields
    {
        //To show onlookup filter apply on the basis this field on color
        field(50001; "Color Limitations"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Reverse Additional Charge"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Vendor No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = vendor."No."; //; where("Item No." = field("No."));
        }
        field(50004; "MW Location"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}