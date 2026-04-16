tableextension 50102 TabExtSalesHeader extends "Sales Header"
{
    fields
    {
        //>>>>>Customer
        field(50000; "Shipping Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Shipping Email';
        }
        field(50001; "Billing Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Billing Email';
        }
        field(50002; "Ack Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Ack Email';
        }
        field(50003; "Credit on Hold"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Credit on Hold';
        }
        field(50004; "Third Party Shipping"; Boolean)
        {
            Caption = 'Third Party Shipping';
            DataClassification = CustomerContent;
        }
        field(50005; "Third Party Shipping Acc. No."; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Third Party Shipping Acc. No.';
        }
        field(50006; "Credit on Hold DateTime"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(50007; "Is Residential"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50008; "Middle Name"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        //<<<<<Customer

        //>>>>>Sales
        field(50009; "Sample Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50010; "Blank Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        // field(50011; "Rush Order"; Boolean)
        // {
        //     DataClassification = CustomerContent;
        // }
        field(50012; "Assorted Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50013; "Split Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50014; "Low Stock"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50015; "Order on Hold"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50016; "Order on Hold Comment"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50017; LTM; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50018; "Repeat Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50019; "Old Customer PO"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(50020; "Old PO Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50021; "Art Name"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(50022; "Warehouse Notes"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50023; "Rush Order"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Rush Order';
        }
        field(50024; "Art Email ID"; Text[1050])
        {
            Caption = 'Art Email ID';
            DataClassification = CustomerContent;
        }
        field(50025; "Proof All Orders"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof All Orders';
        }
        field(50026; "Mandatory Approval"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Proof Approval Required';
        }
        field(50027; "Email Proof"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Email Proof';
        }

        field(50028; "Proof Internally Approved"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Internally Approved';
        }
        field(50029; "Proof Internally Rejected"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Internally Rejected';
        }
        field(50030; "No Proof Required"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'No Proof Required';
        }
        field(50031; "Sent To Art"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Sent To Art';
        }
        field(50032; "Own Shipping"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50033; "Insured Shipment"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50034; "Less than min Qty"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50036; "Rush Options"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Same Day","1 Work Day","2 Work Day","3 Work Day","4 Work Day";

            //<<<<<Sales
        }
        field(50037; "Ship-To-Phone No."; Integer)
        {
            DataClassification = ToBeClassified;
        }

    }
}