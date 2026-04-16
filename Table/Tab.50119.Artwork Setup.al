table 50119 "Artwork Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Artwork Setup';

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key';
        }
        field(2; "Enable Rush Proofing"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Rush Proofing';
        }
        field(3; "First QC"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'First QC';
        }
        field(4; "Art IDs"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
            Caption = 'Art IDs';
        }
        field(5; "Folder Creation API"; Text[1024])
        {
            DataClassification = CustomerContent;
            Caption = 'Folder Creation API';
        }
        field(6; "Folder Creation Web. Guid"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Folder Creation Web. Guid';
        }
        field(7; "Folder Creation Access Key"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Folder Creation Access Key';
        }

        field(8; "File Upload API"; Text[1024])
        {
            DataClassification = CustomerContent;
            Caption = 'File Upload API';
        }
        field(9; "File Upload Web. Guid"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'File Upload Web. Guid';
        }
        field(10; "File Upload Access Key"; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'File Upload Access Key';
        }
        field(11; "Order FTP Path"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Order FTP Path';
        }
        field(12; "Proof Approval URL"; Text[1048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Approval URL';
        }
        field(13; "Art In Progress"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Art In Progress';
        }
        field(14; "Awaiting QA Approval"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Awaiting QC Approval';
        }
        field(15; "Awaiting Cust. Proof Approval"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Awaiting Cust. Proof Approval';
        }
        field(16; "Art in Revision"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Art in Revision';
        }
        field(17; "Proof Rejected"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Rejected';
        }
        field(18; "Proof Approved"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Approved';
        }
        field(19; "Enable Sales Order QC"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Sales Order QC';
        }
        field(20; "Enable Artwork QA"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Artwork QC';
        }
        field(21; "Enable After Approved QA"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'After Approved QC';
        }
        field(22; "New Proof Upload"; Code[50])
        {
            Caption = 'If new proof is uploaded';
            DataClassification = CustomerContent;
        }
        field(23; "Proof Reupload Aft Rej"; Code[50])
        {
            Caption = 'If Proof is reuploaded after rejection';
            DataClassification = CustomerContent;
        }
        field(24; "Art not upload"; Code[50])
        {
            Caption = 'Art is not uploaded ';
            DataClassification = CustomerContent;
        }
        field(25; "Art not acceptable"; Code[50])
        {
            Caption = 'Art not acceptable';
            DataClassification = CustomerContent;
        }
        field(26; "Sent back Art Prod"; Code[50])
        {
            Caption = 'Sent back to art from production';
            DataClassification = CustomerContent;
        }
        field(27; "art is upreload"; Code[50])
        {
            Caption = 'If art is uploaded / reuploaded';
            DataClassification = CustomerContent;
        }
        field(28; "Proof Approve Cust-Online"; Code[50])
        {
            Caption = 'If Proof is approved by Customer-online';
            DataClassification = CustomerContent;
        }
        field(29; "Proof Internnal approved"; Code[50])
        {
            Caption = 'If Proof is internally approved';
            DataClassification = CustomerContent;
        }
        field(30; "Proof Rej Cust"; Code[50])
        {
            Caption = 'If Proof is rejected by the customer';
            DataClassification = CustomerContent;
        }
        field(31; "Proof Internal Rej"; Code[50])
        {
            Caption = 'If Proof is internally rejected';
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

}