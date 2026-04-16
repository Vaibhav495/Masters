tableextension 50106 SalesCueExt extends "Sales Cue"
{

    fields
    {
        //>>>>>Normal
        field(50100; "Date Filter1"; date)
        {
            Editable = false;
            FieldClass = FlowFilter;
            Caption = 'Date Filter1';
        }

        field(50101; "Paper Proof Required"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Artwork" WHERE(Status = FILTER("Rework Art" | "Customer Rejected Paper Proof" | "Paper Proof Recreation" | "Art Approved" | "New Proof"), "Proof Required" = filter(true), "Art Options" = FILTER(Received), "Artwork Uploaded" = filter(True), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Rush Order" = filter(false), "Sent To Art" = filter(true)));
            Caption = 'Paper Proof Required';
        }
        field(50102; "Art not Acceptable"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Artwork" WHERE("Art Not Acceptable" = filter(true), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false)));
            Caption = 'Art not Acceptable';
        }
        field(50103; "Paper Proof QA"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Artwork" WHERE("Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false)));
            Caption = 'Paper Proof QA';
        }
        field(50104; "Awaiting Proof Approval"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Artwork" WHERE("Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false)));
            Caption = 'Awaiting Proof Approval';
        }
        field(50105; "Approved Proof"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Artwork" WHERE("Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(true), "Order On Hold" = filter(false)));
            Caption = 'Approved Proof';
        }
        field(50106; "No Proof Required"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Artwork" WHERE("Proof Required" = filter(False), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false)));
            Caption = 'No Proof Required';
        }
        field(50107; "No Prepay. Term Filter"; Code[20])
        {
            Editable = false;
            FieldClass = FlowFilter;
            Caption = 'No Prepay. Term Filter';
        }
        field(50108; "Rush-Paper Proof Required"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Artwork" WHERE(Status = FILTER("Rework Art" | "Customer Rejected Paper Proof" | "Paper Proof Recreation" | "Art Approved" | "New Proof"), "Proof Required" = filter(true), "Art Options" = FILTER(Received), "Artwork Uploaded" = filter(True), "Art Not Acceptable" = filter(false), "Sent To Art" = filter(true), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Rush Order" = filter(true)));
            Caption = 'Rush-Paper Proof Required';
        }

        field(50109; "Rush-No Proof Required"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Artwork" WHERE("Proof Required" = filter(False), "Rush Order" = filter(True), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false)));
            Caption = 'Rush-No Proof Required';
        }
        field(50110; "QC-1"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Sent To QC 1" = filter(True), "Cancelled Order" = filter(false), "Pre flight" = filter(false)));
            Caption = 'QC-1';
        }
        field(50111; "QC-2"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Sent To QC 2" = filter(True), "Cancelled Order" = filter(false), "Pre flight" = filter(false)));
            Caption = 'QC-2';
        }
        field(50112; "Art yet to recieve"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count(Artwork where("Art Options" = filter("Yet to Receive")));
            Caption = 'Art yet to recieve';
        }
        field(50113; "Awaiting Cust Proof Approval"; Integer)
        {
            Editable = FALSE;
            FieldClass = FlowField;
            CalcFormula = Count(Artwork WHERE(Status = FILTER("Awaiting Customer Proof")));
            Caption = 'Awaiting Cust Proof Approval';
        }
        //<<<<<Normal

        //>>>>>1st Sales Order QC
        field(50114; "Paper Proof Required 1stQC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Paper Proof Required';
            CalcFormula = count("Artwork" WHERE(Status = FILTER("Rework Art" | "Customer Rejected Paper Proof" | "Paper Proof Recreation" | "Art Approved" | "New Proof"), "Proof Required" = filter(true), "Art Options" = FILTER(Received), "Artwork Uploaded" = filter(True), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Rush Order" = filter(false), "Disable First QC" = filter(true)));
        }
        field(50115; "Art not Accep 1QC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Art not Acceptable';
            CalcFormula = count("Artwork" WHERE("Art Not Acceptable" = filter(true), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Disable First QC" = filter(true)));
        }
        field(50116; "Paper Proof QA 1QC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Paper Proof QA';
            CalcFormula = count("Artwork" WHERE("Art Not Acceptable" = filter(false), "Disable First QC" = filter(true), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false)));
        }
        field(50117; "Awaiting Proof Approval 1QC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Awaiting Proof Approval';
            CalcFormula = count("Artwork" WHERE("Proof Required" = filter(true), "Disable First QC" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false)));
        }
        field(50118; "Approved Proof 1QC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Approved Proof';
            CalcFormula = count("Artwork" WHERE("Proof Required" = filter(true), "Disable First QC" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(true)));
        }
        field(50119; "No Proof Required 1QC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'No Proof Required';
            CalcFormula = count("Artwork" WHERE("Proof Required" = filter(False), "Disable First QC" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false)));
        }

        field(50120; "Rush-Paper Proof Required 1QC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Rush-Paper proof Required';
            CalcFormula = count("Artwork" WHERE(Status = FILTER("Rework Art" | "Customer Rejected Paper Proof" | "Paper Proof Recreation" | "Art Approved" | "New Proof"), "Proof Required" = filter(true), "Disable First QC" = filter(true), "Art Options" = FILTER(Received), "Artwork Uploaded" = filter(True), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Rush Order" = filter(true), "Sent To Art" = filter(true)));
        }

        field(50121; "Rush-No Proof Required 1QC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Rush-No Proof Required';
            CalcFormula = count("Artwork" WHERE("Proof Required" = filter(False), "Disable First QC" = filter(true), "Rush Order" = filter(True), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false)));
        }
        field(50122; "Art yet to recieve 1QC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Art Yet to recieve';
            CalcFormula = count(Artwork where("Art Options" = filter("Yet to Receive"), "Disable First QC" = filter(true)));
        }
        field(50123; "Awaiting Cust Proof App 1QC"; Integer)
        {
            Editable = FALSE;
            FieldClass = FlowField;
            Caption = 'Awaiting cust Proof Approval';
            CalcFormula = Count(Artwork WHERE(Status = FILTER("Awaiting Customer Proof"), "Disable First QC" = filter(true)));
        }
        ///>>>>> For CSR Profile
        field(50124; "In Production"; Integer)
        {
            CalcFormula = count("Artwork" where("Document Type" = Filter(Order)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50125; "Ready For Production"; Integer)
        {
            CalcFormula = count("Artwork" where("Document Type" = Filter(Order)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50126; "Sample Order Ready Production"; Integer)
        {
            CalcFormula = count("Sales Line");// where("Cancelled Order" = filter(false), "Sample No Proof Required" = filter(true), "Sample On Hold Orders" = filter(false)));
            Caption = 'Sample Order Ready For Production';
            FieldClass = FlowField;
        }
        field(50127; "Blank Orders In Production"; Integer)
        {
            CalcFormula = count("Sales Line");// where("Cancelled Order" = filter(false), "Sample No Proof Required" = filter(false), "Sample On Hold Orders" = filter(false), "Completely Shipped" = filter(false)));
            Caption = 'Blank Orders In Production';
            FieldClass = FlowField;
        }
        field(50128; "Open Sales Quotes"; Integer)
        {
            CalcFormula = count("Sales Header" where("Document Type" = const(Quote)));
            Caption = 'Open Sales Quotes';
            FieldClass = FlowField;
        }
        field(50129; "Rush Order"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Rush Order" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50130; "Sample Orders"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50131; "Cancelled Sample Orders"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "sample order" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50132; "Credit on Hold Order"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Payment Terms Code" = Field("No Prepay. Term Filter"), "Credit on Hold" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50133; "Prepayment Orders"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Payment Terms Code" = const('PREPAY')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50134; "Missing Info Orders"; Integer)
        {
            CalcFormula = count("Sales Header");
            Editable = false;
            FieldClass = FlowField;
        }
        field(50135; "Orders to be Invoiced"; integer)
        {
            CalcFormula = count("Sales Header" where("Document Type" = filter(Order), "Completely Shipped" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50136; "Pre-flight Orders"; Integer)
        {
            CalcFormula = count("Sales Header");
            Editable = false;
            FieldClass = FlowField;
        }
        field(50137; "New Sale Order"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Document Date" = field("Date Filter1")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50138; "Open SO"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50139; "Cancelled SO"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50140; "Hold Sales Order"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order)));
            Editable = false;
            FieldClass = FlowField;
        }

        //<<<<<1st Sales Order QC
    }
}