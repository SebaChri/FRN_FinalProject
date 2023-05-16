codeunit 70000 "FRN Validation"
{
    procedure FRNCategoryValidate(var SalesHeader: Record "Sales Header")
    var
        FRNCategory: Record "FNR Category";
        SalesLine: Record "Sales Line";
        Write: Boolean;
        AnswerSalesLbl: Label 'Change the location on item %1?';
    begin
        // load the category
        if FRNCategory.Get(SalesHeader."FRN Category No.") then begin
            if FRNCategory."FNR Reason Code" <> '' then begin
                // change the reason
                Write := true;

                if SalesHeader."Reason Code" <> '' then
                    if not Confirm('Change the reason?') then
                        Write := false;

                if Write then
                    SalesHeader.Validate("Reason Code", FRNCategory."FNR Reason Code");
            end;

            if FRNCategory."FNR Location Code" <> '' then begin
                // change location line
                SalesLine.Init();
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                if SalesLine.FindSet() then
                    repeat
                        if SalesLine."Location Code" <> FRNCategory."FNR Location Code" then
                            if Confirm(StrSubstNo(AnswerSalesLbl, SalesLine.Description)) then begin
                                SalesLine.Validate("Location Code", FRNCategory."FNR Location Code");
                                SalesLine.Modify(true);
                            end;
                    until SalesLine.Next() = 0;
            end;
        end;
    end;

    procedure FRNCategoryValidate(var PurchaseHeader: Record "Purchase Header")
    var
        FRNCategory: Record "FNR Category";
        PurchaseLine: Record "Purchase Line";
        Write: Boolean;
        AnswerPurchaseLbl: Label 'Change the location on item %1?';
    begin
        // load the category
        if FRNCategory.Get(PurchaseHeader."FRN Category No.") then begin
            if FRNCategory."FNR Reason Code" <> '' then begin
                // change the reason
                Write := true;

                if PurchaseHeader."Reason Code" <> '' then
                    if not Confirm('Change the reason?') then
                        Write := false;

                if Write then
                    PurchaseHeader.Validate("Reason Code", FRNCategory."FNR Reason Code");
            end;

            if FRNCategory."FNR Location Code" <> '' then begin
                // change location line
                PurchaseLine.Init();
                PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
                PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
                if PurchaseLine.FindSet() then
                    repeat
                        if PurchaseLine."Location Code" <> FRNCategory."FNR Location Code" then
                            if Confirm(StrSubstNo(AnswerPurchaseLbl, PurchaseLine.Description)) then begin
                                PurchaseLine.Validate("Location Code", FRNCategory."FNR Location Code");
                                PurchaseLine.Modify(true);
                            end;
                    until PurchaseLine.Next() = 0;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'No.', false, false)]
    local procedure Table_SalesLine_OnAfterValidateEvent(var Rec: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        FRNCategory: Record "FNR Category";
    begin
        SalesHeader.Init();
        SalesHeader.SetRange("No.", Rec."Document No.");
        SalesHeader.SetRange("Document Type", Rec."Document Type");
        if SalesHeader.FindFirst() then
            if FRNCategory.Get(SalesHeader."FRN Category No.") then
                if FRNCategory."FNR Location Code" <> '' then
                    Rec.Validate("Location Code", FRNCategory."FNR Location Code");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', false, false)]
    local procedure Codeunit_SalesDocument_OnBeforeReleaseSalesDoc(var SalesHeader: Record "Sales Header")
    begin
        if SalesHeader."FRN Category No." = '' then
            Error(ErrorReleaseLbl);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReleasePurchaseDoc', '', false, false)]
    local procedure Codeunit_PurchaseDocument_OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header")
    begin
        if PurchaseHeader."FRN Category No." = '' then
            Error(ErrorReleaseLbl);
    end;

    var
        ErrorReleaseLbl: Label 'Missing category on document';
}