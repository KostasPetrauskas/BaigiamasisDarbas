table 50130 "Ledger Entry"
{

    fields
    {
        field(10; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Passenger No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Flight No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Airlines Name"; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Flight Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(65; "Departure Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(70; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(80; "Ticket No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(90; "Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(100; "Seat Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(110; "Amount Of Luggage"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(120; "Luggage No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(122; "Ticket Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(125; "Total Purchase Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(130; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(140; "Checked In"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

