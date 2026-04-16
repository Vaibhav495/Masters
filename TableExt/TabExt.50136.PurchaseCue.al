tableextension 50136 PurchaseQueue extends "Purchase Cue"
{
    fields
    {
        field(50138; "X'Brand Vendor Orders"; Integer)
        {
            CalcFormula = count("Purchase Header" WHERE("Document Type" = filter(Order | Invoice), "Xbrand Flag" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50139; "Waiting Purchase Orders"; Integer)
        {
            CalcFormula = count("Purchase Header" WHERE("Document Type" = CONST(Order), "Xbrand Flag" = filter(true), "Mail Sent" = filter(false), "Vendor Invoice No." = filter(''), "Tracking No." = filter('')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50140; "Waiting Purchase Invoices"; Integer)
        {
            CalcFormula = count("Purchase Header" WHERE("Document Type" = CONST(Invoice), "Xbrand Flag" = filter(true), "Mail Sent" = filter(false), "Vendor Invoice No." = filter(''), "Tracking No." = filter('')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50141; "Processed PO/PI"; Integer)
        {
            CalcFormula = count("Purchase Header" WHERE("Document Type" = filter(Order | Invoice), "Xbrand Flag" = filter(true), "Mail Sent" = filter(true), "Vendor Invoice No." = filter(''), "Tracking No." = filter('')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50142; "Waiting for Vendor Tracking"; Integer)
        {
            CalcFormula = count("Purchase Header" WHERE("Document Type" = filter(Order | Invoice), "Xbrand Flag" = filter(true), "Mail Sent" = filter(true), "Vendor Invoice No." = filter(<> ''), "Tracking No." = filter('')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50143; "Posted PO/PI"; Integer)
        {
            CalcFormula = count("Purch. Inv. Header" WHERE("Xbrand Flag" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}