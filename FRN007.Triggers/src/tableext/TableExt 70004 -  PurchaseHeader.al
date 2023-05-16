tableextension 70004 "FRN TableExt 70004" extends "Purchase Header"
{
    fields
    {
        modify("FRN Category No.")
        {
            TableRelation = "FNR Category";
        }
    }
}