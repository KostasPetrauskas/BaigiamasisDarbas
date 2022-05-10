table 50010 Flights
{

    fields
    {
        field(10; "Flight No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Flight Destination"."Flight No.";

            trigger OnValidate()
            var
                FlightDestination: Record "Flight Destination";
                Str: Text[20];
                SubStr: Text[20];
            begin
                /*FlightDestination.INIT;
                FlightDestination."Flight No." := "Flight No.";
                FlightDestination.INSERT;*/
                Str := "Flight No.";
                SubStr := CopyStr(Str, 1, 3);
                //MESSAGE('SubStr: %1', SubStr);
                if SubStr = 'RYR' then begin
                    "Airlines Name" := 'Ryanair';
                end
                else begin
                    SubStr := CopyStr(Str, 1, 2);
                end;
                if SubStr = 'LH' then begin
                    "Airlines Name" := 'Lufthansa';
                end
                else begin
                    SubStr := CopyStr(Str, 1, 1);
                end;
                if SubStr = 'W' then begin
                    "Airlines Name" := 'WizzAir';
                end;
                FlightDestination.Get("Flight No.");
                //MESSAGE('%1',FlightDestination.Destination);
                From := FlightDestination.From;
                Destination := FlightDestination.Destination;
                "Boarding Gate" := FlightDestination."Boarding Gate";
                "Ticket Price" := FlightDestination."Ticket Price";

            end;
        }
        field(15; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(20; "Airlines Name"; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(25; From; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(30; Destination; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Flight Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Start of Registration"; Time)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                text10000: Label 'Start of Registration cannot start later than End of Registration';
            begin
                if ("Start of Registration" <> 0T) and ("End of Registration" <> 0T) then begin
                    if "Start of Registration" > "End of Registration" then
                        Error(text10000);
                    //ERROR('Start of Registration cannot start later than End of Registration');
                end;
            end;
        }
        field(60; "End of Registration"; Time)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                text10000: Label 'End of Registration cannot start earlier than Start of Registration';
            begin
                if ("Start of Registration" <> 0T) and ("End of Registration" <> 0T) then begin
                    if "End of Registration" < "Start of Registration" then
                        Error(text10000);
                    //ERROR('End of Registration cannot start earlier than Start of Registration');
                end;
            end;
        }
        field(70; "Start of Boarding"; Time)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                text10000: Label 'Start of Boarding cannot start later than End of Boarding';
            begin
                if ("Start of Boarding" <> 0T) and ("End of Boarding" <> 0T) then begin
                    if "Start of Boarding" > "End of Boarding" then
                        Error(text10000);
                    //ERROR('Start of Boarding cannot start later than End of Boarding');
                end;
            end;
        }
        field(80; "End of Boarding"; Time)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                text10000: Label 'End of Boarding cannot start earlier than Start of Boarding';
            begin
                if ("Start of Boarding" <> 0T) and ("End of Boarding" <> 0T) then begin
                    if "End of Boarding" < "Start of Boarding" then
                        Error(text10000);
                    //ERROR('End of Boarding cannot start earlier than Start of Boarding');
                end;
            end;
        }
        field(90; "Departure Time"; Time)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Start of Registration" := "Departure Time" - 5400000;
                "End of Registration" := "Departure Time" - 2700000;
                "Start of Boarding" := "Departure Time" - 1800000;
                "End of Boarding" := "Departure Time" - 300000;
            end;
        }
        field(100; "Airplane Model"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(110; "No. of Seats"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(115; "Ticket Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(120; "Boarding Gate"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(130; "Is Finished"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Flight No.", "Flight Date", "Departure Time")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    local procedure FillFlightDestination()
    begin
    end;
}

