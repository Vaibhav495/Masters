// table 50135 "Contact History Cue"
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(7171; "No. of Quotes"; Integer)
//         {
//             CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Quote),
//                                                       "Sell-to Customer No." = FIELD("No.")));
//             Caption = 'No. of Quotes';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7172; "No. of Blanket Orders"; Integer)
//         {
//             AccessByPermission = TableData "Sales Shipment Header" = R;
//             CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Blanket Order"),
//                                                       "Sell-to Customer No." = FIELD("No.")));
//             Caption = 'No. of Blanket Orders';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7173; "No. of Orders"; Integer)
//         {
//             AccessByPermission = TableData "Sales Shipment Header" = R;
//             CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Order),
//                                                       "Sell-to Customer No." = FIELD("No.")));
//             Caption = 'No. of Orders';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7174; "No. of Invoices"; Integer)
//         {
//             CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Invoice),
//                                                       "Sell-to Customer No." = FIELD("No.")));
//             Caption = 'No. of Invoices';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7175; "No. of Return Orders"; Integer)
//         {
//             AccessByPermission = TableData "Return Receipt Header" = R;
//             CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Return Order"),
//                                                       "Sell-to Customer No." = FIELD("No.")));
//             Caption = 'No. of Return Orders';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7176; "No. of Credit Memos"; Integer)
//         {
//             CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Credit Memo"),
//                                                       "Sell-to Customer No." = FIELD("No.")));
//             Caption = 'No. of Credit Memos';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7177; "No. of Pstd. Shipments"; Integer)
//         {
//             CalcFormula = Count("Sales Shipment Header" WHERE("Sell-to Customer No." = FIELD("No.")));
//             Caption = 'No. of Pstd. Shipments';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7178; "No. of Pstd. Invoices"; Integer)
//         {
//             CalcFormula = Count("Sales Invoice Header" WHERE("Sell-to Customer No." = FIELD("No.")));
//             Caption = 'No. of Pstd. Invoices';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7179; "No. of Pstd. Return Receipts"; Integer)
//         {
//             CalcFormula = Count("Return Receipt Header" WHERE("Sell-to Customer No." = FIELD("No.")));
//             Caption = 'No. of Pstd. Return Receipts';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7180; "No. of Pstd. Credit Memos"; Integer)
//         {
//             CalcFormula = Count("Sales Cr.Memo Header" WHERE("Sell-to Customer No." = FIELD("No.")));
//             Caption = 'No. of Pstd. Credit Memos';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7181; "No. of Ship-to Addresses"; Integer)
//         {
//             CalcFormula = Count("Ship-to Address" WHERE("Customer No." = FIELD("No.")));
//             Caption = 'No. of Ship-to Addresses';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7182; "Bill-To No. of Quotes"; Integer)
//         {
//             CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Quote),
//                                                       "Bill-to Customer No." = FIELD("No.")));
//             Caption = 'Bill-To No. of Quotes';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7183; "Bill-To No. of Blanket Orders"; Integer)
//         {
//             AccessByPermission = TableData "Sales Shipment Header" = R;
//             CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Blanket Order"),
//                                                       "Bill-to Customer No." = FIELD("No.")));
//             Caption = 'Bill-To No. of Blanket Orders';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7184; "Bill-To No. of Orders"; Integer)
//         {
//             AccessByPermission = TableData "Sales Shipment Header" = R;
//             CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Order),
//                                                       "Bill-to Customer No." = FIELD("No.")));
//             Caption = 'Bill-To No. of Orders';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7185; "Bill-To No. of Invoices"; Integer)
//         {
//             CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Invoice),
//                                                       "Bill-to Customer No." = FIELD("No.")));
//             Caption = 'Bill-To No. of Invoices';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7186; "Bill-To No. of Return Orders"; Integer)
//         {
//             AccessByPermission = TableData "Return Receipt Header" = R;
//             CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Return Order"),
//                                                       "Bill-to Customer No." = FIELD("No.")));
//             Caption = 'Bill-To No. of Return Orders';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7187; "Bill-To No. of Credit Memos"; Integer)
//         {
//             CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Credit Memo"),
//                                                       "Bill-to Customer No." = FIELD("No.")));
//             Caption = 'Bill-To No. of Credit Memos';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7188; "Bill-To No. of Pstd. Shipments"; Integer)
//         {
//             CalcFormula = Count("Sales Shipment Header" WHERE("Bill-to Customer No." = FIELD("No.")));
//             Caption = 'Bill-To No. of Pstd. Shipments';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7189; "Bill-To No. of Pstd. Invoices"; Integer)
//         {
//             CalcFormula = Count("Sales Invoice Header" WHERE("Bill-to Customer No." = FIELD("No.")));
//             Caption = 'Bill-To No. of Pstd. Invoices';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7190; "Bill-To No. of Pstd. Return R."; Integer)
//         {
//             CalcFormula = Count("Return Receipt Header" WHERE("Bill-to Customer No." = FIELD("No.")));
//             Caption = 'Bill-To No. of Pstd. Return R.';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7191; "Bill-To No. of Pstd. Cr. Memos"; Integer)
//         {
//             CalcFormula = Count("Sales Cr.Memo Header" WHERE("Bill-to Customer No." = FIELD("No.")));
//             Caption = 'Bill-To No. of Pstd. Cr. Memos';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//     }

//     keys
//     {
//         key(Key1; MyField)
//         {
//             Clustered = true;
//         }
//     }

//     var
//         myInt: Integer;

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