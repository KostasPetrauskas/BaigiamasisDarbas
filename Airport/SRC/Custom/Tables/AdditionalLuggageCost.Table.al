table 50070 "Additional Luggage Cost"
{

    fields
    {
        field(10; "Airlines Name"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Allowed Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Additional Cost Kg"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Allowed Amount Of Luggage"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Airlines Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

