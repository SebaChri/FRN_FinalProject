pageextension 70012 "FNR PageExt 70012" extends "Contact Card"//5050
{
    layout
    {
        addafter(Type)
        {
            field(Position; Rec."FNR Position")
            {
                ApplicationArea = All;
                Editable = (rec.Type <> rec.Type::Person);

                trigger OnValidate()
                var
                    CustomerTempl: Record "Customer Templ.";
                    VendorTempl: Record "Vendor Templ.";
                    SelectCustomerTemplList: Page "Select Customer Templ. List";
                    SelectVendorTemplList: Page "Select Vendor Templ. List";
                begin
                    if Rec."FNR Position" = Rec."FNR Position"::Customer then begin
                        CustomerTempl.Init();
                        CustomerTempl.SetFilter("Contact Type", '=%1', CustomerTempl."Contact Type"::Company);
                        SelectCustomerTemplList.SetTableView(CustomerTempl);
                        SelectCustomerTemplList.LookupMode(true);
                        if SelectCustomerTemplList.RunModal() = Action::LookupOK then begin
                            SelectCustomerTemplList.GetRecord(CustomerTempl);
                            Rec.Validate("FNR Model Code", CustomerTempl.Code);
                        end;
                    end
                    else
                        if Rec."FNR Position" = Rec."FNR Position"::Vendor then begin
                            VendorTempl.Init();
                            VendorTempl.SetFilter("Contact Type", '=%1', VendorTempl."Contact Type"::Company);
                            SelectVendorTemplList.SetTableView(VendorTempl);
                            SelectVendorTemplList.LookupMode(true);
                            if SelectVendorTemplList.RunModal() = Action::LookupOK then begin
                                SelectVendorTemplList.GetRecord(VendorTempl);
                                Rec.Validate("FNR Model Code", VendorTempl.Code);
                            end;
                        end;
                end;
            }
        }
    }
}