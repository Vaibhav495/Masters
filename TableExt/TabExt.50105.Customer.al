//tableextension 50103 MyExtensionTab50121 extends Customer
tableextension 50105 CustomerExt extends Customer
{
    fields
    {
        field(50100; "Proof All Orders"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Internal Proof Required';
        }
        field(50101; "Mandatory Approval"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Proof Approval Required';
        }
        field(50102; "Email Proof"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Email Proof';
        }
        field(50103; "Art Email ID"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Art Email ID';
        }
        field(50104; "Proof Info Mail"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Info Mail';
        }
        field(50105; "Parent Customer"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(50106; "Parent Customer Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50107; "Shipping Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Shipping Email';
        }
        field(50108; "Billing Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Billing Email';
        }

        field(50109; "Ack Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Ack Email';
        }
        field(50110; "Credit on Hold"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Credit on Hold';
        }
        field(50111; "Third Party Shipping"; Boolean)
        {
            Caption = 'Third Party Shipping';
            DataClassification = CustomerContent;
        }
        field(50112; "Third Party Shipping Acc. No."; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Third Party Shipping Acc. No.';
        }
        field(50113; "Is Residential"; Boolean)
        {
            DataClassification = CustomerContent;
        }

        field(50114; "Customer Type"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer Type".Code;
        }
        field(50115; "Association Type"; Enum "Association Type")
        {
            DataClassification = CustomerContent;
        }
        field(50116; Association; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(50117; "Middle Name"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50118; "Is Sub Customer"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50119; "W2 Attached"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'No,Yes';
            OptionMembers = No,Yes;

        }
        field(50120; "Contact E-Mail"; Text[80])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }

    }

}