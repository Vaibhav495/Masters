tableextension 50104 TabExt50603 extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "Fedex Freight Charge URL"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "USPS Freight Charge URL"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "R&L Freight Charge URL"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "YRC Freight Charge URL"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        // Field(50004; "AZ Location Code"; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = Location.Code;

        // }
        Field(50005; "IL Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        Field(50006; "Shipping Access Key"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "LQR Same Day Charge Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";
        }
        field(50008; "LQR Same Day Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Additional Shipping Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Freight Charges URL"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Shipping Charge Acc No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Shipment Handling Charge"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "Charges Acc No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Rush Same Day Charge Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";
        }
        field(50015; "Rush Same Day Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50016; "Rush 1 Day Charge Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";
        }
        field(50017; "Rush 1 Day Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "Rush 2 Day Charge Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";
        }
        field(50019; "Rush 2 Day Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Rush 3 Day Charge Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";
        }
        field(50021; "Rush 3 Day Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Rush 4 Day Charge Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";
        }
        field(50023; "Rush 4 Day Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50024; "Large Quantity Threshold"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "LQR 1 Day Charge Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";
        }
        field(50026; "LQR 2 Day Charge Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";
        }
        field(50027; "LQR 3 Day Charge Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";
        }
        field(50028; "LQR 4-9 Day Charge Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";
        }
        field(50029; "LQR 1 Day Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50030; "LQR 2 Day Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50031; "LQR 3 Day Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50032; "LQR 4-9 Day Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50033; "Less Than Min Charge Code"; code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";
        }
        field(50034; "Less Than Min Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50035; "Split Charge Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";
        }
        field(50036; "Split Charge Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(50037; "Pre-Pro. Charge Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge"."No.";
        }
        field(50038; "Pre-Pro. Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }

    var
        myInt: Integer;
}