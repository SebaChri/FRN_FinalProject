pageextension 70002 "FRN PageExt 70002" extends "Sales Invoice" // 34
{
    layout
    {
        addlast(General)
        {
            field("FRN Category No."; Rec."FRN Category No.")
            {
                ApplicationArea = All;
            }
        }
    }
}