pageextension 70012 "FNR PageExt 70012" extends "Contact Card"//5050
{
    layout
    {
        addafter(Type)
        {
            field(Position; Rec."FNR Position")
            {
                ApplicationArea = All;
            }
        }
    }
}