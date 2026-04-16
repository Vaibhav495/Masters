tableextension 50118 PurchaseReceiptHeader extends "Purch. Rcpt. Header"
{
    fields
    {
        field(50001; "Vendor Invoice Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50046; "Shipment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50047; "Tracking No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        // PW NG 1.0 AP - Buckets >>>
        field(50065; "BILL TYPE"; Text[100])
        {
            DataClassification = CustomerContent;

        }
        field(50066; "PHONE NO."; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50067; "BILL PAID DATE"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50068; "DAYS OVERDUE"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50069; "Contact Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50070; "Show vendor portal"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50114; "IID Shipping"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50117; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                if "E-Mail" = '' then
                    exit;
                MailManagement.CheckValidEmailAddresses("E-Mail");
            end;
        }
        // PW NG 1.0 AP - Buckets <<<
    }

    var
        myInt: Integer;
}