pageextension 70004 "FRN PageExt 70004" extends "Sales Order" // 42
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
        modify("Ship-to Country/Region Code")
        {
            trigger OnAfterValidate()
            var
                FRNValidation: Codeunit "FRN Validation";
            begin
                if Rec."Document Type" = Rec."Document Type"::Order then
                    if Rec."Ship-to Country/Region Code" <> xRec."Ship-to Country/Region Code" then
                        FRNValidation.FRNCountryRegionCodeValidate(Rec);
            end;
        }
    }
}