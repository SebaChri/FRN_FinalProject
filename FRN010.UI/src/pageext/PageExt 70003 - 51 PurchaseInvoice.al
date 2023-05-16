pageextension 70003 "FRN PageExt 70003" extends "Purchase Invoice" // 51
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