tableextension 70000 "FRN TableExt 70000" extends "FNR Category" // 70002
{
    fields
    {
        modify("FNR Location Code")
        {
            TableRelation = Location;
        }
        modify("FNR Reason Code")
        {
            TableRelation = "Reason Code";
        }
    }
}