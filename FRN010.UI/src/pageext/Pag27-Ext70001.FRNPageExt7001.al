pageextension 70001 "FRN PageExt7001" extends "Vendor List" //27
{
    layout
    {
        addafter(Name)
        {
            field("VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = All;
            }
        }
    }
}