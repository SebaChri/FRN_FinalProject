pageextension 70010 "FRN PageExt 70010" extends "Posted Sales Invoice" // 132
{
    layout
    {
        addafter(Closed)
        {
            field("FRN Category No."; Rec."FRN Category No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Category No. field.';
                Editable = false;
            }
        }
    }
}