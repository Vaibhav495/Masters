tableextension 50117 PurchaseInvHeadaer extends "Purch. Inv. Header"
{
    fields
    {
        field(50001; "Vendor Invoice Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50045; "In-Hand Date"; Date)
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
        field(50062; "Third Party Shipping"; Boolean)
        {
            Caption = 'Third Party Shipping';
            DataClassification = CustomerContent;
        }
        field(50063; "Third Party Shipping Acc. No."; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Third Party Shipping Acc. No.';
        }
        field(50064; "Third Party Zip Code"; Code[20])
        {
            Caption = 'Third Party Zip Code';
            DataClassification = CustomerContent;
            // TableRelation = IF ("Ship-to Country/Region Code" = CONST('')) "Post Code"
            // ELSE
            // IF ("Ship-to Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Ship-to Country/Region Code"));

            // ValidateTableRelation = false;
        }

        // PW NG 1.0 AP - Buckets >>>
        field(50048; "Order Status"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
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
        field(50118; "Vendor_Type"; code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Type"."Vendor code";

        }
        field(50119; "WebEx SO No."; code[20])
        {
            DataClassification = ToBeClassified;
        }

        //>>PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50121; "QuickBook ID"; Code[100])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 26th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50122; "QuickBook Error"; Text[2048])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 26th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50123; "QuickBook Sync Failed"; Boolean)
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 8th Dec 2024 -- Field Added to map QuickBook ID to BC
        field(50124; "Vendor QuickBook ID"; Code[100])
        {
            //TableRelation = Location.Code;
        }
        field(50125; "Ready for QuickBook"; boolean)
        {

        }
        //<<PW MR 8th Dec 2024 -- Field Added to map QuickBook ID to BC
        field(50126; "Invoiced in QuickBook"; boolean)
        {

        }

        field(50130; "WebEx SO Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50131; "Xbrand Flag"; Boolean)
        {
            DataClassification = ToBeClassified;
        }


        field(50336; "Vendor Refund"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50337; "Vendor Refund Updated in QB"; Boolean)
        {
            DataClassification = CustomerContent;
        }

    }

    var
        myInt: Integer;
}