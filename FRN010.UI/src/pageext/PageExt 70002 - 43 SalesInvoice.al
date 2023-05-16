pageextension 70002 "FRN PageExt 70002" extends "Sales Invoice" // 43
{
    layout
    {
        addafter(Status)
        {
            field("FRN Category No."; Rec."FRN Category No.")
            {
                ApplicationArea = All;

                trigger OnValidate()
                var
                    FRNCategory: Record "FNR Category";
                begin
                    if Rec."Reason Code" = '' then
                        if FRNCategory.Get(Rec."FRN Category No.") then
                            if FRNCategory."FNR Reason Code" <> '' then begin
                                Rec."Reason Code" := FRNCategory."FNR Reason Code";
                                CurrPage.Update();
                            end;
                end;
            }
        }
    }
}