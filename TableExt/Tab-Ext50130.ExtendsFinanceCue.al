//PW MR 1.0 14122023 -  Added que for customer/contacts approval bucket
tableextension 50130 ExtendsFinanceCue extends "Finance Cue"
{
    fields
    {
        field(50100; "Waiting For Prepay Invoices"; Integer)
        {
            CalcFormula = count("Sales Header" where("SO Confirmation Send" = filter(true), "cancelled Order" = filter(false), "Is Revised prepayment" = filter(false), "Is Item available" = filter(true), "Payment Bucket Filter" = filter(true), "Payment Status" = filter(<> 'Fully Paid'), "Prepayment Post" = filter(false)));
            Caption = 'Pending Prepayment Invoices';
            FieldClass = FlowField;
        }
        field(50101; "Revised prepayment"; Integer)
        {
            CalcFormula = count("Sales Header" where("SO Confirmation Send" = filter(true), "cancelled Order" = filter(false), "Is Revised prepayment" = filter(true), "Is Item available" = filter(true)));
            Caption = 'Revised prepayment';
            FieldClass = FlowField;
        }
        //>>PW MR 1.0 14122023 Start
        field(50102; "Customer Approval"; Integer)
        {
            CalcFormula = count(Customer where("New Entity" = filter(true)));
            Caption = 'Company Approval';
            FieldClass = FlowField;
        }
        field(50103; "Conatct Approval"; Integer)
        {
            CalcFormula = count(Contact where("New Entity" = filter(true)));
            Caption = 'Contact Approval';
            FieldClass = FlowField;
        }
        //<<PW MR 1.0 14122023 End
        field(50104; "Validate PO"; Integer)
        {
            CalcFormula = count("Purchase Header" WHERE("Document Type" = CONST(Order), "Validate PO" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50105; "Proof Approval"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof Rejected USPP" = filter(false), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "cancelled Order" = filter(false), "Payment Entry Posted" = filter(false), "Completely Shipped" = filter(false), "Payment Bucket Filter" = filter(true)));//OrderwiseChangeVY24082023                                                                                                                                                                                                                                                                                                // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
            Caption = 'Proof Approval';
        }
        field(50106; "Credit on Hold Order"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Credit on Hold" = filter(true), "cancelled Order" = filter(false), "Proof Approve Order" = filter(true), "Payment Bucket Filter" = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        // PW NG 1.0 23042024 - Added for Account Buckets >>>
        field(50107; "AR_AllOpenInvoices"; Integer)
        {
            //  CalcFormula = count("Sales Invoice Header" where(Closed = filter(false)));
            CalcFormula = count("Sales Header" where("cancelled Order" = filter(false), "Document Type" = filter("Sales Document Type"::Order), "Payment Entry Posted" = filter(false), "SO Confirmation Send" = filter(true)));// "Invoice Closed" = filter(false)));
            Editable = false;
            Caption = 'All Open Invoices';
            FieldClass = FlowField;
        }
        field(50108; "AR_PUR"; Integer)
        {
            CalcFormula = count("Sales Header" where("Prepmt. Payment Terms Code" = const('PUR'), "cancelled Order" = filter(false), "Document Type" = filter("Sales Document Type"::Order), "Payment Entry Posted" = filter(false)));// "Invoice Closed" = filter(false)));
            Editable = false;
            Caption = 'PUR';
            FieldClass = FlowField;
        }
        field(50109; "AR_PUAA"; Integer)
        {
            CalcFormula = count("Sales Header" where("Prepmt. Payment Terms Code" = const('PUAA'), "cancelled Order" = filter(false), "Document Type" = filter("Sales Document Type"::Order), "Payment Entry Posted" = filter(false)));// "Invoice Closed" = filter(false)));
            Editable = false;
            Caption = 'PUAA';
            FieldClass = FlowField;
        }
        field(50110; "AR_NetTerms"; Integer)
        {
            CalcFormula = count("Sales Header" where("Payment Bucket Filter" = filter(false), "cancelled Order" = filter(false), "Document Type" = filter("Sales Document Type"::Order), "Payment Entry Posted" = filter(false), "Amount Including VAT" = filter(<> 0)));// "Invoice Closed" = filter(false)));
                                                                                                                                                                                                                                                                         // CalcFormula = count("Sales Header" where("Prepmt. Payment Terms Code" = const('Net Terms'), "cancelled Order" = filter(false), "Document Type" = filter("Sales Document Type"::Order),"Payment Entry Posted" = filter(false)));// "Invoice Closed" = filter(false)));
            Editable = false;
            Caption = 'Net Terms';
            FieldClass = FlowField;
        }
        field(50111; "AR_Credit on Hold"; Integer)
        {
            CalcFormula = count("Sales Header" where("Order on Hold" = filter(true), "cancelled Order" = filter(false), "Document Type" = filter("Sales Document Type"::Order), "Invoice Closed" = filter(false)));
            Editable = false;
            Caption = 'Payment Hold or Credit on Hold';
            FieldClass = FlowField;
        }
        field(50112; "AR_PaidInvoicesandRefunds"; Integer)
        {
            CalcFormula = count("Sales Invoice Header" where("Payment Status" = const('Fully Paid')));
            Editable = false;
            Caption = 'Paid Invoices and Refunds';
            FieldClass = FlowField;
        }
        field(50113; "AR_Disputed Orders"; Integer)
        {
            CalcFormula = count("Sales Header" where("Order on Hold" = filter(true), "cancelled Order" = filter(false), "Document Type" = filter("Sales Document Type"::Order), "Invoice Closed" = filter(false)));
            Editable = false;
            Caption = 'Disputed Orders';
            FieldClass = FlowField;
        }
        field(50114; "AR_Recurring Open Invoices"; Integer)
        {
            CalcFormula = count("Sales Header" where("Order on Hold" = filter(true), "cancelled Order" = filter(false), "Document Type" = filter("Sales Document Type"::Order), "Invoice Closed" = filter(false)));
            Editable = false;
            Caption = 'Recurring Open Invoices';
            FieldClass = FlowField;
        }
        field(50115; "AP_All Open Bills"; Integer)
        {
            CalcFormula = count("Purch. Inv. Header" where(Closed = filter(false)));
            Editable = false;
            Caption = 'All Open Bills';
            FieldClass = FlowField;
        }
        field(50116; "AP_Overseas Bills"; Integer)
        {
            CalcFormula = count("Purch. Inv. Line" where("Invoiced Closed" = filter(false), Type = filter("Purchase Line Type"::Item), Vendor_Type = const('OVERSEAS VENDOR')));
            Editable = false;
            Caption = 'Overseas Bills';
            FieldClass = FlowField;
        }
        field(50117; "AP_USA Bills"; Integer)
        {
            CalcFormula = count("Purch. Inv. Line" where("Invoiced Closed" = filter(false), Type = filter("Purchase Line Type"::Item), Vendor_Type = const('US PRODUCTION PARTNER')));
            Editable = false;
            Caption = 'USA Bills';
            FieldClass = FlowField;
        }
        field(50118; "AP_Office Misc expense"; Integer)
        {
            CalcFormula = count("Purch. Inv. Line" where("Invoiced Closed" = filter(false), Type = filter("Purchase Line Type"::"G/L Account")));
            Editable = false;
            Caption = 'Office/Misc expense';
            FieldClass = FlowField;
        }
        field(50119; "AP_Recurring  Bills"; Integer)
        {
            CalcFormula = count("Purch. Inv. Header" where(Closed = filter(false)));
            Editable = false;
            Caption = 'Recurring  Bills';
            FieldClass = FlowField;
        }
        field(50120; "AP_Paid Bills"; Integer)
        {
            CalcFormula = count("Purch. Inv. Header" where(Closed = filter(true)));
            Editable = false;
            Caption = 'Paid Bills ';
            FieldClass = FlowField;
        }
        field(50121; "AP_MW Bills"; Integer)
        {
            CalcFormula = count("Purch. Inv. Header" where(Closed = filter(false), "Location Code" = const('IID')));
            Editable = false;
            Caption = 'Office/Misc expense';
            FieldClass = FlowField;
        }
        field(50122; "AP_Pending Bills"; Integer)
        {
            CalcFormula = count("Purch. Inv. Header" where(Closed = filter(false)));
            Editable = false;
            Caption = 'Pending Bills';
            FieldClass = FlowField;
        }

        // PW NG 1.0 23042024 - Added for Account Buckets <<<
        field(50123; "Awaiting Payment Sample Orders"; Integer)
        {
            // Caption = 'Warehouse Sample Orders';
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), Invoice = filter(False), "Completely Shipped" = filter(False), "SO Confirmation Send" = filter(true), WaitingPayWareBucketFilter = filter(false), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Payment Entry Posted" = filter(false), "Sample Order" = filter(true), "Amount Including VAT" = filter(<> 0)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50124; "Blank Order AwaitPayment"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            // CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof Rejected USPP" = filter(false), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "cancelled Order" = filter(false), "Payment Entry Posted" = filter(false), "Completely Shipped" = filter(false), "Payment Bucket Filter" = filter(true), "Blank Order" = filter(true), "Sample Order" = filter(false), "SO Confirmation Send" = filter(True)));//OrderwiseChangeVY24082023                                                                                                                                                                                                                                                                                                // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof Rejected USPP" = filter(false), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "cancelled Order" = filter(false), WaitingPayWareBucketFilter = filter(false), "Completely Shipped" = filter(false), "Blank Order" = filter(true), "Sample Order" = filter(false), "SO Confirmation Send" = filter(True)));//OrderwiseChangeVY24082023                                                                                                                                                                                                                                                                                                // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
            Caption = 'Blank Order Awaiting Payment';
        }
        field(50135; "Orders to be Invoiced"; integer)
        {
            CalcFormula = count("Sales Header" where("Document Type" = filter(Order), "cancelled Order" = filter(false), Invoice = filter(False), "Completely Shipped" = filter(true), "Order On Hold" = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50136; "PO Received Not Invoiced"; Integer)
        {
            CalcFormula = count("Purchase Header" WHERE("Document Type" = CONST(Order), "Received Not Invoiced" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50137; "PREPAY"; Integer)
        {
            CalcFormula = count("Sales Header" where("Payment Bucket Filter" = filter(true), "cancelled Order" = filter(false), "Document Type" = filter("Sales Document Type"::Order), "Payment Entry Posted" = filter(false)));// "Invoice Closed" = filter(false)));
            Editable = false;
            //  Caption = 'PUAA';
            FieldClass = FlowField;
        }
        field(50138; "Credit on Hold All"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Credit on Hold" = filter(true), "cancelled Order" = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }

    }
}
