table 50117 ArtOrderStatus
{
    Caption = 'Art Order Status';
    DataClassification = CustomerContent;
    DrillDownPageId = ArtOrderStatusList;
    LookupPageId = ArtOrderStatusList;
    fields
    {
        field(1; "Status Code"; Code[50])
        {
            Caption = 'Status Code';
            DataClassification = CustomerContent;
        }
        field(2; Status; Text[100])
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Status Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Status Code", Status)
        { }
    }


}
