table 50110 "Posted Line"
{

    fields
    {
        field(10; "Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(30; "Luggage No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(35; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Luggage Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Registration No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

