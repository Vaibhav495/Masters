tableextension 50106 TabExtSalesCue extends "Sales Cue"
{

    fields
    {
        //>>>>>Normal Ordder
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
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting CustApp over" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof Rejected USPP" = filter(false), Vendor_USPP = filter(true), "Completely Shipped" = filter(False), "Await Proof filter" = filter(true)));//OrderwiseChangeVY24082023
            // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), Status = FILTER("Rework Art" | "Customer Rejected Paper Proof" | "Paper Proof Recreation" | "Art Approved" | "New Proof" | "Awaiting Proof"), "Proof Required" = filter(true), "Art Options" = FILTER(Received), "Artwork Uploaded" = filter(True), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Rush Order" = filter(false), "Super Rush Order" = filter(false), "Sent To Art" = filter(true), "Order On Hold" = filter(false), "Proof Rejected" = filter(false)));
            Caption = 'Awaiting Proof';
        }
        field(50102; "Art not Acceptable"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting Cust Approval" = filter(false), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof Approve Order" = filter(false), Vendor_USPP = filter(true)));//OrderwiseChangeVY24082023
                                                                                                                                                                                                                                                                                                           //  CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Art Not Acceptable" = filter(true), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), Vendor_Type = filter('OVERSEAS VENDOR')));
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
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting Cust Approval" = filter(true), "Proof Rejected USPP" = filter(false), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Vendor_USPP = filter(true)));//OrderwiseChangeVY24082023                                                                                                                                                                                                                                                                                                // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
            Caption = 'Awaiting Approval';
        }
        field(50105; "Approved Proof"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(true), "Order On Hold" = filter(false), "In Production" = filter(false)));
            Caption = 'Approved Proof';
        }
        field(50106; "No Proof Required"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Mandatory Approval" = filter(false), "Proof awaiting Cust Approval" = filter(true), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Vendor_USPP = filter(true)));//OrderwiseChangeVY24082023
                                                                                                                                                                                                                                                                                                         //  CalcFormula = count("Artwork" WHERE("Proof Required" = filter(False), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
            Caption = 'No Proof Required';
        }
        field(50107; "No Prepay. Term Filter"; Code[20])
        {
            Editable = false;
            FieldClass = FlowFilter;
            Caption = 'No Prepay. Term Filter';
        }
        // field(50108; "Rush-Paper Proof Required"; Integer)
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), Status = FILTER("Rework Art" | "Customer Rejected Paper Proof" | "Paper Proof Recreation" | "Art Approved" | "New Proof" | "Awaiting Proof"), "Proof Required" = filter(true), "Art Options" = FILTER(Received), "Artwork Uploaded" = filter(True), "Art Not Acceptable" = filter(false), "Sent To Art" = filter(true), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Rush Order" = filter(true)));
        //     Caption = 'Rush-Awaiting Proof';
        // }

        // field(50109; "Rush-No Proof Required"; Integer)
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = count("Artwork" WHERE("Proof Required" = filter(False), "Rush Order" = filter(True), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false)));
        //     Caption = 'Rush-No Proof Required';
        // }
        // field(50110; "QC-1"; Integer)
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Sent To QC 1" = filter(True), "Cancelled Order" = filter(false), "Pre flight" = filter(false)));
        //     Caption = 'QC-1';
        // }
        // field(50111; "QC-2"; Integer)
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = count("Artwork" where("Document Type" = FILTER(Order), "Sent To QC 2" = filter(True), "Cancelled Order" = filter(false), "Pre flight" = filter(false)));
        //     Caption = 'QC-2';
        // }
        // field(50112; "Art yet to recieve"; Integer)
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = count(Artwork where("Document Type" = Filter(Order), "Art Options" = FILTER(Received | "Yet to Receive"), "Requested Art 1" = filter(''), "Requested Art 2" = filter(''), "Requested Art 3" = filter(''), Vendor_Type = filter('OVERSEAS VENDOR')));
        //     Caption = 'Missing Artwork';
        // }
        // field(50113; "Awaiting Cust Proof Approval"; Integer)
        // {
        //     Editable = FALSE;
        //     FieldClass = FlowField;
        //     CalcFormula = Count(Artwork WHERE("Document Type" = Filter(Order), Status = FILTER("Awaiting Customer Proof")));
        //     Caption = 'Awaiting Approval';
        // }
        //<<<<<Normal Sales Order



        //>>>>> Sales Quote
        field(50114; "Paper Proof Required 1stQC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Paper Proof Required';
            //  CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Quote), "Artwork Status" = filter('Awaiting Proof'), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof Rejected Order" = filter(false)));//OrderwiseChangeVY24082023
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Quote), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof awaiting QuoteApproval" = filter(false), "Proof Rejected Quote" = filter(false), "Proof ApproveQuote" = filter(false), "Artwork Status" = filter(<> 'Order Confirmed'), Invoice = filter(false)));//OrderwiseChangeVY24082023
                                                                                                                                                                                                                                                                                                                                                                                                // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Quote), Status = FILTER("New Proof" | "Awaiting Proof" | "Art Yet To Receive"), "Proof Required" = filter(true), "Art Options" = FILTER("Quote phase"), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Rush Order" = filter(false), "Super Rush Order" = filter(false), "Sent To Art" = filter(true), "Quote Converted To Order" = filter(false), "Proof Rejected" = filter(false)));
        }
        field(50115; "Art not Accep 1QC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Art not Acceptable';
            CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Quote), "Art Not Acceptable" = filter(true), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Disable First QC" = filter(true), "Quote Converted To Order" = filter(false)));
        }
        field(50116; "Paper Proof QA 1QC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Paper Proof QA';
            CalcFormula = count("Artwork" WHERE("Art Not Acceptable" = filter(false), "Disable First QC" = filter(true), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Quote Converted To Order" = filter(false)));
        }
        field(50117; "Awaiting Proof Approval 1QC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Awaiting Approval';
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Quote), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof awaiting QuoteApproval" = filter(true), "Proof ApproveQuote" = filter(false), "Artwork Status" = filter(<> 'Order Confirmed')));//OrderwiseChangeVY24082023                                                                                                                                                                                                                                                     // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
                                                                                                                                                                                                                                                                                                                              // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Quote), "Proof Required" = filter(true), "Disable First QC" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false), "Quote Converted To Order" = filter(false), "In Production" = filter(false), "Proof Rejected" = filter(false)));
        }
        field(50118; "Approved Proof 1QC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Approved Proof';
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Quote), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof ApproveQuote" = filter(true), "Artwork Status" = filter(<> 'Order Confirmed')));//OrderwiseChangeVY24082023                                                                                                                                                                                                                                                     // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
                                                                                                                                                                                                                                                                              // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Quote), "Proof Required" = filter(true), "Disable First QC" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(true), "Quote Converted To Order" = filter(false), "Proof Rejected" = filter(false)));
        }
        field(50119; "No Proof Required 1QC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'No Proof Required';
            CalcFormula = count("Artwork" WHERE("Proof Required" = filter(False), "Disable First QC" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Quote Converted To Order" = filter(false)));
        }

        // field(50120; "Rush-Paper Proof Required 1QC"; Integer)
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     Caption = 'Rush-Paper proof Required';
        //     CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Quote), Status = FILTER("Rework Art" | "Customer Rejected Paper Proof" | "Paper Proof Recreation" | "Art Approved" | "New Proof" | "Awaiting Proof"), "Proof Required" = filter(true), "Disable First QC" = filter(true), "Art Options" = FILTER("Quote phase"), "Artwork Uploaded" = filter(True), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Rush Order" = filter(true), "Sent To Art" = filter(true), "Quote Converted To Order" = filter(false)));
        // }

        // field(50121; "Rush-No Proof Required 1QC"; Integer)
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     Caption = 'Rush-No Proof Required';
        //     CalcFormula = count("Artwork" WHERE("Proof Required" = filter(False), "Disable First QC" = filter(true), "Rush Order" = filter(True), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false)));
        // }
        field(50122; "Art yet to recieve 1QC"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Art yet to recieve 1QC';
            CalcFormula = count(Artwork where("Document Type" = Filter(Quote), "Art Options" = filter("Quote phase" | "Yet to Receive"), "Requested Art 1" = filter(''), "Requested Art 2" = filter(''), "Requested Art 3" = filter(''), "Sent To Art" = filter(true), "Quote Converted To Order" = filter(false)));
        }
        field(50123; "Awaiting Cust Proof App 1QC"; Integer)
        {
            Editable = FALSE;
            FieldClass = FlowField;
            Caption = 'Awaiting cust Proof Approval';
            CalcFormula = Count(Artwork WHERE("Document Type" = Filter(Quote), Status = FILTER("Awaiting Customer Proof"), "Quote Converted To Order" = filter(false)));
        }
        //<<<<<1st Sales Quote QC


        ///>>>>> For CSR Profile
        field(50124; "In Production"; Integer)
        {
            CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "In Production" = filter(True), "Cancelled Order" = filter(false), "Art Not Acceptable" = filter(false), Status = filter("In Production"), "Back Order" = filter(false), Vendor_Type = filter('OVERSEAS VENDOR')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50125; "Ready For Production"; Integer)
        {
            CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Customer Approved" = filter(true), "Cancelled Order" = filter(false), "Art Not Acceptable" = filter(false), Status = filter("Customer Approved Paper Proof"), "Move to In Prodcution" = filter(true), "Back Order" = filter(false), "Credit On Hold" = filter(false), Vendor_Type = filter('OVERSEAS VENDOR')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50126; "Sample Order Ready Production"; Integer)
        {
            CalcFormula = count("Sales Line" where("Cancel Order" = filter(false), "Sample No Proof Required" = filter(true), "Sample On Hold Orders" = filter(false), "Back Order" = filter(false), Vendor_Type = filter('OVERSEAS VENDOR')));
            Caption = 'Sample Order Ready For Production';
            FieldClass = FlowField;
        }
        field(50127; "Blank Orders In Production"; Integer)
        {
            CalcFormula = count("Sales Line" where("Blank Order" = filter(true), "Blank Order InProduction" = filter(true), "Sample On Hold Orders" = filter(false), "Completely Shipped" = filter(false), "Back Order" = filter(false), "cancel Order" = filter(false), Vendor_Type = filter('OVERSEAS VENDOR')));
            Caption = 'Blank Orders In Production';
            FieldClass = FlowField;
        }
        field(50128; "Open Sales Quotes"; Integer)
        {
            CalcFormula = count("Sales Header" where("Document Type" = const(Quote), "cancelled Order" = filter(false), "Sales Order Number" = filter(= '')));
            Caption = 'Open Sales Quotes';
            FieldClass = FlowField;
        }
        field(50129; "Rush Order"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Rush Order" = filter(true), "Order On Hold" = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50130; "Sample Orders"; Integer)
        {
            Caption = 'Random Sample Orders';
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "SO Confirmation Send" = filter(true), WaitingPayWareBucketFilter = filter(True), "Completely Shipped" = filter(False), "cancelled Order" = filter(false), "Sample Type" = filter("Random Sample"), "Order On Hold" = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50131; "Cancelled Sample Orders"; Integer)
        {
            Caption = 'All Sample Orders';
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Sample Order" = filter(true), "Order On Hold" = filter(false)));
            // CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "sample order" = filter(true), "Cancelled Order" = filter(true), "Order On Hold" = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50132; "Credit on Hold Order"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Payment Terms Code" = Field("No Prepay. Term Filter"), "cancelled Order" = filter(false), "Credit on Hold" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50133; "Prepayment Orders"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Prepayment %" = filter(<> 0), "30Days filter Order Date" = field("Date Filter6")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50134; "Missing Info Orders"; Integer)
        {
            // CalcFormula = count("Sales Header");
            Caption = 'VIP Open Quotes';
            CalcFormula = count("Sales Header" where("Document Type" = filter(Quote), "cancelled Order" = filter(false), "Sales Order Number" = filter(= ''), "VIP Customer" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50135; "Orders to be Invoiced"; integer)
        {
            CalcFormula = count("Sales Header" where("Document Type" = filter(Order), "cancelled Order" = filter(false), Invoice = filter(False), "Completely Shipped" = filter(true), "Order On Hold" = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50136; "Pre-flight Orders"; Integer)
        {
            // CalcFormula = count("Sales Header");
            CalcFormula = count("Sales Header" where("Document Type" = const(Quote)));
            Caption = 'ALL Sales Quotes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50137; "New Sale Order"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Document Date" = field("Date Filter1"), "cancelled Order" = filter(false), "Order On Hold" = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50138; "Open SO"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Ship = filter(false), Invoice = filter(false), "Completely Shipped" = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50139; "Cancelled SO"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(true), "Order On Hold" = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50140; "Hold Sales Order"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50141; "Cancelled Quote"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Quote), "cancelled Order" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        // field(50142; "Super Rush-Awaiting Proof"; Integer)
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = count("Artwork" WHERE("Document Type" = CONST(Order), Status = FILTER("Rework Art" | "Customer Rejected Paper Proof" | "Paper Proof Recreation" | "Art Approved" | "New Proof" | "Awaiting Proof"), "Proof Required" = filter(true), "Art Options" = FILTER(Received), "Artwork Uploaded" = filter(True), "Art Not Acceptable" = filter(false), "Sent To Art" = filter(true), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Super Rush Order" = filter(true)));
        //     Caption = 'Super Rush-Awaiting Proof';
        // }
        field(50143; "Needs Rivision"; Integer)
        {
            Caption = 'Needs Revision';
            Editable = FALSE;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof Rejected USPP" = filter(true), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Vendor_USPP = filter(true)));//OrderwiseChangeVY24082023ss
                                                                                                                                                                                                                                                          // CalcFormula = Count("Artwork" WHERE("Document Type" = CONST(Order), Status = FILTER("Customer Rejected Paper Proof"), "Cancelled Order" = FILTER(FALSE), "Proof Rejected" = filter(true)));
        }
        // field(50144; "Super Rush-Awaiting Proof Q"; Integer)
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Quote), Status = FILTER("Rework Art" | "Customer Rejected Paper Proof" | "Paper Proof Recreation" | "Art Approved" | "New Proof" | "Awaiting Proof"), "Proof Required" = filter(true), "Art Options" = FILTER("Quote phase"), "Artwork Uploaded" = filter(True), "Art Not Acceptable" = filter(false), "Sent To Art" = filter(true), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Super Rush Order" = filter(true), "Quote Converted To Order" = filter(false)));
        //     Caption = 'Super Rush-Awaiting Proof';
        // }
        field(50145; "Needs Rivision Q"; Integer)
        {
            Caption = 'Needs Revision';
            Editable = FALSE;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Quote), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof awaiting QuoteApproval" = filter(false), "Proof Rejected Quote" = filter(true), "Proof ApproveQuote" = filter(false), "Artwork Status" = filter(<> 'Order Confirmed')));//OrderwiseChangeVY24082023                                                                                                                                                                                                                                                     // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
                                                                                                                                                                                                                                                                                                                                                                      // CalcFormula = Count("Artwork" WHERE("Document Type" = Filter(Quote), Status = FILTER("Customer Rejected Paper Proof"), "Cancelled Order" = FILTER(FALSE), "Proof Rejected" = filter(true), "Quote Converted To Order" = filter(false), "Quote Converted To Order" = filter(false)));
        }
        field(50146; "Not Sent to ART Q"; Integer)
        {
            Caption = 'Needs Revision';
            Editable = FALSE;
            FieldClass = FlowField;

            CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Quote), "Proof Required" = filter(true), "Sent To QA" = filter(false), "Order On Hold" = filter(false), "Cancelled Order" = filter(false), "Sent To Art" = filter(false)));
        }
        field(50147; "Not Sent to ART"; Integer)
        {
            Caption = 'Not Sent to Artist';
            Editable = FALSE;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = Filter(Order), "Mandatory Approval" = filter(true), "Order On Hold" = filter(false), "Cancelled Order" = filter(false), "Sent To Art" = filter(false)));
        }

        //For Vendor 2(US production partner)++
        field(50148; "Art not Acceptable Vend2"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Art Not Acceptable" = filter(true), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), Vendor_Type = filter('US PRODUCTION PARTNER')));
            Caption = 'Art not Acceptable';
        }
        // field(50149; "Art yet to recieve Vend2"; Integer)
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = count(Artwork where("Document Type" = Filter(Order), "Art Options" = FILTER(Received | "Yet to Receive"), "Requested Art 1" = filter(''), "Requested Art 2" = filter(''), "Requested Art 3" = filter(''), Vendor_Type = filter('US PRODUCTION PARTNER')));
        //     Caption = 'Missing Artwork';
        // }
        field(50150; "In Production Vend2"; Integer)
        {
            CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "In Production" = filter(True), "Cancelled Order" = filter(false), "Art Not Acceptable" = filter(false), Status = filter("In Production"), "Back Order" = filter(false), Vendor_Type = filter('US PRODUCTION PARTNER')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50151; "Ready For Production Vend2"; Integer)
        {
            CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Cancelled Order" = filter(false), "Art Not Acceptable" = filter(false), Status = filter("Customer Approved Paper Proof"), "Move to In Prodcution" = filter(true), "Back Order" = filter(false), "Customer Approved" = filter(true), "Credit On Hold" = filter(false), Vendor_Type = filter('US PRODUCTION PARTNER')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50152; "Sample Order Ready Prod Vend2"; Integer)
        {
            CalcFormula = count("Sales Line" where("Cancel Order" = filter(false), "Sample No Proof Required" = filter(true), "Sample On Hold Orders" = filter(false), "Back Order" = filter(false), Vendor_Type = filter('US PRODUCTION PARTNER')));
            Caption = 'Sample Order Ready For Production';
            FieldClass = FlowField;
        }
        field(50153; "Blank Orders In Prod Vend2"; Integer)
        {
            CalcFormula = count("Sales Line" where("Blank Order" = filter(true), "Blank Order InProduction" = filter(true), "Sample On Hold Orders" = filter(false), "Completely Shipped" = filter(false), "Back Order" = filter(false), Vendor_Type = filter('US PRODUCTION PARTNER')));
            Caption = 'Blank Orders In Production';
            FieldClass = FlowField;
        }
        //For vendor 2(US production partner)--



        //For Vendor 3( For IID)++
        field(50171; "Art not Acceptable Vend3"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Art Not Acceptable" = filter(true), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), Vendor_Type = filter('IID FACILITY')));
            Caption = 'Art not Acceptable';
        }
        // field(50172; "Art yet to recieve Vend3"; Integer)
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = count(Artwork where("Document Type" = Filter(Order), "Art Options" = FILTER(Received | "Yet to Receive"), "Requested Art 1" = filter(''), "Requested Art 2" = filter(''), "Requested Art 3" = filter(''), Vendor_Type = filter('IID FACILITY')));
        //     Caption = 'Missing Artwork';
        // }
        field(50173; "In Production Vend3"; Integer)
        {
            CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "In Production" = filter(True), "Cancelled Order" = filter(false), "Art Not Acceptable" = filter(false), Status = filter("In Production"), "Back Order" = filter(false), Vendor_Type = filter('IID FACILITY')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50174; "Ready For Production Vend3"; Integer)
        {
            //  CalcFormula = count("Sales Header" where("Document Type" = const(Order), "cancelled Order" = filter(false), "Fully Approved" = filter(true), "Approval Status" = filter("Fully Completed"), Vendor_iiD = filter(true)));
            CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Cancelled Order" = filter(false), "Art Not Acceptable" = filter(false), "Customer Approved" = filter(true), Status = filter("Customer Approved Paper Proof" | "Proof Internally Approved" | "Ready for Production"), "Move to In Prodcution" = filter(true), "Back Order" = filter(false), "Credit On Hold" = filter(false), Vendor_Type = filter('IID FACILITY')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50175; "Sample Order Ready Prod Vend3"; Integer)
        {
            CalcFormula = count("Sales Line" where("Cancel Order" = filter(false), "Sample No Proof Required" = filter(true), "Sample On Hold Orders" = filter(false), "Back Order" = filter(false), Vendor_Type = filter('IID FACILITY')));
            Caption = 'Sample Order Ready For Production';
            FieldClass = FlowField;
        }
        field(50176; "Blank Orders In Prod Vend3"; Integer)
        {
            CalcFormula = count("Sales Line" where("Blank Order" = filter(true), "Blank Order InProduction" = filter(true), "Sample On Hold Orders" = filter(false), "Completely Shipped" = filter(false), "Back Order" = filter(false), Vendor_Type = filter('IID FACILITY')));
            Caption = 'Blank Orders In Production';
            FieldClass = FlowField;
        }
        //For vendor 3( For IID)--

        field(50177; "Back Order"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Line" where("Document Type" = const(Order), "Quantity Shipped" = filter(0), "Back Order" = filter(true), "Cancel Order" = filter(false), "Completely Shipped" = filter(false)));
        }


        //ArtWorkProfile Vendorwise>>>>
        field(50178; "Paper Proof Required IId"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting Approval iD" = filter(false), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof Rejected IID" = filter(false), Vendor_iiD = filter(true), "Completely Shipped" = filter(False), Invoice = filter(false), "Await Proof filter" = filter(true)));//OrderwiseChangeVY24082023
            // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), Status = FILTER("Rework Art" | "Customer Rejected Paper Proof" | "Paper Proof Recreation" | "Art Approved" | "New Proof" | "Awaiting Proof"), "Proof Required" = filter(true), "Art Options" = FILTER(Received), "Artwork Uploaded" = filter(True), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Rush Order" = filter(false), "Super Rush Order" = filter(false), "Sent To Art" = filter(true), "Order On Hold" = filter(false), "Proof Rejected" = filter(false)));
            Caption = 'Awaiting Proof';
        }
        field(50179; "Art not Acceptable IId"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting Cust Approval" = filter(false), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof Approve Order iid" = filter(false), Vendor_iiD = filter(true)));//OrderwiseChangeVY24082023                                                                                                                                                                                                                                                                                                    //  CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Art Not Acceptable" = filter(true), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), Vendor_Type = filter('OVERSEAS VENDOR')));
            Caption = 'Art not Acceptable';
        }
        field(50180; "Awaiting Proof Approval IId"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting Approval iD" = filter(true), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Vendor_iiD = filter(true)));//OrderwiseChangeVY24082023                                                                                                                                                                                                                                                     // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
            Caption = 'Awaiting Approval';
        }
        field(50181; "No Proof Required IId"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Mandatory Approval" = filter(false), "Proof awaiting Cust Approval" = filter(true), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Vendor_iiD = filter(true)));//OrderwiseChangeVY24082023                                                                                                                                                                                                                                                                                              //  CalcFormula = count("Artwork" WHERE("Proof Required" = filter(False), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
            Caption = 'No Proof Required';
        }
        field(50182; "Needs Rivision IId"; Integer)
        {
            Caption = 'Needs Revision';
            //  Editable = FALSE;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof Rejected IID" = filter(true), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Vendor_iiD = filter(true)));//OrderwiseChangeVY24082023ss
                                                                                                                                                                                                                                                        // CalcFormula = Count("Artwork" WHERE("Document Type" = CONST(Order), Status = FILTER("Customer Rejected Paper Proof"), "Cancelled Order" = FILTER(FALSE), "Proof Rejected" = filter(true)));
        }

        field(50183; "Blank Order Ready Production"; Integer)
        {
            CalcFormula = count("Sales Line" where("Cancel Order" = filter(false), "Blank Order Ready for Prod" = filter(true), "Sample On Hold Orders" = filter(false), "Blank Order" = filter(true), Vendor_Type = filter('OVERSEAS VENDOR')));
            //          CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Cancelled Order" = filter(false), "Art Not Acceptable" = filter(false), "Customer Approved" = filter(true), Status = filter("Customer Approved Paper Proof" | "Proof Internally Approved" | "Ready for Production"), "Move to In Prodcution" = filter(true), "Back Order" = filter(false), "Credit On Hold" = filter(false), Vendor_Type = filter('IID FACILITY')));
            Caption = 'Blank Order Ready For Production';
            FieldClass = FlowField;
        }
        field(50184; "Blank Order Ready Prod Vend2"; Integer)
        {
            CalcFormula = count("Sales Line" where("Cancel Order" = filter(false), "Blank Order Ready for Prod" = filter(true), "Sample On Hold Orders" = filter(false), "Blank Order" = filter(true), Vendor_Type = filter('US PRODUCTION PARTNER')));
            Caption = 'Blank Order Ready For Production';
            FieldClass = FlowField;
        }
        field(50185; "Blank Order Ready Prod Vend3"; Integer)
        {
            CalcFormula = count("Sales Line" where("Cancel Order" = filter(false), "Blank Order Ready for Prod" = filter(true), "Sample On Hold Orders" = filter(false), "Blank Order" = filter(true), Vendor_Type = filter('IID FACILITY')));
            Caption = 'Blank Order Ready For Production';
            FieldClass = FlowField;
        }
        //ArtWorkProfile Vendorwise<<<<<
        // PW NG 1.0 14112023 START - Imprint ID - Waiting for prepayment Invoice - Once SO ack. is sent then order should move to 'Waiting For Prepayment Invoices' bucket >>>
        field(50186; "Waiting For Prepay Invoices"; Integer)
        {
            CalcFormula = count("Sales Header" where("SO Confirmation Send" = filter(true), "Is Revised prepayment" = filter(false), "Is Item available" = filter(true), "Payment Status" = filter(<> 'Fully Paid'), "Prepayment Post" = filter(false)));
            Caption = 'Pending Prepayment Invoices';
            FieldClass = FlowField;
        }
        field(50187; "Revised prepayment"; Integer)
        {
            CalcFormula = count("Sales Header" where("SO Confirmation Send" = filter(true), "Is Revised prepayment" = filter(true), "Is Item available" = filter(true)));
            Caption = 'Revised prepayment';
            FieldClass = FlowField;
        }
        // PW NG 1.0 14112023 END - Imprint ID - Waiting for prepayment Invoice - Once SO ack. is sent then order should move to 'Waiting For Prepayment Invoices' bucket <<<


        field(50188; "Awaiting Proof Overseas"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting CustApp over" = filter(false), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof Approve Order" = filter(false), "Completely Shipped" = filter(False), Invoice = filter(false), "Proof Rejected Overs" = filter(false), "Vendor_Overseas" = filter(true), "Await Proof filter" = filter(true)));//OrderwiseChangeVY24082023
            // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), Status = FILTER("Rework Art" | "Customer Rejected Paper Proof" | "Paper Proof Recreation" | "Art Approved" | "New Proof" | "Awaiting Proof"), "Proof Required" = filter(true), "Art Options" = FILTER(Received), "Artwork Uploaded" = filter(True), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Rush Order" = filter(false), "Super Rush Order" = filter(false), "Sent To Art" = filter(true), "Order On Hold" = filter(false), "Proof Rejected" = filter(false)));
            Caption = 'Awaiting Proof';
        }
        field(50189; "Art not Acceptable Over"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting CustApp over" = filter(false), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof Approve Order" = filter(false), Vendor_Overseas = filter(true)));//OrderwiseChangeVY24082023                                                                                                                                                                                                                                                                                               //  CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Art Not Acceptable" = filter(true), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), Vendor_Type = filter('OVERSEAS VENDOR')));
            Caption = 'Art not Acceptable';
        }
        field(50190; "Await ProofApproval Overseas"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting CustApp over" = filter(true), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Vendor_Overseas = filter(true)));//OrderwiseChangeVY24082023
                                                                                                                                                                                                                                                                      // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
            Caption = 'Awaiting Approval';
        }
        field(50191; "Needs Rivision Overseas"; Integer)
        {
            Caption = 'Needs Revision';
            //  Editable = FALSE;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof Rejected Overs" = filter(true), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Vendor_Overseas = filter(true)));//OrderwiseChangeVY24082023ss                                                                                                                                                                                                                                                       // CalcFormula = Count("Artwork" WHERE("Document Type" = CONST(Order), Status = FILTER("Customer Rejected Paper Proof"), "Cancelled Order" = FILTER(FALSE), "Proof Rejected" = filter(true)));
        }
        //MR+++
        field(50192; "Ready to pick Vend3"; Integer)
        {
            //  CalcFormula = count("Sales Header" where("Document Type" = const(Order), "cancelled Order" = filter(false), "Fully Approved" = filter(true), "Approval Status" = filter("Fully Completed"), Vendor_iiD = filter(true)));
            // CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Cancelled Order" = filter(false), "Art Not Acceptable" = filter(false), "Customer Approved" = filter(true), Status = filter("Customer Approved Paper Proof"), "Ready to Pick" = filter(true), "Back Order" = filter(false), "Credit On Hold" = filter(false), Vendor_Type = filter('IID FACILITY')));
            CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Cancelled Order" = filter(false), Vendor_Type = filter('IID FACILITY')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50193; "Ready to pick Vend2"; Integer)
        {
            // CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Cancelled Order" = filter(false), "Art Not Acceptable" = filter(false), Status = filter("Customer Approved Paper Proof"), "Ready to Pick" = filter(true), "Back Order" = filter(false), "Customer Approved" = filter(true), "Credit On Hold" = filter(false), Vendor_Type = filter('US PRODUCTION PARTNER')));
            CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Cancelled Order" = filter(false), Vendor_Type = filter('US PRODUCTION PARTNER')));

            Editable = false;
            FieldClass = FlowField;
        }
        field(50194; "Ready to pick"; Integer)
        {
            //CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Customer Approved" = filter(true), "Cancelled Order" = filter(false), "Art Not Acceptable" = filter(false), Status = filter("Customer Approved Paper Proof"), "Ready to Pick" = filter(true), "Back Order" = filter(false), "Credit On Hold" = filter(false), Vendor_Type = filter('OVERSEAS VENDOR')));
            CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Cancelled Order" = filter(false), Vendor_Type = filter('OVERSEAS VENDOR'))); // PW NG 1.0 17052024 Order show any how in Ready to Pick bucket
            Editable = false;
            FieldClass = FlowField;
        }
        //MR---
        field(50195; "Date Filter6"; date)
        {
            Editable = false;
            FieldClass = FlowFilter;
        }
        // field(50196; "Ready For Shipment"; Integer)
        // {
        //     Caption = 'Ready For Shipment';
        //     CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Customer Approved" = filter(true), "Cancelled Order" = filter(false), "Art Not Acceptable" = filter(false), Status = filter("Ready for Shipment"), "Move to In Prodcution" = filter(true), "Back Order" = filter(false), "Credit On Hold" = filter(false), Vendor_Type = filter('IID FACILITY'), "Completely Shipped" = filter(false)));
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        // field(50197; "Ready For Shipment Vend2"; Integer)
        // {
        //     Caption = 'Ready For Shipment';
        //     CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Customer Approved" = filter(true), "Cancelled Order" = filter(false), "Art Not Acceptable" = filter(false), Status = filter("Ready for Shipment"), "Move to In Prodcution" = filter(true), "Back Order" = filter(false), "Credit On Hold" = filter(false), Vendor_Type = filter('US PRODUCTION PARTNER'), "Completely Shipped" = filter(false)));
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        // field(50198; "Ready For Shipment Vend3"; Integer)
        // {
        //     Caption = 'Ready For Shipment';
        //     CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Customer Approved" = filter(true), "Cancelled Order" = filter(false), "Art Not Acceptable" = filter(false), Status = filter("Ready for Shipment"), "Move to In Prodcution" = filter(true), "Back Order" = filter(false), "Credit On Hold" = filter(false), Vendor_Type = filter('OVERSEAS VENDOR'), "Completely Shipped" = filter(false)));
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        field(50199; "Ready For Shipment"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Artwork" where("Document Type" = Filter(Order), "Cancelled Order" = filter(false), "Art Not Acceptable" = filter(false), "Customer Approved" = filter(true), Status = filter("Ready for Shipment" | "Partially Shipped"), "Back Order" = filter(false), "Credit On Hold" = filter(false), Vendor_Type = filter('IID FACILITY')));
            //  CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Artwork Status" = filter('Ready For Shipment')));                                                                                                                                                                                                                                                                                              // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
            Caption = 'Ready For Shipment';
        }
        field(50200; "Awaiting Payment Sample Orders"; Integer)
        {
            // Caption = 'Warehouse Sample Orders';
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), Invoice = filter(False), "Completely Shipped" = filter(False), "SO Confirmation Send" = filter(true), WaitingPayWareBucketFilter = filter(false), "Payment Entry Posted" = filter(True), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Payment Entry Posted" = filter(false), "Sample Order" = filter(true), "Amount Including VAT" = filter(<> 0)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50201; "IID Open Sales Quotes"; Integer)
        {
            CalcFormula = count("Sales Header" where("Document Type" = const(Quote), "cancelled Order" = filter(false), "Sales Order Number" = filter(= ''), Vendor_iiD = filter(true)));
            Caption = 'IID Open Sales Quotes';
            FieldClass = FlowField;
        }
        field(50202; "Open Quotes Virtual"; Integer)
        {
            CalcFormula = count("Sales Header" where("Document Type" = const(Quote), "Quote Sent" = filter(true), "Proof ApproveQuote" = filter(True), "cancelled Order" = filter(false), "Artwork Status" = filter(<> 'Order Confirmed')));
            Caption = 'Open Quotes Virtual';
            FieldClass = FlowField;
        }
        field(50203; "5k ALLSales Quotes"; Integer)
        {
            CalcFormula = count("Sales Header" where("Document Type" = const(Quote)));
            Caption = '5k Open Sales Quotes';
            FieldClass = FlowField;
        }

        field(50204; "ALL Sale Order IID"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Invoice = filter(false), Vendor_iiD = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50205; "Open SO IID"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Invoice = filter(false), Ship = filter(false), Vendor_iiD = filter(true), "Completely Shipped" = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50206; "ALL Sale Order Overs"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Invoice = filter(false), Vendor_Overseas = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50207; "Open SO Overs"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Invoice = filter(false), Vendor_Overseas = filter(true), "Completely Shipped" = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50208; "ALL Sale Order USPP"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Invoice = filter(false), Vendor_USPP = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50209; "Open SO USPP"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Invoice = filter(false), Ship = filter(false), Vendor_USPP = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50210; "IID Purchase Order"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = CONST(Order), "Buy-from Vendor No." = filter('IID')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50211; "Pending PO Email"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = CONST(Order), "PO Sent Details" = filter('')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50212; "Repeat Orders"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Invoice = filter(false), "Repeat Order" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50213; "Scrap Handling"; Integer)
        {
            CalcFormula = count("Scrap Handling" where(Processed = filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50214; "Pending PO Conversion"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "PO No." = filter(= ''), "SO Confirmation Send" = filter(true), "Completely Shipped" = filter(False), Invoice = filter(false), PendingPOStatusFilter = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50215; "Rush Proof Required USA"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting CustApp over" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof Approve Order" = filter(false), "Proof Rejected Order" = filter(false), Vendor_USPP = filter(true), Invoice = filter(false), Invoice = filter(false), Order_Type = filter(<> 'Standard')));//OrderwiseChangeVY24082023
            Caption = 'Urgent Awaiting Proof';
        }
        field(50216; "Rush Proof IID"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting Approval iD" = filter(false), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof Approve Order iid" = filter(false), "Proof Rejected IID" = filter(false), Vendor_iiD = filter(true), Invoice = filter(false), Order_Type = filter(<> 'Standard')));//OrderwiseChangeVY24082023
            Caption = 'Urgent Awaiting Proof';
        }
        field(50217; "Blank Ordes ReadyShip"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof Rejected USPP" = filter(false), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "cancelled Order" = filter(false), "Completely Shipped" = filter(false), "Blank Order Ready To Ship" = filter(false), WaitingPayWareBucketFilter = filter(true), "Blank Order" = filter(true), "Sample Order" = filter(false), "SO Confirmation Send" = filter(True)));//OrderwiseChangeVY24082023                                                                                                                                                                                                                                                                                                // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
            Caption = 'Blank Order Ready for Production';
        }
        field(50218; "Blank Order Ready To Ship"; Integer)
        {
            CalcFormula = count("Sales Line" where("Cancel Order" = filter(false), "Blank Order Ready To Ship" = filter(true), "Sample On Hold Orders" = filter(false), "Blank Order" = filter(true), "Completely Shipped" = filter(false)));
            Caption = 'Blank Order Ready To Ship';
            FieldClass = FlowField;
        }
        field(50219; "Reprint Labels"; integer)
        {
            CalcFormula = count("Sales Header" where("Document Type" = filter(Order), "cancelled Order" = filter(false), "Tracking no." = filter(<> '')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50221; "Pending PO Conversion Over"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "PO No." = filter(= ''), "SO Confirmation Send" = filter(true), "Completely Shipped" = filter(False), Invoice = filter(false), Vendor_Overseas = filter(True)));
            Editable = false;
            FieldClass = FlowField;
        }
        // field(50217; "SuperRush Proof Required USA"; Integer)
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting CustApp over" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof Approve Order" = filter(false), "Proof Rejected Order" = filter(false), Vendor_USPP = filter(true), Invoice = filter(false), Invoice = filter(false), "Super Rush Order" = filter(True)));//OrderwiseChangeVY24082023
        //     Caption = 'Super Urgent Awaiting Proof';
        // }
        // field(50218; "SuperRush Proof IID"; Integer)
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting Approval iD" = filter(false), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof Approve Order iid" = filter(false), "Proof Rejected IID" = filter(false), Vendor_iiD = filter(true), Invoice = filter(false), "Super Rush Order" = filter(True)));//OrderwiseChangeVY24082023
        //     Caption = 'Super Urgent Awaiting Proof';
        // }

        field(50220; "WebEx Sync Failed Orders"; Integer)
        {
            Caption = 'WebEx Sync Failed Orders';
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "WebEx Sync Failed" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50222; "ALL SaleS Order XB"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Invoice = filter(false), Vendor_XB = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50223; "Open SO XB"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Invoice = filter(false), Ship = filter(false), Vendor_XB = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50224; "Art not Acceptable XB"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting Cust Approval" = filter(false), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Proof Approve Order" = filter(false), Vendor_XB = filter(true)));//OrderwiseChangeVY24082023
                                                                                                                                                                                                                                                                                                         //  CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Art Not Acceptable" = filter(true), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), Vendor_Type = filter('OVERSEAS VENDOR')));
            Caption = 'Art not Acceptable';
        }
        field(50225; "Paper Proof Required XB"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting CustApp over" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Vendor_XB = filter(true), "Completely Shipped" = filter(False), "Await Proof filter" = filter(true)));//OrderwiseChangeVY24082023
            // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), Status = FILTER("Rework Art" | "Customer Rejected Paper Proof" | "Paper Proof Recreation" | "Art Approved" | "New Proof" | "Awaiting Proof"), "Proof Required" = filter(true), "Art Options" = FILTER(Received), "Artwork Uploaded" = filter(True), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(false), "Proof awaiting Cust Approval" = filter(false), "Proof Approved" = filter(false), "Rush Order" = filter(false), "Super Rush Order" = filter(false), "Sent To Art" = filter(true), "Order On Hold" = filter(false), "Proof Rejected" = filter(false)));
            Caption = 'Awaiting Proof';
        }
        field(50226; "Needs Rivision XB"; Integer)
        {
            Caption = 'Needs Revision';
            Editable = FALSE;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof Rejected XB" = filter(true), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Vendor_XB = filter(true)));//OrderwiseChangeVY24082023ss
                                                                                                                                                                                                                                                      // CalcFormula = Count("Artwork" WHERE("Document Type" = CONST(Order), Status = FILTER("Customer Rejected Paper Proof"), "Cancelled Order" = FILTER(FALSE), "Proof Rejected" = filter(true)));
        }
        field(50227; "Awaiting Proof Approval XB"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "Proof awaiting Cust Approval" = filter(true), "Proof Rejected XB" = filter(false), "Sent To Art" = filter(true), "cancelled Order" = filter(false), "Order On Hold" = filter(false), Vendor_XB = filter(true)));//OrderwiseChangeVY24082023                                                                                                                                                                                                                                                                                                // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
            Caption = 'Awaiting Approval';
        }
        field(50228; "Pending PO Conversion USPP"; Integer)
        {
            CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "PO No." = filter(= ''), "SO Confirmation Send" = filter(true), "Completely Shipped" = filter(False), Invoice = filter(false), Vendor_USPP = filter(True), PendingPOStatusFilter = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50229; "Ready For Shipment New"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Line" where("Document Type" = Filter(Order), "Vendor Portal Status" = filter('Ready for Shipment' | 'Partially Shipped'), Vendor_Type = filter('IID FACILITY')));
            //  CalcFormula = count("Sales Header" WHERE("Document Type" = CONST(Order), "cancelled Order" = filter(false), "Order On Hold" = filter(false), "Artwork Status" = filter('Ready For Shipment')));                                                                                                                                                                                                                                                                                              // CalcFormula = count("Artwork" WHERE("Document Type" = Filter(Order), "Proof Required" = filter(true), "Art Not Acceptable" = filter(false), "Sent To QA" = filter(true), "Proof awaiting Cust Approval" = filter(true), "Proof Approved" = filter(false), "Order On Hold" = filter(false)));
            Caption = 'Ready For Shipment';
        }
    }
}