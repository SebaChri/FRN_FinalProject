pageextension 70009 "FNR PageExt 70009" extends "Sales Return Order" //6630
{
    layout
    {
        addafter(Status)
        {
            field("FRN Category No."; Rec."FRN Category No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Category No. field.';

                trigger OnValidate()
                var
                    FRNValidation: Codeunit "FRN Validation";
                begin
                    FRNValidation.FRNCategoryValidate(Rec);
                end;
            }
        }
    }
}