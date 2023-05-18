tableextension 70007 "FNR TableExt 70007" extends Contact//5050
{
    fields
    {
        field(70007; "FNR Position"; Enum CustomerVendor)
        {
            DataClassification = CustomerContent;
            InitValue = Default;
        }
        field(70008; "FNR Model Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }
}