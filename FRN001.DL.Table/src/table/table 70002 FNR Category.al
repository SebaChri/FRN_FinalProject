table 70002 "FNR Category"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "FNR Category No."; Code[20])
        {
            Caption = 'Category No.';
            DataClassification = CustomerContent;
        }
        field(2; "FNR Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "FNR Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
        }
        field(4; "FNR Reason Code"; code[10])
        {
            Caption = 'Reason Code';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "FNR Category No.")
        {
            Clustered = true;
        }
    }
}