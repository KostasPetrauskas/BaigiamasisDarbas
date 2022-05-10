table 50060 "Flight Destination"
{

    fields
    {
        field(10; "Flight No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15; From; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20; Destination; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Ticket Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Boarding Gate"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Flight No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

