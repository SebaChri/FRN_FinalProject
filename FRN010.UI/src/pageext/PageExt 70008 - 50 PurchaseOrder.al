pageextension 70008 "FRN PageExt 70008" extends "Purchase Order" // 50
{
    layout
    {
        addafter(Status)
        {
            field("FRN Category No."; Rec."FRN Category No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Category No. field.';
            }
        }
    }
}