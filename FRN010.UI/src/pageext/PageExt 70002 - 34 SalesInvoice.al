pageextension 70002 "FRN PageExt 70002" extends "Sales Invoice" // 43
{
    layout
    {
        addafter(Status)
        {
            field("FRN Category No."; Rec."FRN Category No.")
            {
                ApplicationArea = All;
            }
        }
    }
}