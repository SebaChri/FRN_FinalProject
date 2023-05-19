pageextension 70006 "FRN PageExt 70006" extends "Purchase Return Order" // 6640
{
    layout
    {
        addafter(status)
        {
            field("FRN Category No."; Rec."FRN Category No.")
            {
                ApplicationArea = All;
                ShowMandatory = true;
                NotBlank = true;

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