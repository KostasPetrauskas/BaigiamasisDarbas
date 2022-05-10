table 50040 "Luggage Price"
{

    fields
    {
        field(10; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item WHERE ("Is Luggage" = CONST (true));
        }
        field(20; Price; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

