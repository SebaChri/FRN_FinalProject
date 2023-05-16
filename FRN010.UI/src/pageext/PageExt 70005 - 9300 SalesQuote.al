pageextension 70005 "FRN PageExt 70005" extends "Sales Quote" //9300
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