pageextension 70006 "MyExtension" extends "Purchase Return Order" // 6640
{
    layout
    {
        addafter(status)
        {
            field("FRN Category No."; Rec."FRN Category No.")
            {
                ApplicationArea = All;
            }
        }
    }
}