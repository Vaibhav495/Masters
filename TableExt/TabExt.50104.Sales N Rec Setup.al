tableextension 50104 TabExSalesRecSetup extends "Sales & Receivables Setup"
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
            //TableRelation = "G/L Account"."No.";
            TableRelation = Item."No.";//Manish
        }
        field(50012; "Shipment Handling Charge"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "Charges Acc No."; Code[20])
        {

            DataClassification = ToBeClassified;
            //TableRelation = "G/L Account"."No.";
            TableRelation = Item."No.";//Manish
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
        field(50039; "Third Party Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50040; "PMS Charge"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        // Added by Nikhil 16-02-2023 For UPS address validation API +++
        field(50041; "UPS Address URL"; Text[500])
        {
            DataClassification = ToBeClassified;

        }
        field(50080; "UPS Access License Number"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50081; "UPS User ID"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50082; "UPS Password"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        // Added by Nikhil 16-02-2023 For UPS address validation API ---


        //Added by VY for sinature+++
        field(50083; "Sales Signature"; Blob)
        {
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(50084; "Artwork Signature"; Blob)
        {
            DataClassification = ToBeClassified;
            Subtype = Bitmap;

        }
        field(50085; "Orders Signature"; Blob)
        {
            DataClassification = ToBeClassified;
            Subtype = Bitmap;

        }
        field(50086; "Purchase Signature"; Blob)
        {
            DataClassification = ToBeClassified;
            Subtype = Bitmap;

        }
        field(50087; "Accounting Signature"; Blob)
        {
            DataClassification = ToBeClassified;
            Subtype = Bitmap;

        }
        field(50088; "ShipToAddressSplit"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        //Added by VY for sinature---

        //Auto Update when customer created+++
        field(50089; "Same As BilltoCustomer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50090; "Customer Posting Group"; Code[20])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
        field(50091; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }

        field(50092; "Rush %"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50093; "Super Rush %"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        //Auto Update when customer created---
        // PW NG 1.0 08082023 START - PROMO Inventory API from vendors
        field(50094; "Promo standard API"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(50095; "Promo standard id"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50096; "Promo standard password"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50097; "Promo standard version"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50098; "Display Promo JSON"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 08082023 END - PROMO Inventory API from vendors

        // PW NG 1.0 11082023 START - Customer Integration Web to BC
        field(50099; "Enable Web Service Log"; Boolean)
        {
            Caption = 'Enable Web Service Log';
            DataClassification = CustomerContent;
        }
        // PW NG 1.0 11082023 START - Customer Integration Web to BC
        // PW NG 1.0 11082023 START - Customer Integration Web to BC

        field(50100; "Customer Token API"; Text[500])
        {
            Caption = 'Customer Token API';
            DataClassification = CustomerContent;
        }
        field(50101; "Customer Token UserName"; Text[250])
        {
            Caption = 'Customer Token UserName';
            DataClassification = CustomerContent;
        }
        field(50102; "Customer Token Password"; Text[250])
        {
            Caption = 'Customer Token Password';
            DataClassification = CustomerContent;
        }
        field(50103; "Customer Sync API"; Text[500])
        {
            Caption = 'Customer Sync API';
            DataClassification = CustomerContent;
        }
        field(50104; "Customer Sync WebsiteGuid"; Text[250])
        {
            Caption = 'Customer Sync WebsiteGuid';
            DataClassification = CustomerContent;
        }
        field(50105; "Customer Sync LanguageGuid"; Text[250])
        {
            Caption = 'Customer Sync LanguageGuid';
            DataClassification = CustomerContent;
        }
        // PW NG 1.0 11082023 END - Customer Integration Web to BC

        field(50106; "Order on Hold"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Order Status";
        }
        field(50107; "Ready For Production"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Order Status";
        }
        field(50108; "Order Received"; code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Order Status";
        }
        field(50109; "SO Cancelled"; code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Order Status";
        }
        field(50110; "Credit On Hold"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Order Status";
        }
        field(50111; "Release From Order On Hold"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Order Status";
        }
        field(50112; "Display UPS Address JSON"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50113; "web Cust GenBusPostingGroup"; Code[20])
        {
            Caption = 'web Customer Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(50114; "web Customer Posting Group"; Code[20])
        {
            Caption = 'web Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
        field(50115; "Website Link"; Text[500])
        {
            // Caption = 'Customer Token API';
            DataClassification = CustomerContent;
        }

        field(50116; "Display Customer JSON"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50117; "Rush Sales Price %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50118; "Super Rush Sales Price %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50119; "GenProdPosting Group for Item"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group for Item';
            TableRelation = "Gen. Product Posting Group";
        }
        field(50120; "BUOM"; Code[20])
        {
            Caption = 'Base UOM for item';
            TableRelation = "Unit of Measure";
        }
        field(50121; "Station Master Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(50122; "Payment Link"; Text[500])
        {

            DataClassification = CustomerContent;
        }
        field(50123; "Web Payment Batch"; Code[50])
        {
            Caption = 'Web Payment Batch';
            //  TableRelation = "Unit of Measure";
        }
        field(50124; "Display Production Json"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50125; "Enable Charge Sequence"; Boolean)
        {
            Caption = 'Enable Charge Sequence';
            DataClassification = ToBeClassified;
        }
        field(50126; "PrePOSample Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50127; "AutoInvoiceforsample"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50128; "Sample Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50129; "iID Shipping Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50130; "Sample Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        // PW NG 1.0 04072024 Product Integration >>>
        field(50131; "Item Sync API"; Text[500])
        {
            Caption = 'Item Sync API';
            DataClassification = ToBeClassified;
        }
        field(50132; "Item WebsiteGuid"; Text[100])
        {
            Caption = 'Item WebsiteGuid';
            DataClassification = ToBeClassified;
        }
        field(50133; "Item LanguageGuid"; Text[100])
        {
            Caption = 'Item LanguageGuid';
            DataClassification = ToBeClassified;
        }
        field(50134; "Item Currencyguid"; Text[100])
        {
            Caption = 'Item Currencyguid';
            DataClassification = ToBeClassified;
        }
        field(50135; "Item Json"; Boolean)
        {
            Caption = 'Item Json';
            DataClassification = ToBeClassified;
        }
        // PW NG 1.0 04072024 Product Integration <<<
        field(50136; "PayFabric API"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }

        field(50137; "OAuth Client ID"; Text[100])
        {
            DataClassification = CustomerContent;
            CaptionML = ENU = 'OAuth Clinet ID';
        }
        field(50138; "OAuth Client Secret"; Text[100])
        {
            DataClassification = CustomerContent;
            CaptionML = ENU = 'OAuth Clinet Secret';
        }
        field(50213; "OAuth AAD Tenant ID"; Text[100])
        {
            DataClassification = CustomerContent;
            CaptionML = ENU = 'OAuth AAD Tenant ID';
        }
        //>>
        field(50214; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name(Temp)';
            TableRelation = "Item Journal Template";
        }
        field(50215; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name(Temp)';
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field("Journal Template Name"));
        }
        field(50216; "Temp Location Code"; Code[10])
        {
            Caption = 'Temp Location Code';
            TableRelation = Location;
        }
        field(50217; "Sample Location Code"; Code[10])
        {
            Caption = 'Sample Location Code';
            TableRelation = Location;
        }
        field(50218; "Journal Template Name Sample"; Code[10])
        {
            Caption = 'Journal Template Name(Sample)';
            TableRelation = "Item Journal Template";
        }

        field(50219; "Journal Batch Name Sample"; Code[10])
        {
            Caption = 'Journal Batch Name(Sample)';
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field("Journal Template Name Sample"));
        }

        field(50220; "Zone Code Sample"; Code[10])
        {
            Caption = 'Zone Code Sample';
            TableRelation = Zone.Code where("Location Code" = field("Sample Location Code"));
        }
        field(50221; "Bin Code Sample"; Code[20])
        {
            Caption = 'Bin Code Sample';
            TableRelation = if ("Zone Code Sample" = filter('')) Bin.Code where("Location Code" = field("Sample Location Code"))
            else
            if ("Zone Code Sample" = filter(<> '')) Bin.Code where("Location Code" = field("Sample Location Code"),
                                                                               "Zone Code" = field("Zone Code Sample"));
        }
        field(50222; "Zone Code Temp"; Code[10])
        {
            Caption = 'Zone Code Temp';
            TableRelation = Zone.Code where("Location Code" = field("Temp Location Code"));
        }
        field(50223; "Bin Code Temp"; Code[20])
        {
            Caption = 'Bin Code Temp';
            TableRelation = if ("Zone Code Temp" = filter('')) Bin.Code where("Location Code" = field("Temp Location Code"))
            else
            if ("Zone Code Temp" = filter(<> '')) Bin.Code where("Location Code" = field("Temp Location Code"),
                                                                               "Zone Code" = field("Zone Code Temp"));
        }
        field(50224; "Journal Template Name IID"; Code[10])
        {
            Caption = 'Journal Template Name(IID)';
            TableRelation = "Item Journal Template";
        }

        field(50225; "Journal Batch Name IID"; Code[10])
        {
            Caption = 'Journal Batch Name(IID)';
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field("Journal Template Name IID"));
        }
        field(50226; "Order on Hold API"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(50227; "Inventory Posting Group"; Code[20])
        {
            Caption = 'Inventory Posting Group';
            TableRelation = "Inventory Posting Group";
            //<<
        }
        field(50228; "Production Portal URL"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50229; "Enable File Attachment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50230; "Prepro Sample Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(50231; "DashboardLogin Mail Body"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50232; "GeneralInfo Mail Body"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50233; "Events Mail Body"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50234; "AboutUS Mail Body"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50235; "ArtworkInfo Mail Body"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50236; "StockArts Mail Body"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50237; "FAQ Mail Body"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50238; "Edit before Invoice"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50329; "Tracking Email CC"; Text[80])
        {
            DataClassification = ToBeClassified;
        }

        field(50239; "Integration Log No"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(50240; "Modify TrackingtoWebex"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50241; "Security Token API"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Security Token API';
        }
        field(50242; "Security Token UserID"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Security Token UserID';
        }
        field(50243; "Security Token Password"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Security Token Password';
        }
        field(50244; "Disable ItemSynch Validation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(50245; "RTIC Vendor"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Vendor."No.";
        }
        field(50246; "BP Vendor"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Vendor."No.";
        }
        field(50247; "RTIC API"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'RTIC API';
        }
        field(50248; "RTIC Key"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'RTIC Key';
        }
    }


}