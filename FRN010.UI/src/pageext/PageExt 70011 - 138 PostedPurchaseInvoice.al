pageextension 70011 "FNR PageExt 70011" extends "Posted Purchase Invoice"//138
{
    layout
    {
        addafter("Activity Code")
        {
            field("FNR Category No."; Rec."FRN Category No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}