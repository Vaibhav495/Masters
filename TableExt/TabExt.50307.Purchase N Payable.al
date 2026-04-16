tableextension 50307 PurchnPAYExt extends "Purchases & Payables Setup"
{
    fields
    {

        field(50000; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = if ("Zone Code" = filter('')) Bin.Code where("Location Code" = field("Location Code"))
            else
            if ("Zone Code" = filter(<> '')) Bin.Code where("Location Code" = field("Location Code"),
                                                            "Zone Code" = field("Zone Code"));

        }
        field(50001; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            TableRelation = Zone.Code where("Location Code" = field("Location Code"));


        }
        field(50002; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location.Code;
        }

        field(50003; "SAMPLE Bin Code"; Code[20])
        {
            Caption = 'SAMPLE Bin Code';
            TableRelation = if ("SAMPLE Zone Code" = filter('')) Bin.Code where("Location Code" = field("SAMPLE Location Code"))
            else
            if ("SAMPLE Zone Code" = filter(<> '')) Bin.Code where("Location Code" = field("SAMPLE Location Code"),
                                                            "Zone Code" = field("SAMPLE Zone Code"));

        }
        field(50004; "SAMPLE Zone Code"; Code[10])
        {
            Caption = 'SAMPLE Zone Code';
            TableRelation = Zone.Code where("Location Code" = field("SAMPLE Location Code"));


        }
        field(50005; "SAMPLE Location Code"; Code[10])
        {
            Caption = 'SAMPLE Location Code';
            TableRelation = Location.Code;
        }

        field(50006; "WebEx Sync"; boolean)
        {
            Caption = 'WebEx Sync';
            DataClassification = ToBeClassified;
        }
        field(50007; "Skip Cancel Status"; boolean)
        {

            DataClassification = ToBeClassified;
        }

        field(50008; "Disable vendor/Item Editing"; boolean)
        {

            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}