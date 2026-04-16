tableextension 50113 ExtendsUserSetup extends "User Setup"
{
    fields
    {
        field(50100; "Visible factboxes"; Boolean)
        {
            Caption = 'Visible factboxes';
            DataClassification = CustomerContent;
        }
        field(50101; "Cancel SO"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50102; "Delete Permission"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50103; "Allow Payment"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50104; "Credit hold Permision"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50105; "Artist User"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50106; "Edit Vendor/Item"; Boolean)
        {
            DataClassification = CustomerContent;
        }

    }
}
