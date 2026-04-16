tableextension 50114 ExtItemChargesMaster extends "Item Charge"
{
    fields
    {
        field(50001; "G/L Account"; Code[20])
        {
            DataClassification = CustomerContent;
            //TableRelation = "G/L Account"."No.";
            TableRelation = Item."No.";//Manish 
        }
        field(50002; "Run Charge"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50003; "Setup Charge"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50004; "PMS Charge"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50005; "Rush Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50006; "Super Rush Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50007; Sequence; Integer)
        {
            DataClassification = CustomerContent;
        }
    }
}

