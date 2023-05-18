codeunit 70001 "FRN Contact Change"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS DS Management", 'OnDiscoverDSFunctions', '', true, false)]
    local procedure DS_ChangeRDAStatus(var DataSecurityFunctions: Record "EOS DS Functions")
    begin
        InjectDSFunctions(DataSecurityFunctions);
    end;

    local procedure InjectDSFunctions(var DSFunctions: Record "EOS DS Functions")
    begin
        CreateDSFunction(DSFunctions, 'FRN_CUVE', DATABASE::Contact, 0, CustomerVendorCreation_Lbl);

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS DS Management", 'OnExecuteDSFunction', '', true, true)]
    local procedure DataSecurityManagement_OnExecuteFunction(var DataSecurityFunctions: Record "EOS DS Functions"; var RecRef: RecordRef; TableOptionType: Integer; UseOptionType: Boolean; var ContinueExecution: Boolean)
    begin
        ContinueExecution := ExecuteFunction(DataSecurityFunctions, RecRef, TableOptionType, UseOptionType);
    end;

    procedure CreateDSFunction(var DSFunctions: Record "EOS DS Functions"; FunctionCode: Code[20]; TableID: Integer; TableOptionType: Option "0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"; FunctionDescription: Text[50])
    begin
        DSFunctions.Init();
        DSFunctions.Code := FunctionCode;
        if DSFunctions.Get() then;

        DSFunctions."Table ID" := TableID;
        DSFunctions."Table Option Type" := TableOptionType;
        DSFunctions.Description := FunctionDescription;
        if not DSFunctions.Insert() then
            DSFunctions.Modify();
    end;

    procedure ExecuteFunction(var DSFunctions: Record "EOS DS Functions"; var RecRef: RecordRef; TableOptionType: Option "0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"; UseOptionType: Boolean): Boolean
    begin
        if RecRef.Number() <> DATABASE::Contact then
            exit;

        if DSFunctions.Code = '' then
            exit(true);

        case DSFunctions.Type of
            DSFunctions.Type::Exec:
                case DSFunctions.Code of
                    'FRN_CUVE':
                        FRN_RunCreateCustomerVendor(RecRef);
                end;
        end;

        exit(true);
    end;


    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Customer Templ. Mgt.", 'OnBeforeSelectCustomerTemplate', '', false, false)]
    // local procedure testSubscriber(var IsHandled: Boolean)
    // begin
    //     IsHandled := true;
    // end;
    local procedure FRN_RunCreateCustomerVendor(RecRef: RecordRef): Boolean
    var
        ContactRecord: Record Contact;
    begin
        RecRef.SetTable(ContactRecord);

        if ContactRecord.Type <> ContactRecord.Type::Person then
            if ContactRecord."FNR Position" = ContactRecord."FNR Position"::Customer then
                ContactRecord.CreateCustomerFromTemplate(ContactRecord."FNR Model Code")
            else
                if ContactRecord."FNR Position" = ContactRecord."FNR Position"::Vendor then
                    ContactRecord.CreateVendorFromTemplate(ContactRecord."FNR Model Code");

    end;

    var
        CustomerVendorCreation_Lbl: Label 'Creates a new Customer or Vendor card from contact';
}