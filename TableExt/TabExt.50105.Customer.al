//tableextension 50103 MyExtensionTab50121 extends Customer
//PW MR 1.0 14122023 - Added field for Approval of new customers
tableextension 50105 TabExtCustomer extends Customer
{
    fields
    {
        modify("Mobile Phone No.")
        {
            Caption = 'Contact Phone No';
        }

        field(50100; "Proof All Orders"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Internal Proof Required';
        }
        field(50101; "Mandatory Approval"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Proof Approval Required';
        }
        field(50102; "Email Proof"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Email Proof';
        }
        field(50103; "Art Email ID"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Art Email ID';
        }
        field(50104; "Proof Info Mail"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Info Mail';
        }
        field(50105; "Parent Customer"; Code[20])
        {
            TableRelation = Customer where("Is Sub Customer" = filter(false));
            DataClassification = CustomerContent;

            // ValidateTableRelation = false;
        }
        field(50106; "Parent Customer Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50107; "Shipping Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Shipping Email';
        }
        field(50108; "Billing Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Billing Email';
        }

        field(50109; "Ack Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Ack Email';
        }
        field(50110; "Credit on Hold"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Credit on Hold';
        }
        field(50111; "Third Party Shipping"; Boolean)
        {
            Caption = 'Third Party Shipping';
            DataClassification = CustomerContent;
        }
        field(50112; "Third Party Shipping Acc. No."; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Third Party Shipping Acc. No.';
        }
        field(50113; "Is Residential"; Boolean)
        {
            DataClassification = CustomerContent;
        }

        field(50114; "Customer Type"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer Type".Code;

        }
        field(50115; "Association Type"; Enum "Association Type")
        {
            DataClassification = CustomerContent;
        }
        field(50116; Association; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(50117; "Middle Name"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50118; "Is Sub Customer"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50119; "W2 Attached"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'No,Yes';
            OptionMembers = No,Yes;


        }
        field(50120; "Contact E-Mail"; Text[80])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(50121; "Reminder Due Days"; Code[20])
        {
            Caption = 'Reminder Due Days';
            DataClassification = ToBeClassified;
        }
        field(50122; "Customer Types"; Enum CustomerType)
        {
            DataClassification = CustomerContent;
            InitValue = 1;
            // TableRelation = "Customer Type".Code;
        }
        field(50123; "Payment Method Code 2"; Code[10])
        {
            TableRelation = "Payment Method".code;
        }
        field(50124; "Resell Certificate Upload"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Resell Certificate Upload';
        }
        field(50125; "Resell cert Text Upload"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Resell Certificate Upload';
        }
        field(50126; "Resell Certificate"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Resell Certificate';
        }
        // PW NG 1.0 11082023 START - Customer Integration Web to BC
        field(50127; "Web Customer"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Web Customer';
        }
        field(50128; "Web Customer modified"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Web customer modified';
        }
        field(50129; ASI; Text[100])
        {
            Caption = 'ASI';
            DataClassification = CustomerContent;
        }
        field(50130; UPIC; Text[100])
        {
            Caption = 'UPIC';
            DataClassification = CustomerContent;
        }
        field(50131; PPAI; Text[100])
        {
            Caption = 'PPAI';
            DataClassification = CustomerContent;
        }
        field(50132; SAGE; Text[100])
        {
            Caption = 'SAGE';
            DataClassification = CustomerContent;
        }
        field(50133; "Web Customer insert"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Web Customer';
        }
        // PW NG 1.0 11082023 END - Customer Integration Web to BC

        //>>PW MR 1.0 14122023 Start 
        field(50134; "New Entity"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        //<<PW MR 1.0 14122023 End
        //MR
        field(50270; "VIP Customer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        //MR
        field(50271; "Contact Name"; Text[80])
        {
            DataClassification = CustomerContent;

            trigger OnLookup()
            begin
                LookupContactList1();
            end;
        }
        //>>PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50272; "QuickBook ID"; Code[100])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 26th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50273; "QuickBook Error"; Text[2048])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 26th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50274; "QuickBook Sync Failed"; Boolean)
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC

        field(50275; "Created Through Web"; Boolean)
        {
            DataClassification = CustomerContent;
        }

        modify("Post Code")
        {
            Caption = 'Zip Code';
        }
    }
    local procedure LookupContactList1()
    var
        ContactBusinessRelation: Record "Contact Business Relation";
        Cont: Record Contact;
        TempCust: Record Customer temporary;
        IsHandled: Boolean;
    begin
        /// IsHandled := false;
        // OnBeforeLookupContactList(Rec, IsHandled, CurrFieldNo);
        //if IsHandled then
        //  exit;

        Cont.FilterGroup(2);
        if ContactBusinessRelation.FindByRelation(ContactBusinessRelation."Link to Table"::Customer, "No.") then
            Cont.SetRange("Company No.", ContactBusinessRelation."Contact No.")
        else
            Cont.SetRange("Company No.", '');

        if "Primary Contact No." <> '' then
            if Cont.Get("Primary Contact No.") then;
        if PAGE.RunModal(0, Cont) = ACTION::LookupOK then begin
            TempCust.Copy(Rec);
            Find();
            TransferFields(TempCust, false);
            Validate("Primary Contact No.", Cont."No.");
        end;
    end;

}