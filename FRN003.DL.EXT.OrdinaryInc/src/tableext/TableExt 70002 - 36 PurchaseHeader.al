tableextension 70002 "FRN TableExt 70002" extends "Purchase Header" // 36
{
    fields
    {
        field(70010; "FRN Category No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }
}