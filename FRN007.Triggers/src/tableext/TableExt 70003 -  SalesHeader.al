tableextension 70003 "FRN TableExt 70003" extends "Sales Header"
{
    fields
    {
        modify("FRN Category No.")
        {
            TableRelation = "FNR Category";
        }
    }
}