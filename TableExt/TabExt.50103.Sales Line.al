tableextension 50103 TabExtSalessLine extends "Sales Line"
{
    fields
    {
        //>>>>>Sales
        field(50000; "Sample Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50001; "Blank Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50002; "Rush Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50003; "Assorted Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50004; "Split Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50005; "Low Stock"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50006; "Order on Hold"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        //-------------------
        field(50007; LTM; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50008; "Repeat Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50009; "Customer Approved"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Approved';
        }
        field(50010; "Auto Calculated Charge"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Group Item No."; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "Shipping Charges"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(50016; "Charge Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "Free Item"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "Group Ref. No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "Is Pre-Production Sample Line"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Ref. Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Ref. Item No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Ship to code"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50023; "Shipment Sequence"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        //>>>>>For CSR Profile
        field(50024; "Cancelled Order"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "Sample No Proof Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50026; "Sample on Hold Orders"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50027; "Sample Order Type"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50028; "Sample Pre Flight"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        //<<<<<Sales

    }

    var
        myInt: Integer;
}