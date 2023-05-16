tableextension 70001 "FRN TableExt 70001" extends "Sales Header" // 36
{
    fields
    {
        field(70010; "FRN Category No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }
}