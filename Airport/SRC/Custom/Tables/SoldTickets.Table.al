table 50090 "Sold Tickets"
{

    fields
    {
        field(10; "Ticket No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Passenger."Ticket No.";
        }
        field(20; "Flight No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Airlines Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Flight Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Passenger Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70; "Passenger Last Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(80; "Passenger ID"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(90; "Ticket Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(100; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Ticket No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        Passenger: Record Passenger;
    begin
        /*Passenger.SETFILTER(Passenger."Ticket No.", "Ticket No.");
        IF Passenger.FINDSET THEN BEGIN
          REPEAT
            "Passenger No." := Passenger."No.";
          UNTIL Passenger.NEXT = 0
        END;*/


    end;
}

