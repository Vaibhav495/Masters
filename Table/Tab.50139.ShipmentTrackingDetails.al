table 50139 "Shipment Tracking Details"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = True;
            DataClassification = CustomerContent;
        }
        field(2; "Sales Orders No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Order Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(4; "Shipment No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(5; "Tracking No."; Code[20])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Shipping Agent Code" = 'UPS' then begin
                    if StrLen("Tracking No.") <> 18 then Error('UPS Tracking No. %1 should have exact 18 digits', "Tracking No.");
                end;
            end;
        }
        field(6; "BOL Id"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(7; "Shipping Agent Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(8; "Shipping Agent Service Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(9; "Ship-to Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(10; "Shipping Location"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(11; "Customer No."; code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(12; "Shipping Agent"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Shipping Agent".Code;
        }
        field(13; "Shipping Agent Service"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Shipping Agent Services".code where("Shipping Agent Code" = field("Shipping Agent"));
        }
        field(14; "Post Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Zip Code';
        }
        field(15; "Customer PO"; Code[35])
        {
            DataClassification = CustomerContent;
        }
        field(17; Quantity; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(18; "Total Quantity"; Decimal)
        {
            CalcFormula = sum("Shipment Tracking Details".Quantity where("Sales Orders No." = field("Sales Orders No."), "Order Line No." = field("Order Line No.")));
            FieldClass = FlowField;
        }
        field(19; "Ship-to Code1"; Code[20])
        {
            Caption = 'Ship-To Code';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Ship-to Code1" <> '' then Validate("Ship-to Code", "Ship-to Code1");
            end;
        }
        field(20; "Tracking File Upload1"; Text[1024])
        {
            DataClassification = CustomerContent;
        }
        field(21; "Tracking File Stream1"; blob)
        {
            DataClassification = CustomerContent;
        }

        field(22; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(23; "Custommer No."; Code[20])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.Get(Rec."Customer No.") then Rec."Custommer Name" := Customer.Name;
            end;
        }
        field(24; "Custommer Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(25; "Shipment Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(26; "Void Shipment"; Boolean)
        {
            Caption = 'Void Shipment';
            DataClassification = CustomerContent;
        }
        // PW NG 1.0 08072024 - Tracking shipping >>>
        field(50076; "Tracking nos."; Text[2048])
        {
            Caption = 'Tracking Nos.';
            DataClassification = CustomerContent;
        }
        // PW NG 1.0 08072024 - Tracking shipping <<<
        field(50077; "Sent to WebEx"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(sk; "ship-to code1")
        {
        }
    }
}
