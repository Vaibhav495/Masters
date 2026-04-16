table 50306 "Artist Name"
{

    LookupPageId = "Artist Name";
    DrillDownPageId = "Artist Name";
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Code[100])
        {
            DataClassification = CustomerContent;

        }

    }
    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }
    }

}
