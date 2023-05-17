tableextension 70005 "FRN TableExt 70005" extends "Sales Invoice Header" // 112
{
    fields
    {
        field(70010; "FRN Category No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }
}