codeunit 70000 "FRN Validation"
{
    procedure FRNCategoryValidate(var SalesHeader: Record "Sales Header")
    var
        FRNCategory: Record "FNR Category";
    begin
        if SalesHeader."Reason Code" = '' then
            if FRNCategory.Get(SalesHeader."FRN Category No.") then
                if FRNCategory."FNR Reason Code" <> '' then
                    SalesHeader.Validate("Reason Code", FRNCategory."FNR Reason Code");
    end;

    procedure FRNCategoryValidate(var PurchaseHeader: Record "Purchase Header")
    var
        FRNCategory: Record "FNR Category";
    begin
        if PurchaseHeader."Reason Code" = '' then
            if FRNCategory.Get(PurchaseHeader."FRN Category No.") then
                if FRNCategory."FNR Reason Code" <> '' then
                    PurchaseHeader.Validate("Reason Code", FRNCategory."FNR Reason Code");
    end;
}