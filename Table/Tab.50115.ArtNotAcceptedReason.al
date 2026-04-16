table 50115 "Art Not Acepted Reason"
{
    DataClassification = CustomerContent;
    Caption = 'Art Not Acepted Reason';

    fields
    {
        field(1; Code; Code[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';

        }
        field(2; Details; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Details';

        }
        Field(3; "Detail Continue"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Detail Continue';

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