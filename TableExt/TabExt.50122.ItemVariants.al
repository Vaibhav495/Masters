tableextension 50122 ItemVariant extends "Item Variant"
{
    fields
    {
        field(50001; "Color Limitations"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Inventory warning"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 08082023 START - PROMO Inventory API from vendors
        field(50003; "Inventory Product Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Promo standards Inventory"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(50005; "Color Name"; Text[100])//Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; IsActive; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; IsDefault; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 08082023 END - PROMO Inventory API from vendors
        field(50008; "MW Inventory"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Item No." = field("Item No."), "Variant Code" = field(Code), "Location Code" = filter('IID')));
        }
        field(50009; "Sample Inventory"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Item No." = field("Item No."), "Variant Code" = field(Code), "Location Code" = filter('SAMPLE')));
        }
        field(50010; "Inventory"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Item No." = field("Item No."), "Variant Code" = field(Code)));
        }

        field(50011; "Whse. IID Inventory"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Warehouse Entry"."Qty. (Base)" where("Item No." = field("Item No."),
                                                                     "Variant Code" = field(Code), "Location Code" = filter('IID')));

        }
        field(50012; "Whse. IID Picked Quantity"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Warehouse Activity Line"."Qty. Outstanding (Base)" where("Location Code" = filter('IID'),
                                                                                         "Item No." = field("Item No."),
                                                                                         "Variant Code" = field(code)));
        }

        field(50013; Sequence; Integer)
        {

        }

        field(50014; "Show Inventory on Web"; Boolean)
        {

        }
        field(50015; "RTIC Inventory"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(50016; "RTIC Inventory Status"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "RTIC Inv Product Code"; Code[20])
        {
            Caption = 'RTIC Inventory Product Code';
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(SK2; Sequence)
        {

        }
    }
    fieldgroups
    {

        addlast(Dropdown; "Promo standards Inventory")
        { }

    }

    var
        myInt: Integer;
}