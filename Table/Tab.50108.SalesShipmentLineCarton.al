table 50108 "Sales Shipment Line Carton"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order';
            OptionMembers = Quote,Order,Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Carton Code"; code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Item Carton"."Carton Code" WHERE("Item No." = field("Item No."));

        }
        field(6; "Carton Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Item Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                "Item Value" := "Item Quantity" * "Unit Price";
            end;
        }
        field(8; "Total Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Weight Unit of Measurement"; code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(10; Height; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Width; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; Length; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Dimenssion Unit Of Measure"; code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(14; Volume; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Volume Unit of Measure"; code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".code;
        }
        field(16; "Sales Order No."; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Sales Line No."; integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "LPN No."; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Address Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Residential, Commericial';
            OptionMembers = ,Residential,Commericial;
        }
        field(20; "Carton Charge"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Shipment Sequence"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(22; Size; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                "Item Value" := "Item Quantity" * "Unit Price";
            end;
        }
        field(24; "Item Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50100; "Shipment No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Shipper Address 1"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Shipper Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Shipper Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Shipper Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Recipient Address 1"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50106; "Recipient Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "Recipient Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "Recipient Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50109; "Shipper Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "Recipient Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document Type", "Document No.", "Line No.", "Item No.", "Carton Code", "Carton Quantity", "Item Quantity", "Shipment sequence")
        {
            Clustered = true;
        }
    }
}



