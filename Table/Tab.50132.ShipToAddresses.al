// table 50132 "Ship To Address Custom"
// {
//     DataClassification = ToBeClassified;
//     // ObsoleteState = Removed;

//     fields
//     {


//         field(1; "Item No"; Code[10])
//         {

//             TableRelation = Item."No.";
//         }
//         field(2; "Variant Code"; Code[10])
//         {
//             Caption = 'Variant Code';
//             TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Item No"));
//         }

//         field(3; "Ship-to Code"; Code[10])
//         {
//             Caption = 'Ship-to Code';
//             //  TableRelation = "Ship-to Address".Code WHERE("Customer No." = FIELD("Sell-to Customer No."));
//         }
//         field(4; "Ship-to Name"; Text[100])
//         {
//             Caption = 'First Name, Last Name';
//         }
//         field(5; "Ship-to Name 2"; Text[50])
//         {
//             Caption = 'Company Name';
//         }
//         field(6; "Ship-to Address"; Text[100])
//         {
//             Caption = 'Ship-to Address';
//         }
//         field(7; "Ship-to Address 2"; Text[50])
//         {
//             Caption = 'Ship-to Address 2';
//         }
//         field(8; "Ship-to City"; Text[30])
//         {
//             Caption = 'Ship-to City';
//             TableRelation = IF ("Ship-to Country/Region Code" = CONST('')) "Post Code".City
//             ELSE
//             IF ("Ship-to Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Ship-to Country/Region Code"));

//         }

//         field(9; "Ship-to County"; Text[30])
//         {
//             CaptionClass = '5,1,' + "Ship-to Country/Region Code";
//             Caption = 'Ship-to County';
//         }
//         field(10; "Ship-to Country/Region Code"; Code[10])
//         {
//             Caption = 'Ship-to Country/Region Code';
//             TableRelation = "Country/Region";
//         }
//         field(11; "Ship-to Post Code"; Code[20])
//         {
//             Caption = 'Ship-to Post Code';
//             TableRelation = IF ("Ship-to Country/Region Code" = CONST('')) "Post Code"
//             ELSE
//             IF ("Ship-to Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Ship-to Country/Region Code"));

//             ValidateTableRelation = false;

//         }
//         field(12; "Ship-to Contact"; Text[100])
//         {
//             Caption = 'Ship-to Contact';
//         }
//         field(13; "Document No"; Code[20])
//         {

//             TableRelation = Item."No.";
//         }

//     }

//     keys
//     {
//         key(PK; "Item No", "Ship-to Code")
//         {
//             Clustered = true;
//         }

//     }
//     fieldgroups
//     {
//         fieldgroup(Dropdown; "Document No", "Item No") { }


//     }


//     var
//         myInt: Integer;
//         PostCode: Record "Post Code";

//     trigger OnInsert()
//     begin

//     end;

//     trigger OnModify()
//     begin

//     end;

//     trigger OnDelete()
//     begin

//     end;

//     trigger OnRename()
//     begin

//     end;

// }