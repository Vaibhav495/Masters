//PW MR 1.0 14122023 - Added field for Approval of new contacts
tableextension 50112 ExtTabContacts extends Contact
{
    fields
    {
        modify(County)
        {
            Caption = 'Contact State';
            CaptionClass = 'Contact State';
        }
        field(50000; "Shipping Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Shipping Email';
        }
        field(50001; "Billing Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Billing Email';
        }
        field(50002; "Customer No."; Code[20])
        {

            TableRelation = Customer."No.";// where(cont=field("No."));
        }
        field(50003; "Customer Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50004; "No. of Quotes"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Quote),
                                                      "Sell-to Contact No." = FIELD("No.")));
            Caption = 'No. of Quotes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50005; "No. of Blanket Orders"; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Blanket Order"),
                                                      "Sell-to Contact No." = FIELD("No.")));
            Caption = 'No. of Blanket Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50006; "No. of Orders"; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Order),
                                                      "Sell-to Contact No." = FIELD("No.")));
            Caption = 'No. of Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50007; "No. of Invoices"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Invoice),
                                                     "Sell-to Contact No." = FIELD("No.")));
            Caption = 'No. of Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50008; "No. of Return Orders"; Integer)
        {
            AccessByPermission = TableData "Return Receipt Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Return Order"),
                                                      "Sell-to Contact No." = FIELD("No.")));
            Caption = 'No. of Return Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50009; "No. of Credit Memos"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Credit Memo"),
                                                     "Sell-to Contact No." = FIELD("No.")));
            Caption = 'No. of Credit Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50010; "No. of Pstd. Shipments"; Integer)
        {
            CalcFormula = Count("Sales Shipment Header" WHERE("Sell-to Contact No." = FIELD("No.")));
            Caption = 'No. of Pstd. Shipments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50011; "No. of Pstd. Invoices"; Integer)
        {
            CalcFormula = Count("Sales Invoice Header" WHERE("Sell-to Contact No." = FIELD("No.")));
            Caption = 'No. of Pstd. Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50012; "No. of Pstd. Return Receipts"; Integer)
        {
            CalcFormula = Count("Return Receipt Header" WHERE("Sell-to Contact No." = FIELD("No.")));
            Caption = 'No. of Pstd. Return Receipts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50013; "No. of Pstd. Credit Memos"; Integer)
        {
            CalcFormula = Count("Sales Cr.Memo Header" WHERE("Sell-to Contact No." = FIELD("No.")));
            Caption = 'No. of Pstd. Credit Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50014; "No. of Ship-to Addresses"; Integer)
        {
            CalcFormula = Count("Ship-to Address" WHERE("Customer No." = FIELD("No.")));
            Caption = 'No. of Ship-to Addresses';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50015; "Bill-To No. of Quotes"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Quote),
                                                     "Bill-to Contact No." = FIELD("No.")));
            Caption = 'Bill-To No. of Quotes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Bill-To No. of Blanket Orders"; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Blanket Order"),
                                                        "Bill-to Contact No." = FIELD("No.")));
            Caption = 'Bill-To No. of Blanket Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; "Bill-To No. of Orders"; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Order),
                                                        "Bill-to Contact No." = FIELD("No.")));
            Caption = 'Bill-To No. of Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50018; "Bill-To No. of Invoices"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Invoice),
                                                        "Bill-to Contact No." = FIELD("No.")));
            Caption = 'Bill-To No. of Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50019; "Bill-To No. of Return Orders"; Integer)
        {
            AccessByPermission = TableData "Return Receipt Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Return Order"),
                                                        "Bill-to Contact No." = FIELD("No.")));
            Caption = 'Bill-To No. of Return Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50020; "Bill-To No. of Credit Memos"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Credit Memo"),
                                                        "Bill-to Contact No." = FIELD("No.")));
            Caption = 'Bill-To No. of Credit Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50021; "Bill-To No. of Pstd. Shipments"; Integer)
        {
            CalcFormula = Count("Sales Shipment Header" WHERE("Bill-to Contact No." = FIELD("No.")));
            Caption = 'Bill-To No. of Pstd. Shipments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50022; "Bill-To No. of Pstd. Invoices"; Integer)
        {
            CalcFormula = Count("Sales Invoice Header" WHERE("Bill-to Contact No." = FIELD("No.")));
            Caption = 'Bill-To No. of Pstd. Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50023; "Bill-To No. of Pstd. Return R."; Integer)
        {
            CalcFormula = Count("Return Receipt Header" WHERE("Bill-to Contact No." = FIELD("No.")));
            Caption = 'Bill-To No. of Pstd. Return R.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50024; "Bill-To No. of Pstd. Cr. Memos"; Integer)
        {
            CalcFormula = Count("Sales Cr.Memo Header" WHERE("Bill-to Contact No." = FIELD("No.")));
            Caption = 'Bill-To No. of Pstd. Cr. Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        // PW NG 1.0 11082023 START - Customer Integration Web to BC
        field(50025; UserGuid; Text[100])
        {
            Caption = 'UserGuid';
            DataClassification = CustomerContent;
        }
        field(50026; "Password"; Text[100])
        {
            Caption = 'Password';
            DataClassification = CustomerContent;
        }
        field(50027; "Web Contacts"; Boolean)
        {
            Caption = 'Web Contacts';
            DataClassification = CustomerContent;
        }
        field(50028; "Customer Industry"; Text[100])
        {
            Caption = 'Customer Industry';
            DataClassification = CustomerContent;
        }
        field(50029; "Web Contact Insert"; DateTime)
        {
            Caption = 'Web Contact Insert';
            DataClassification = CustomerContent;
        }
        field(50030; "Web Contact Modify"; DateTime)
        {
            Caption = 'Web Contact Modify';
            DataClassification = CustomerContent;
        }
        field(50031; Referral; Text[2048])
        {
            Caption = 'Referral';

            DataClassification = CustomerContent;
        }
        field(50032; registrationType; Text[100])
        {
            Caption = 'Registration Type';

            DataClassification = CustomerContent;
        }
        field(50033; extensionNo; Text[100])
        {
            Caption = 'Extension No.';

            DataClassification = CustomerContent;
        }
        // PW NG 1.0 11082023 END - Customer Integration Web to BC
        // PW NG 1.0 11102023 START - Customer Integration Web to BC
        // field(50034; IsSubScribed; Boolean)
        // {
        //     Caption = 'IsSubScribed';

        //     DataClassification = CustomerContent;
        // }
        //Above field Removed by vy15/12/23 getting error while
        field(50035; IsApproved; Boolean)
        {
            Caption = 'IsApproved';

            DataClassification = CustomerContent;
        }
        field(50036; RoleId; Integer)
        {
            Caption = 'RoleId';

            DataClassification = CustomerContent;
        }
        field(50037; UserType; Text[100])
        {
            Caption = 'UserType';

            DataClassification = CustomerContent;
        }
        field(50038; RoleName; Text[100])
        {
            Caption = 'RoleName';

            DataClassification = CustomerContent;
        }
        field(50039; IsDeleted; Boolean)
        {
            Caption = 'IsDeleted';

            DataClassification = CustomerContent;
        }
        field(50040; ParentCompany; Text[100])
        {
            Caption = 'Parent Company';

            DataClassification = CustomerContent;
        }
        field(50041; "awaiting Sync"; Boolean)
        {
            // Caption = 'Parent Company';
            DataClassification = CustomerContent;
        }

        // PW NG 1.0 11102023 END - Customer Integration Web to BC


        //>>PW MR 1.0 14122023 Start 
        field(50042; "New Entity"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        //<<PW MR 1.0 14122023 End


        //Added by vy getting error while vendor creation Transferfield error so ID change
        field(50043; IsSubScribed; Boolean)
        {
            Caption = 'IsSubScribed';
            Description = '<Puropse of this Field>';

            DataClassification = CustomerContent;
        }
        field(50044; "Created Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50045; "VIP Customer"; Boolean)
        {
            Caption = 'VIP Customer';
            DataClassification = CustomerContent;
        }
        field(50046; "Synch Mail"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50047; "Company Email"; Text[250])
        {
            DataClassification = CustomerContent;
            // Caption = 'Billing Email';
        }
        field(50048; "VIP Customer New"; Boolean)
        {
            Caption = 'VIP Customer';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."VIP Customer" where("No." = field("Customer No.")));
        }
        //>>PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50049; "QuickBook ID"; Code[100])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50050; "QuickBook Sync Failed"; Boolean)
        {
            //TableRelation = Location.Code;
        }
        field(50051; "QuickBook Error"; Text[2048])
        {
            //TableRelation = Location.Code;
        }
        field(50052; "Do not sync to QB"; Boolean)
        {
            //TableRelation = Location.Code;
        }
        field(50053; "Sych completed"; Boolean)
        {
            //TableRelation = Location.Code;
        }
        field(50054; "Last Sync DateTime"; DateTime)
        {
            //TableRelation = Location.Code;
        }

        //<<PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC

        field(50055; "Created Through Web"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        modify("Post Code")
        {
            Caption = 'Zip Code';
        }
    }
    fieldgroups
    {
        addlast(DropDown; "Company Name", "E-Mail")
        {

        }

    }

}