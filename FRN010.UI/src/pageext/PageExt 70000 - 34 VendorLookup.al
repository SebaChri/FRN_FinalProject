pageextension 70000 "FRN PageExt 70000" extends "Vendor Lookup" // 34
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