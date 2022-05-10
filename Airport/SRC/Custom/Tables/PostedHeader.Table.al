table 50100 "Posted Header"
{

    fields
    {
        field(10; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Flight No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Flight Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Departure Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Airlines Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(36; From; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(37; Destination; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Passenger Name"; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Passenger Last Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Passenger ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(75; "Issued By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(80; "Ticket No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(85; "Ticket Sold"; Boolean)
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
        field(120; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(145; "Amount Of Luggage"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(150; "Luggage weight"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(160; "Additional Luggage Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(170; "Ticket Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(180; "Total Purchase Amount"; Decimal)
        {
            FieldClass = Normal;
        }
        field(190; "Total Amount"; Decimal)
        {
            FieldClass = Normal;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

