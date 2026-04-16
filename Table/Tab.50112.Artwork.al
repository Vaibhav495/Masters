table 50112 Artwork
{
    DataClassification = CustomerContent;
    Caption = 'Artwork';

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Document Type';

        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
        }
        field(3; "Document Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Document Line No.';
        }
        field(4; "Art ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Art ID';

        }

        field(5; "Art Options"; Enum ArtOptions)
        {
            DataClassification = CustomerContent;
            Caption = 'Art Options';
        }
        field(6; "Proof Required"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Required';
        }
        field(7; "Requested Art 1"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Requested Art 1';
        }
        field(8; "Requested Art 2"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Requested Art 2';
        }
        field(9; "Requested Art 3"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Requested Art 3';
        }
        field(10; "Requested Art 4"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Requested Art 4';
        }
        field(11; "Requested Art 5"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Requested Art 5';
        }
        field(12; "Requested Art 6"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Requested Art 6';
        }
        field(13; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item."No.";
            Editable = false;
            Caption = 'Item No.';
        }
        field(14; Status; Enum ArtStatusOptions)
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
            trigger OnValidate()
            var
                SLine: Record "Sales Line";
                Artwork: Record Artwork;
                Notapprove: Boolean;
                SalesH: Record "Sales Header";
            begin
                if Rec.Status::" " <> Rec.Status::" " then
                    ArtWorkCurrentStatus(Rec);

                // IF (Status = Status::"Customer Rejected Paper Proof") THEN BEGIN
                //     Rec."Sent To QA" := false;
                //     Rec."Proof awaiting Cust Approval" := False;
                //     rec."No. of Rework" := Rec."No. of Rework" + 1;
                //     OnafterCustomerRejectedProof(Rec);

                //     SLine.Reset();
                //     SLine.SetRange(SLine."Document No.", "Document No.");
                //     SLine.SetRange(SLine.Type, SLine.Type::Item);
                //     SLine.SetRange(SLine."Line No.", "Document Line No.");
                //     IF SLine.FindFirst() THEN BEGIN
                //         SLine.validate("Customer Approved", false);
                //         SLine.Modify(false);
                //     END;
                // END;

                SalesH.Reset();
                SalesH.SetRange("Document Type", Rec."Document Type");
                salesH.SetRange("No.", Rec."Document No.");
                if SalesH.FindFirst() then;
                IF (Status = Status::"Customer Approved Paper Proof") OR (Status = Status::"Customer Approved Paper Proof with Suggestions") OR (Status = Status::"Proof Internally Approved") THEN //BEGIN
                    if (Not SalesH."Payment Bucket Filter") then begin//Net terms
                        Rec."Proof Approved" := true;
                        Rec."Proof awaiting Cust Approval" := false;
                        Rec."Move to In Prodcution" := true;//Ready for production once approved
                                                            //   Rec."Ready to Pick" := true;//MR
                        Rec."Proof Rejected" := false;
                        // PW NG 1.0 04062024 - •	If proof is internally approved vendor wise still unable to create PO and giving a pop up as should approve proof to create PO. >>>
                        Rec."Proof Status 1" := Artwork."Proof Status 1"::Approved;
                        Rec."Proof Status DateTime1" := CurrentDateTime;
                        Rec."Proof Rejected by 1" := UserId;
                        Evaluate(Rec."Proof 1 Date Time", Format(CurrentDateTime));
                        // PW NG 1.0 04062024 - •	If proof is internally approved vendor wise still unable to create PO and giving a pop up as should approve proof to create PO. <<<
                    end else //begin
                        if (SalesH."Payment Entry Posted") then begin
                            Rec."Proof Approved" := true;
                            Rec."Proof awaiting Cust Approval" := false;
                            Rec."Move to In Prodcution" := true;//Ready for production once approved
                                                                //  Rec."Ready to Pick" := true;//MR
                            Rec."Proof Rejected" := false;
                            // PW NG 1.0 04062024 - •	If proof is internally approved vendor wise still unable to create PO and giving a pop up as should approve proof to create PO. >>>
                            Rec."Proof Status 1" := Artwork."Proof Status 1"::Approved;
                            Rec."Proof Status DateTime1" := CurrentDateTime;
                            Rec."Proof Rejected by 1" := UserId;
                            Evaluate(Rec."Proof 1 Date Time", Format(CurrentDateTime));
                            // PW NG 1.0 04062024 - •	If proof is internally approved vendor wise still unable to create PO and giving a pop up as should approve proof to create PO. <<<
                        end else begin
                            Rec."Proof Approved" := true;
                            Rec."Proof awaiting Cust Approval" := false;
                            // PW NG 1.0 04062024 - •	If proof is internally approved vendor wise still unable to create PO and giving a pop up as should approve proof to create PO. >>>
                            Rec."Proof Status 1" := Artwork."Proof Status 1"::Approved;
                            Rec."Proof Status DateTime1" := CurrentDateTime;
                            Rec."Proof Rejected by 1" := UserId;
                            Evaluate(Rec."Proof 1 Date Time", Format(CurrentDateTime));
                            // PW NG 1.0 04062024 - •	If proof is internally approved vendor wise still unable to create PO and giving a pop up as should approve proof to create PO. <<<
                        end;
                //end;
                // SLine.Reset();
                // SLine.SetRange(SLine."Document No.", "Document No.");
                // SLine.SetRange(SLine.Type, SLine.Type::Item);
                // SLine.SetRange(SLine."Line No.", "Document Line No.");
                // IF SLine.FindFirst() THEN BEGIN
                //     SLine.validate("Customer Approved", true);
                //     OnafterCustomerApprovedProof(Rec, SLine);
                //     SLine.Modify(false);
                // END;


                // END;
                If (Status = Status::"Awaiting Customer Proof") then
                    OnafterSentProofApproval(Rec);

                If (Status = Status::"QA Rejected Paper Proof") then
                    OnafterQARejectedProof(Rec);

            end;
        }
        field(15; GUID; Guid)
        {
            DataClassification = CustomerContent;
            Caption = 'GUID';
        }
        field(16; "Approval URL"; Text[1000])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = URL;
            Caption = 'Approval URL';
        }
        field(17; "Proof Image"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image';
        }
        field(18; "Proof Pdf"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf';
        }
        field(19; "Internal Comments"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Internal Comments';

        }
        field(20; "Primary Key"; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
            Editable = true;
            Caption = 'Primary Key';
        }
        field(21; "Proof Image Upload"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image Upload';
        }
        field(22; "Proof Pdf Upload"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf Upload';
        }
        field(23; "Customer Comment"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Comment';
        }
        field(24; "Proof Sent DateTime"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Sent DateTime';
        }
        field(25; "Approved by Signature"; text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Approved by Signature';
        }
        field(26; "No. of Rework"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'No. of Rework';
        }
        field(27; "Comments for customer"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Comments for customer';
        }
        field(28; "Sent To QA"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Sent To QA';
        }
        field(29; "PDF Stream"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'PDF Stream';
        }
        field(30; "Image Stream"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Image Stream';
        }
        field(31; "Assorted Order"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Assorted Order';
        }
        field(32; "Split Order"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Split Order';
        }
        field(33; "Artwork Missing"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Artwork Missing';
        }
        field(34; "Art not Managable"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Art not Managable';
        }
        field(35; "Proof Approved Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Approved Date';
        }
        field(36; "Proof Approved Time"; Time)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Approved Time';
        }
        field(37; "Proof Rejected"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Rejected';
        }
        field(38; "Customer No."; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
        }
        field(39; "Customer Name"; Text[80])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Name';
        }
        field(40; "External Document No."; Code[35])
        {
            DataClassification = CustomerContent;
            Caption = 'External Document No.';
        }
        field(41; "Art Not Acceptable"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Art Not Acceptable';
        }
        field(42; "Proof Approved"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Approved';
        }
        field(43; "Proof awaiting Cust Approval"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof awaiting Cust Approval';
        }
        field(44; Contact; Text[1024])
        {
            DataClassification = CustomerContent;
            Caption = 'Contact';
        }
        field(45; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';
        }
        field(46; "Order Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Order Date';
        }
        field(47; "Due Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Due Date';
        }
        field(48; "Requested Delivery Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Requested Delivery Date';
        }
        field(49; "Customer PO#"; Code[35])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer PO#';
        }
        field(50; Type; enum "Sales Line Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
        }
        field(51; "Quantity"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(52; "Description"; Text[1024])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }

        field(53; "Rush Order"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Rush Order';
        }
        field(54; "Art Image Stream 1"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Art Image Stream 1';
        }
        field(55; "Art Image Stream 2"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Art Image Stream 2';
        }

        field(56; "Art Image Stream 3"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Art Image Stream 3';
        }
        field(57; "Art Image Stream 4"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Art Image Stream 4';
        }
        field(58; "Art Image Stream 5"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Art Image Stream 5';
        }
        field(59; "In Production"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'In Production';
            trigger OnValidate()
            begin
                if rec."In Production" then
                    OnAfterSendinProduction(Rec);
            end;
        }
        field(60; "Imprint Method"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Imprint Method";
            Caption = 'Imprint Method';
        }
        field(61; "Assigned To"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
            Caption = 'Assigned To';
        }

        field(62; "Proof Sent Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Sent Date';
        }
        field(63; "On Hold For Production"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'On Hold For Production';
        }
        field(64; "Customer Approved"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Approved';
        }
        field(65; "IP Address"; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'IP Address';
        }
        field(66; "Instruction For Artist"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Instruction For Artist';
        }

        field(67; "Art Not Accepted Reason"; Code[100])
        {
            DataClassification = CustomerContent;
            TableRelation = "Art Not Acepted Reason".code;
            Caption = 'Art Not Accepted Reason';
        }
        field(68; "In Hand Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'In-Hand Date';
        }
        field(69; "Shipment Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Shipment Date';
        }
        field(70; "QC Comments"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'QC Comments';
        }
        field(71; "Cancelled Order"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Cancelled Order';
        }
        field(72; "Imprint Phrase"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Imprint Phrase';
        }

        field(73; "Proof Image Upload 2"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image Upload 2';
        }
        field(74; "Proof Pdf Upload 2"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf Upload 2';
        }
        field(75; "Proof Image Upload 3"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image Upload 3';
        }
        field(76; "Proof Pdf Upload 3"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf Upload 3';
        }
        field(77; "Proof Image Upload 4"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image Upload 4';
        }
        field(78; "Proof Pdf Upload 4"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf Upload 4';
        }
        field(79; "PDF Stream 2"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'PDF Stream 2';
        }
        field(80; "Image Stream 2"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Image Stream 2';
        }
        field(81; "PDF Stream 3"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'PDF Stream 3';
        }
        field(82; "Image Stream 3"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Image Stream 3';
        }
        field(83; "PDF Stream 4"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'PDF Stream 4';
        }
        field(84; "Image Stream 4"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Image Stream 4';
        }
        field(85; "Proof Image 2"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image 2';
        }
        field(86; "Proof Pdf 2"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf 2';
        }
        field(87; "Proof Image 3"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image 3';
        }
        field(88; "Proof Pdf 3"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf 3';
        }
        field(89; "Proof Image 4"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image 4';
        }
        field(90; "Proof Pdf 4"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf 4';
        }
        field(91; Composition; Enum Compositions)
        {
            DataClassification = CustomerContent;
            Caption = 'Composite';
        }
        field(92; "Total No. Of Location"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Imprint Details" where("Art ID" = field("Art ID")));
            Caption = 'Total No. Of Location';
        }
        field(93; "Composition Instruction"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Composition Instruction';
        }
        field(94; "Vinyl Instruction"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Vinyl Instruction';
        }
        field(95; "Approval Required"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Approval Required';
        }

        field(96; "Proof Status 1"; Enum "Proof Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status 1';
            // trigger OnValidate()
            // begin
            //     if Rec."Proof Status 1" = Rec."Proof Status 1"::Rejected then begin
            //         Clear("Proof Image");
            //         Clear("Proof Pdf");
            //     end;
            // end;
        }
        field(97; "Proof Status 2"; Enum "Proof Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status 2';
            // trigger OnValidate()
            // begin
            //     if Rec."Proof Status 2" = Rec."Proof Status 2"::Rejected then begin
            //         Clear("Proof Image 2");
            //         Clear("Proof Pdf");
            //     end;
            // end;
        }
        field(98; "Proof Status 3"; Enum "Proof Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status 3';
            // trigger OnValidate()
            // begin
            //     if Rec."Proof Status 3" = Rec."Proof Status 3"::Rejected then begin
            //         Clear("Proof Image 3");
            //         Clear("Proof Pdf");
            //     end;
            // end;
        }
        field(99; "Proof Status DateTime1"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status DateTime1';
        }
        field(100; "Proof Status DateTime2"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status DateTime2';
        }
        field(101; "Proof Status DateTime3"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status DateTime3';
        }
        field(102; "Proof Status Comment 1"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status Comment 1';
        }
        field(103; "Proof Status Comment 2"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status Comment 2';
        }
        field(104; "Proof Status Comment 3"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status Comment 3';
        }

        field(105; "Other Document 1"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Other Document 1';
        }
        field(106; "Other Document 2"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Other Document 2';
        }

        field(107; "Other Document 3"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Other Document 3';
        }
        field(108; "Other Document 4"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Other Document 4';
        }
        field(109; "Other Document 5"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Other Document 5';
        }
        field(110; "Large Order"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Large Order';
        }
        field(111; "Artwork Uploaded"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Artwork Uploaded';
        }
        field(112; "Sent To QC 1"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Sent To QC 1';
        }
        Field(113; "Sent to QC 2"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Sent to QC 2';
        }
        Field(114; Screen; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Screen';
        }
        Field(115; "Factory Ink"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Factory Ink';
        }
        Field(116; Fabric; code[250])
        {
            DataClassification = CustomerContent;
            TableRelation = Fabric;
            Caption = 'Fabric';
        }
        Field(117; Course; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Course';
        }
        Field(118; Blank; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Blank';
        }
        Field(120; "Proof Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Date';
        }
        field(121; "Variant Code"; code[100])
        {
            DataClassification = CustomerContent;
            //  TableRelation = "Item Variant".Code;
            Editable = false;
            Caption = 'Product Colors';
        }
        field(122; "Credit On Hold"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Credit On Hold';
        }
        field(123; "Order On Hold"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Order On Hold';
        }
        field(124; "Pre flight"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Pre flight';
        }
        field(125; "Move to In Prodcution"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Move to In Prodcution';
        }
        field(126; "Completely Shipped"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Completely Shipped';
        }
        field(127; "Production Location"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Prod. Location';
            TableRelation = Location;
        }
        field(128; "Previous Order"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Previous Order #';
        }
        field(129; "Previous Screen1"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Previous Screen #1';
        }
        field(130; "Previous Screen2"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Previous Screen #2';
        }
        field(131; "Note To Customer"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Note To Customer';
        }
        field(132; "CustomeerReject"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'CustomeerReject';
        }
        field(133; "Composite Production Upload"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Composite Production Upload';
        }
        field(134; "Composite Production Stream"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Composite Production Upload Stream';
        }
        field(135; "Artwork Variable"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Variable data';
        }
        field(136; "Artwork Deatils File"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Artwork Details File';
        }
        field(137; "Art File"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Art File';
        }
        field(138; "Sent To Art"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Sent To Art';
        }
        field(139; "Amount"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Redraw Amount';
        }
        field(140; "Other Document Blob 1"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Other Document Blob 1';
        }
        field(141; "Other Document Blob 2"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Other Document Blob 2';
        }
        field(142; "Other Document Blob 3"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Other Document Blob 3';
        }

        field(143; "Other Document Blob 4"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Other Document Blob 4';
        }
        field(144; "Other Document Blob 5"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Other Document Blob 5';
        }
        field(145; "Art Problem PDF"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Art Problem PDF';
        }
        field(146; "Art Problem PDF Blob"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Art Problem PDF Blob';
        }
        field(147; "Disable First QC"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Disable First QC';
        }
        field(148; "Imprint Options"; Code[80])
        {
            DataClassification = ToBeClassified;
            TableRelation = Imprint_Options.code;
        }
        field(149; "Imprint Location"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(150; "Item Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Item Category".Code;

        }
        field(151; "Item sub Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            //   TableRelation = "Item Category".Code where("Parent Category" = field("Item Category"));

        }
        field(152; "Item sub sub Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Item Category".Code where("Parent Category" = field("Item sub Category"));

        }
        field(153; "Super Rush Order"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Super Rush Order';
        }
        field(154; "Quote Converted To Order"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Quote Converted To Order';
        }
        field(155; "Proof 1 Date Time"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Poof 1 Date Time';
        }
        field(156; "Proof 2 Date Time"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Poof 2 Date Time';
        }
        field(157; "Proof 3 Date Time"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Poof 3 Date Time';
        }
        field(158; "Item_Type"; Enum ItemType)
        {
            DataClassification = ToBeClassified;

        }
        field(159; "PO No"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(160; "ART Upload Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'ART Upload Date';
        }
        // Added by Nikhil 08-02-2022 for JIRA ID EI-115 +++
        field(161; "Proof Image 5"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image 5';
        }
        field(162; "Proof Pdf 5"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf 5';
        }
        field(163; "Proof Image Upload 5"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Image Upload 5';
        }
        field(164; "Proof Pdf Upload 5"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Pdf Upload 5';
        }
        field(165; "Proof Status 4"; Enum "Proof Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status 4';
            // trigger OnValidate()
            // begin
            //     if Rec."Proof Status 4" = Rec."Proof Status 4"::Rejected then begin
            //         Clear("Proof Image 4");
            //         Clear("Proof Pdf 4");
            //     end;
            // end;
        }
        field(166; "Proof Status 5"; Enum "Proof Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status 5';
            // trigger OnValidate()
            // begin
            //     if Rec."Proof Status 5" = Rec."Proof Status 5"::Rejected then begin
            //         Clear("Proof Image 5");
            //         Clear("Proof Pdf 5");
            //     end;
            // end;
        }
        field(167; "Proof Status DateTime4"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status Date Time 4';
        }
        field(168; "Proof Status DateTime5"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status Date Time 5';
        }
        field(169; "Proof 4 Date Time"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Poof 4 Date Time';
        }
        field(170; "Proof 5 Date Time"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Poof 5 Date Time';
        }
        field(171; "PDF Stream 5"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'PDF Stream 5';
        }
        field(172; "Image Stream 5"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Image Stream 5';
        }
        field(173; "Proof Status Comment 4"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status Comment 4';
        }
        field(174; "Proof Status Comment 5"; Text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Status Comment 5';
        }
        // Added by Nikhil 08-02-2022 for JIRA ID EI-115 +++

        field(175; "To Print Blob"; Blob)
        {
            DataClassification = CustomerContent;

        }
        field(176; "Font Style Blob"; Blob)
        {
            DataClassification = CustomerContent;

        }
        field(177; "Attachments Blob"; Blob)
        {
            DataClassification = CustomerContent;

        }
        field(178; "Additional Options Blob"; Blob)
        {
            DataClassification = CustomerContent;

        }
        field(179; "Upload PO Blob"; Blob)
        {
            DataClassification = CustomerContent;

        }
        field(180; "To Print"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Text Font';
        }
        field(181; "Font Style"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Font Style';
        }
        field(182; "Attachments"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Attachments';
        }
        field(183; "Additional Options"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Additional Options';
        }
        field(184; "Upload PO"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Upload PO';
        }
        field(185; "Size"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Size';
        }
        field(186; "Size Blob"; Blob)
        {
            DataClassification = CustomerContent;
        }
        field(187; "Lanyard Quantity"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Lanyard Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(188; "Lanyard Width"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Lanyard Width';
        }
        field(189; "Lanyard Desciption"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Lanyard Desciption';
        }
        field(190; "From Web Approval"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'From Web Approval';
        }
        field(191; "Vendor_Type"; code[100])
        {
            DataClassification = ToBeClassified;
            //     TableRelation = "Vendor Type"."Vendor code";
        }
        field(192; "Vendor No"; Code[80])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Line"."Buy-from Vendor No." where("No." = Field("Item No."), "Line No." = field("Document Line No."), "Document No." = field("Document No.")));
        }
        field(193; "Art Image Stream 6"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Art Image Stream 5';
        }
        field(194; "Back Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(195; "Item Shipped"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(196; Order_Type; Option)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header".Order_Type where("Document Type" = field("Document Type"), "No." = field("Document No.")));
            CaptionML = ENU = 'Order Type';
            OptionCaptionML = ENU = 'Standard,Urgent Order,Super Urgent Order';
            OptionMembers = "Standard","Rush Order","Super Rush Order";

        }
        field(198; "Upload Rejected Stream"; Blob)
        {
            DataClassification = CustomerContent;
            // Caption = 'Proof Image 3';
        }
        field(197; "Upload Rejected Image"; Text[2048])
        {
            DataClassification = CustomerContent;
            // Caption = 'Proof Image 3';
        }
        field(50019; "Old Sales Order No"; Code[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."Old Customer PO" where("Document Type" = field("Document Type"), "No." = field("Document No.")));

        }
        field(50020; Sequence; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50023; "Station Master"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Station Master"."No.";
            ValidateTableRelation = false;
        }
        field(50024; "Scheduling Done"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "Scheduling Date & Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(50026; "Assigned User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50027; "Start Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(50028; "End Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(50029; "In Machine"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50030; "Ready to Pick"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Ready to Pick';
        }
        field(50031; "Proof Rejected by 1"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Rejected by';
        }
        field(50032; "Proof Rejected by 2"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Rejected by';
        }
        field(50033; "Proof Rejected by 3"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Rejected by';
        }
        field(50034; "Proof Rejected by 4"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Rejected by';
        }
        field(50035; "Proof Rejected by 5"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Proof Rejected by';
        }

        // field(195; "All Approve"; Boolean)
        // {
        //     FieldClass = FlowField;
        //     CalcFormula = exist("Artwork" WHERE("Document Type" = CONST(Order), "Document No." = field("Document No."), "Cancelled Order" = FILTER(FALSE), "Move to In Prodcution" = filter(true), Status = filter("Customer Approved Paper Proof"), Vendor_Type = filter('US PRODUCTION PARTNER')));

        // }

        field(50036; "Image Stream Path"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50037; "Image Stream 2 Path"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50038; "Image Stream 3 Path"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50039; "Image Stream 4 Path"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50040; "Image Stream 5 Path"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50041; "ART Image Stream Path"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50042; "ART Image Stream 2 Path"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50043; "ART Image Stream 3 Path"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50044; "ART Image Stream 4 Path"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50045; "ART Image Stream 5 Path"; Text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(50046; "Ready for Email"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        //>>PW MR 28th Nov 2024 - Artist Name
        field(50047; "Assigned to Name"; Code[100])
        {
            TableRelation = "Artist Name".Name;
        }
        //<<PW MR 28th Nov 2024 - Artist Name

        field(50048; "FTP upload failed"; Boolean)
        {
            Editable = false;
        }
        field(50049; "Sales Rep"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Artist Name".Name;
        }
        field(50050; "Proof GUID"; Guid)
        {
            DataClassification = ToBeClassified;
        }
        field(50051; "Proof Text"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Document Type", "Document No.", "Document Line No.", "Art ID", "Item Category", "Item sub Category", "Item sub sub Category")
        {
            Clustered = true;
        }
    }

    var
        SalesSetup: Record "Artwork Setup";
        RecImprintMethod: Record "Item Imprint Location";
        SalesLine: Record "Sales Line";
        NoSeriesMgt: Codeunit "No. Series"; //NoSeriesManagement;


    trigger OnInsert()
    var
        SalesHeader: Record "Sales Header";
        SL: Record "Sales Line";
        imprintD: Record "Imprint Details";
        itemImprintLoc: Record "Item Imprint Location";
        LineNo: Integer;
        ImprintMethodMatrix: Record "Category Imprint_M_Matrix";
        ImprintLocationMatrix: Record "Category Imprint Loc Matrix";
        RecITem: Record Item;
        ImprintM: Code[20];
        ImpritL: Code[20];
        SalesL: Record "Sales Line";
        Item: Record Item;
        AssortedColor: Text[100];
    begin
        SalesSetup.Get();
        // if Rec."Art ID" = '' then
        //  Rec."Art ID" := NoSeriesMgt.GetNextNo(SalesSetup."Art IDs", WorkDate(), true);
        Rec.GUID := CreateGuid();
        //  Rec.Status := rec.Status::"new Proof";
        if RecITem.Get(Rec."Item No.") then;
        If SalesLine.Get(Rec."Document Type", Rec."Document No.", Rec."Document Line No.") then begin
            Rec."Item No." := SalesLine."No.";
            Rec.Type := SalesLine.Type;
            Rec.Description := SalesLine.Description;
            Rec.Quantity := SalesLine.Quantity;
            // if SalesLine."Document Type" = SalesLine."Document Type"::Quote then
            Rec."Variant Code" := SalesLine."Variant Code";
            Rec."Rush Order" := SalesLine."Rush Order";
            Rec."Production Location" := SalesLine."Location Code";
            Rec."Super Rush Order" := SalesLine."Super Rush Order";
            Rec."PO No" := SalesLine."Purchase Order No.";
            Rec.Item_Type := RecITem.Item_Type;
            Rec.Size := RecITem.Size;


            /*  imprintD.Reset();
              imprintD.SetRange("Document No.", Rec."Document No.");
              imprintD.SetRange("Item No.", Rec."Item No.");
              imprintD.SetRange("Document Line No.", Rec."Document Line No.");
              if imprintD.FindFirst() then begin
                  if RecITem.Get(Rec."Item No.") then;
                  Clear(ImprintM);
                  Clear(ImpritL);
                  ImprintMethodMatrix.Reset();
                  ImprintMethodMatrix.SetRange("Item Category", RecITem."Item Category Code");
                  ImprintMethodMatrix.SetRange("Item sub Category", RecITem."Item Sub Category Code");
                  ImprintMethodMatrix.SetRange("Item sub sub Category", RecITem."Item Sub Sub Category Code");
                  ImprintMethodMatrix.SetRange(Default, true);
                  if ImprintMethodMatrix.FindFirst() then
                      ImprintM := ImprintMethodMatrix."Imprint Method";

                  ImprintLocationMatrix.Reset();
                  ImprintLocationMatrix.SetRange("Item Category", RecITem."Item Category Code");
                  ImprintLocationMatrix.SetRange("Item sub Category", RecITem."Item Sub Category Code");
                  ImprintLocationMatrix.SetRange("Item sub sub Category", RecITem."Item Sub Sub Category Code");
                  ImprintLocationMatrix.SetRange(Default, true);
                  if ImprintLocationMatrix.FindFirst() then
                      ImpritL := ImprintLocationMatrix."Imprint Location";



                  if (ImpritL <> '') OR (ImprintM <> '') then begin
                      imprintD.Init();
                      imprintD."Document Type" := Rec."Document Type";
                      imprintD."Document No." := Rec."Document No.";
                      imprintD."Item No." := Rec."Item No.";
                      imprintD."Line No." := FindMaxLocLineImprintDetail(imprintD);
                      imprintD."Document Line No." := Rec."Document Line No.";
                      imprintD."Art ID" := Rec."Art ID";
                      imprintD."Item Category" := Rec."Item Category";
                      imprintD."Item sub Category" := Rec."Item sub Category";
                      imprintD."Item sub sub Category" := Rec."Item sub sub Category";
                      imprintD."Imprint Location" := ImprintLocationMatrix."Imprint Location";
                      imprintD."Imprint Location" := ImpritL;
                      imprintD."Imprint Method" := ImprintM;
                      imprintD.Insert(true);
                  end;
              end;*/
            IF SalesHeader.GET(Rec."Document Type", Rec."Document No.") then begin
                //  Rec."Proof Required" := SalesHeader."Proof All Orders";
                Rec."Customer No." := SalesHeader."Sell-to Customer No.";
                Rec."Customer Name" := CopyStr(SalesHeader."Sell-to Customer Name", 1, MaxStrLen(Rec."Customer Name"));
                Rec.Contact := SalesHeader."Sell-to Contact";
                Rec."Customer PO#" := SalesHeader."External Document No.";
                Rec."Posting Date" := SalesHeader."Posting Date";
                Rec."Order Date" := SalesHeader."Order Date";
                Rec."Due Date" := SalesHeader."Due Date";
                Rec."Requested Delivery Date" := SalesHeader."Requested Delivery Date";
                Rec."In Hand Date" := SalesHeader."In-Hand Date";
                Rec."Approval Required" := SalesHeader."Mandatory Approval";
                Rec."Shipment Date" := SalesHeader."Shipment Date";
                Rec."Upload PO" := SalesHeader."Upload Customer PO Text";
                if SalesHeader.Order_Type = SalesHeader.Order_Type::"Rush Order" then
                    Rec."Rush Order" := true;
                if SalesHeader.Order_Type = SalesHeader.Order_Type::"Super Rush Order" then
                    Rec."Super Rush Order" := true;


                /*  //For assordted to get multiple color
                  if (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) AND (SalesHeader."Assorted Order") then begin
                      clear(AssortedColor);
                      SalesL.reset();
                      SalesL.SetRange(SalesL."Document Type", SalesL."Document Type"::Order);
                      SalesL.SetRange("Document No.", Rec."Document No.");
                      if SalesL.FindSet() then
                          repeat
                              if Item.Get(SalesL."No.") then;
                              if Not Item."Charge Item" then begin
                                  if AssortedColor = '' then
                                      AssortedColor := SalesL."Variant Code"
                                  else
                                      AssortedColor += ',' + SalesL."Variant Code";
                              end;
                          until SalesL.Next() = 0;
                      Rec."Variant Code" := AssortedColor;
                  end else
                      Rec."Variant Code" := SalesLine."Variant Code";*/
            end;

        end;
    end;

    trigger OnModify()
    begin
        // if Rec."Art ID" = '' then begin
        //     SalesSetup.Get();
        //     Rec."Art ID" := NoSeriesMgt.GetNextNo(SalesSetup."Art IDs", WorkDate(), true);
        // end;
    end;

    trigger OnDelete()
    var
        ImprintColodetails: Record "Imprint Color Details";
        ImpDetail: Record "Imprint Details";
    begin
        ImpDetail.Reset();
        ImpDetail.SetRange("Document Type", Rec."Document Type");
        ImpDetail.SetRange("Document No.", Rec."Document No.");
        ImpDetail.SetRange("Document Line No.", Rec."Document Line No.");
        ImpDetail.SetRange("Art ID", Rec."Art ID");
        ImpDetail.DeleteAll(true);

        ImprintColodetails.Reset();
        ImprintColodetails.SetRange("Document Type", Rec."Document Type");
        ImprintColodetails.SetRange("Document No.", Rec."Document No.");
        ImprintColodetails.SetRange("Document Line No.", Rec."Document Line No.");
        ImprintColodetails.SetRange("Art ID", Rec."Art ID");
        ImprintColodetails.DeleteAll(true);
    end;

    procedure FindMaxLocLineImprintDetail(var Imprint: Record "Imprint Details"): Integer
    var
        ImprintDetail: Record "Imprint Details";
    begin
        ImprintDetail.Reset();
        ImprintDetail.SetRange("Document Type", Imprint."Document Type");
        ImprintDetail.SetRange("Document No.", Imprint."Document No.");
        ImprintDetail.SetRange("Document Line No.", Imprint."Document Line No.");
        ImprintDetail.SetRange("Item No.", Imprint."Item No.");
        // ImprintDetail.SetRange("Art ID", Imprint."Art ID");
        if ImprintDetail.FindLast() then
            exit(ImprintDetail."Line No." + 10000)
        else
            exit(10000);

    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterSendinProduction(var Artwork: Record Artwork)
    begin
    end;

    [IntegrationEvent(true, false)]
    procedure ArtWorkCurrentStatus(var Artwork: Record Artwork)
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnafterSentProofApproval(Var Artwork: Record Artwork)
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnafterCustomerRejectedProof(var Artwork: Record Artwork)
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnafterCustomerApprovedProof(Var Artwork: Record Artwork; Var SL: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnafterQARejectedProof(var Artwork: Record Artwork)
    begin
    end;


}