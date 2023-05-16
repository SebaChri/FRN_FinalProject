page 70000 "FNR Category Page"
{

    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "FNR Category";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field(CategoryNo; Rec."FNR Category No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec."FNR Description")
                {
                    ApplicationArea = All;
                }
                field(LocationCode; Rec."FNR Location Code")
                {
                    ApplicationArea = All;
                }
                field(ReasonCode; Rec."FNR Reason Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}