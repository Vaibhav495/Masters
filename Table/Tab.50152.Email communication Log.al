table 50152 "Email Cumminication Log"
{
    Caption = 'Email communication Log';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }


        field(2; "Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Customer Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "External Doc No"; Code[50])
        {
            DataClassification = ToBeClassified;

        }

        field(6; "Item No."; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(7; "Line No."; Integer)

        {
            DataClassification = CustomerContent;
        }
        field(8; "Product Code"; code[10])
        {
            DataClassification = CustomerContent;
        }

        field(9; "Email Subject"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Email To"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Email CC"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Email BCC"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Is Auto Mail"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Email Sent Date"; date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Email Sent Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Email From"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Mail Sent from User ID"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Document Type"; Enum "Sales Document Type")
        {
            DataClassification = CustomerContent;
        }
        field(19; "Email Type"; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
