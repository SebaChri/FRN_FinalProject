pageextension 70007 "FRN PageExt 70007" extends "Purchase Quote" // 49
{
    layout
    {
        addafter(Status)
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