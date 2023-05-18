codeunit 70002 "FRN Release"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', false, false)]
    local procedure Codeunit_SalesDocument_OnBeforeReleaseSalesDoc(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    begin
        if SalesHeader."FRN Category No." = '' then begin
            Message(ErrorReleaseLbl, SalesHeader.FieldCaption("FRN Category No."));
            IsHandled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReleasePurchaseDoc', '', false, false)]
    local procedure Codeunit_PurchaseDocument_OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean)
    begin
        if PurchaseHeader."FRN Category No." = '' then begin
            Message(ErrorReleaseLbl, PurchaseHeader.FieldCaption("FRN Category No."));
            IsHandled := true;
        end;
    end;

    var
        ErrorReleaseLbl: Label 'Missing %1 on document';
}