pageextension 70010 "FRN PageExt 70010" extends "Posted Sales Invoice" // 132
{
    layout
    {
        addafter(Closed)
        {
            field("FRN Category No."; Rec."FRN Category No.")
            {
                ApplicationArea = All;
                ShowMandatory = true;
                NotBlank = true;
                ToolTip = 'Specifies the value of the Category No. field.';
                Editable = false;

                // trigger OnValidate()
                // var
                //     FRNValidation: Codeunit "FRN Validation";
                // begin
                //     FRNValidation.FRNCategoryValidate(Rec);
                // end;
            }
        }
    }
}