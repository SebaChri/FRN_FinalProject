pageextension 70002 "FRN PageExt 70002" extends "Sales Invoice" // 43
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