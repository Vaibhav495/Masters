tableextension 50119 VendorExt extends Vendor
{
    fields
    {
        /*  field(50001; "Vendor Type"; enum "Vendor Type")
         {
             DataClassification = ToBeClassified;
         } */
        field(50206; "Art Email ID"; Text[1050])
        {
            Caption = 'Art Email ID';
            DataClassification = CustomerContent;
        }
        // PW NG 1.0 START 11082023 - Do not change the field ID
        //[JIRA] (EI-332) Imprint ID - Vendor No - creating a new vendor getting an error.
        // because of this erro The following fields must have the same type: Field: Billing Email <-- Vendor Type Table: Contact <-- Vendor Type: Text <-- Option
        field(50034; "Vendor Type"; enum "Vendor Type")
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 END 11082023 - Do not change the field ID


        //Vy++ because of transfer field error use below range
        field(50201; "Third Party Shipping"; Boolean)
        {
            Caption = 'Third Party Shipping';
            DataClassification = CustomerContent;
        }
        field(50202; "Third Party Shipping Acc. No."; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Third Party Shipping Acc. No.';
        }
        field(50203; "Purchasing Code"; Code[10])
        {
            Caption = 'Purchasing Code';
            TableRelation = Purchasing;
        }
        field(50204; "Account Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Billing Email';
        }
        field(50205; "Artwork Approved"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Artwork Approved';
        }
        field(50207; "VendorTypes"; code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Type"."Vendor code";

        }
        //>>PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50208; "QuickBook ID"; Code[100])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 15th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 26th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50209; "QuickBook Error"; Text[2048])
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 26th Nov 2024 -- Field Added to map QuickBook ID to BC
        //>>PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50210; "QuickBook Sync Failed"; Boolean)
        {
            //TableRelation = Location.Code;
        }
        //<<PW MR 27th Nov 2024 -- Field Added to map QuickBook ID to BC
        field(50052; "Do not sync to QB"; Boolean)
        {
            //TableRelation = Location.Code;
        }


    }

    var
        myInt: Integer;
}