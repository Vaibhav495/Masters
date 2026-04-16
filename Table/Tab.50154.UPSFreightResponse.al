table 50154 "UPS Freight Response"
{
    Caption = 'UPS Freight Response';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = CustomerContent;

        }
        field(2; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(3; "Document Type "; Enum "Sales Document Type")
        {
            Caption = 'Document Type ';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(4; "Line No"; Integer)
        {
            Caption = 'Line No';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(5; Charges; Decimal)
        {
            Caption = 'Charges';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(6; "Service Code"; Code[10])
        {
            Caption = 'Service Code';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(7; "Service Description"; Text[100])
        {
            Caption = 'Service Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Shipping Agent Services".Description where("UPS Shipping Agent Code" = field("Service Code")));
            Editable = false;
        }
        field(8; "Select"; Boolean)
        {
            Caption = 'Select';
            DataClassification = CustomerContent;
        }
        field(9; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(11; "Item No. Ref"; Code[1048])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(12; "Delivery Date"; Date)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(13; "In Transit Time"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    procedure SelectedRecordUPSFreightCharge(entry: Integer; OrderNo: Code[20]; LineNo: Integer)
    var
        UPSFreightResponse: Record "UPS Freight Response";
    begin
        UPSFreightResponse.Reset();
        UPSFreightResponse.SetFilter("Entry No.", '<>%1', entry);
        UPSFreightResponse.SetRange("Order No.", OrderNo);
        UPSFreightResponse.SetRange("Line No", LineNo);
        UPSFreightResponse.SetRange(Select, true);
        if not UPSFreightResponse.IsEmpty then
            UPSFreightResponse.ModifyAll(Select, false);
    end;
}
