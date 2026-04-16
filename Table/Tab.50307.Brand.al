table 50307 Brand
{

    LookupPageId = Brand;
    DrillDownPageId = Brand;
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[100])
        {
            DataClassification = CustomerContent;
        }
        field(2; Description; Code[2048])
        {
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

}
