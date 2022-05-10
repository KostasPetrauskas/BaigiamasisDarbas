table 50030 "Registration Header"
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
            TableRelation = Flights."Flight No.";

            trigger OnValidate()
            begin
                /*IF "Ticket No." = '' THEN BEGIN
                  Setup.GET;
                  Setup.TESTFIELD("Ticket Nos.");
                  NoSeriesMgt.InitSeries(Setup."Ticket Nos.",xRec."No. Series",0D,"Ticket No.","No. Series");
                END;*/

            end;
        }
        field(32; "Flight Date"; Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = Flights."Flight Date";

            trigger OnValidate()
            var
                text10000: Label '"Flight No." field is empty. Fill in "Flight No." field before entering "Flight Date"';
            begin
                if ("Flight No." = '') and ("Flight Date" <> 0D) then begin
                    Error(text10000);
                    //ERROR('"Flight No." field is empty. Fill in "Flight No." field before entering "Flight Date"');
                end;

                CheckFlightDate;
            end;
        }
        field(33; "Departure Time"; Time)
        {
            DataClassification = ToBeClassified;
            TableRelation = Flights."Departure Time";

            trigger OnValidate()
            var
                Flights: Record Flights;
                text10000: Label '"Flight No." field is empty. Fill in "Flight No." field before entering "Departure Time"';
                text10001: Label '"Flight Date" field is empty. Fill in "Flight Date" field before entering "Departure Time"';
            begin
                if ("Flight No." = '') and ("Departure Time" <> 0T) then begin
                    Error(text10000);
                    //ERROR('"Flight No." field is empty. Fill in "Flight No." field before entering "Departure Time"');
                end;
                if ("Flight Date" = 0D) and ("Departure Time" <> 0T) then begin
                    Error(text10001);
                    //ERROR('"Flight Date" field is empty. Fill in "Flight Date" field before entering "Departure Time"');
                end;

                CheckDepartureTime;

                if ("Flight No." <> '') and ("Flight Date" <> 0D) and ("Departure Time" <> 0T) then begin
                    Flights.Get("Flight No.", "Flight Date", "Departure Time");
                    "Airlines Name" := Flights."Airlines Name";
                    From := Flights.From;
                    Destination := Flights.Destination;
                    "Boarding Gate" := Flights."Boarding Gate";
                    "Ticket Price" := Flights."Ticket Price";
                    "Total Amount" := 0;
                    "Total Amount" := "Total Amount" + "Ticket Price" + "Additional Luggage Cost" + "Total Purchase Amount";
                end
            end;
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

            trigger OnValidate()
            begin

                if ("Flight No." <> '') and ("Flight Date" <> 0D) and ("Departure Time" <> 0T) and ("Passenger Name" <> '') and ("Passenger Last Name" <> '') and ("Passenger ID" <> '') then begin
                    if "Ticket No." = '' then begin
                        Setup.Get;
                        Setup.TestField("Ticket Nos.");
                        NoSeriesMgt.InitSeries(Setup."Ticket Nos.", xRec."No. Series", 0D, "Ticket No.", "No. Series");
                    end;
                end;
            end;
        }
        field(75; "Issued By"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
        }
        field(80; "Ticket No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(85; Registered; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(90; "Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*IF ("Registration No." <> '') AND ("Seat Code" <> '') AND ("Ticket Sold" = TRUE) THEN BEGIN
                  "Checked In" := TRUE;
                END
                ELSE BEGIN
                  "Checked In" := FALSE;
                END;*/

            end;
        }
        field(100; "Seat Code"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                CheckSeatCode;

                if "Seat Code" <> '' then begin
                    if "Registration No." = '' then begin
                        Setup.Get;
                        Setup.TestField("Registration Nos.");
                        NoSeriesMgt.InitSeries(Setup."Registration Nos.", xRec."No. Series", 0D, "Registration No.", "No. Series");
                    end;
                end
                else begin
                    "Registration No." := '';
                end;

                /*IF ("Registration No." <> '') AND ("Seat Code" <> '') AND ("Ticket Sold" = TRUE) THEN BEGIN
                  "Checked In" := TRUE;
                END
                ELSE BEGIN
                  "Checked In" := FALSE;
                END;*/

            end;
        }
        field(107; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(120; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(145; "Amount Of Luggage"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                AdditionalLuggage: Record "Additional Luggage Cost";
            begin
                AdditionalLuggage.SetFilter(AdditionalLuggage."Airlines Name", "Airlines Name");
                if AdditionalLuggage.FindSet then begin
                    if "Amount Of Luggage" > AdditionalLuggage."Allowed Amount Of Luggage" then begin
                        Error('Maximum allowed amount of luggage is: %1', AdditionalLuggage."Allowed Amount Of Luggage");
                    end;
                end;
            end;
        }
        field(150; "Luggage weight"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                AdditionalLuggageCost: Record "Additional Luggage Cost";
            begin
                AdditionalLuggageCost.SetFilter("Airlines Name", "Airlines Name");
                if AdditionalLuggageCost.FindSet then begin
                    case "Amount Of Luggage" of
                        0:
                            if "Luggage weight" <> 0 then
                                Error('Amount of luggage is 0. Luggage weight needs to be changed to 0');
                        1:
                            if "Luggage weight" <= 32 then begin
                                //MESSAGE('%1', "Luggage weight"*"Amount Of Luggage");
                                if ("Luggage weight" - (AdditionalLuggageCost."Allowed Weight" * "Amount Of Luggage") > 0) then begin
                                    "Additional Luggage Cost" := ("Luggage weight" - AdditionalLuggageCost."Allowed Weight" * "Amount Of Luggage") * AdditionalLuggageCost."Additional Cost Kg";
                                end
                                else begin
                                    "Additional Luggage Cost" := 0;
                                end;
                            end
                            else begin
                                //MESSAGE('%1', "Luggage weight"*"Amount Of Luggage");
                                Error('The luggage weight exceeds allowed maximum luggage weight per unit');
                            end;
                        else
                            if "Luggage weight" <= 32 * "Amount Of Luggage" then begin
                                if ("Luggage weight" - (AdditionalLuggageCost."Allowed Weight" * "Amount Of Luggage") > 0) then begin
                                    "Additional Luggage Cost" := ("Luggage weight" - AdditionalLuggageCost."Allowed Weight" * "Amount Of Luggage") * AdditionalLuggageCost."Additional Cost Kg";
                                end
                                else begin
                                    "Additional Luggage Cost" := 0;
                                end;
                            end
                            else begin
                                Error('The luggage weight exceeds allowed maximum luggage weight per unit');
                            end;
                    end;
                end;

                "Total Amount" := 0;
                "Total Amount" := "Total Amount" + "Ticket Price" + "Additional Luggage Cost" + "Total Purchase Amount";
            end;
        }
        field(160; "Additional Luggage Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(170; "Ticket Price"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Total Amount" := 0;
                "Total Amount" := "Total Amount" + "Ticket Price" + "Additional Luggage Cost" + "Total Purchase Amount";
            end;
        }
        field(180; "Total Purchase Amount"; Decimal)
        {
            CalcFormula = Sum ("Registration Line"."Luggage Price" WHERE ("Registration No." = FIELD ("No.")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                /*"Total Amount" := 0;
                "Total Amount" := "Total Amount" + "Ticket Price" + "Additional Luggage Cost" + "Total Purchase Amount";
                //MESSAGE('Total Purchase Amount: %1',"Total Amount");
                */

            end;
        }
        field(190; "Total Amount"; Decimal)
        {
            FieldClass = Normal;
        }
        field(210; "Boarding Gate"; Code[10])
        {
            DataClassification = ToBeClassified;
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

    trigger OnInsert()
    var
        Passenger: Record Passenger;
        Flights: Record Flights;
    begin
        if "No." = '' then begin
            Setup.Get;
            Setup.TestField("Registration Header Nos.");
            NoSeriesMgt.InitSeries(Setup."Registration Header Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        "Issued By" := UserId;

        if ("Flight No." <> '') and ("Flight Date" <> 0D) and ("Departure Time" <> 0T) then begin
            Flights.Get("Flight No.", "Flight Date", "Departure Time");
            "Airlines Name" := Flights."Airlines Name";
            From := Flights.From;
            Destination := Flights.Destination;
            "Boarding Gate" := Flights."Boarding Gate";
            "Ticket Price" := Flights."Ticket Price";
            "Total Amount" := 0;
            "Total Amount" := "Total Amount" + "Ticket Price" + "Additional Luggage Cost" + "Total Purchase Amount";
        end;

        /*IF ("Registration No." <> '') AND ("Seat Code" <> '') THEN BEGIN
          "Checked In" := TRUE;
        END
        ELSE BEGIN
          "Checked In" := FALSE;
        END;*/
        /*
        
        IF ("Registration No." <> '') AND ("Seat Code" <> '') AND ("Ticket Sold" = TRUE) THEN BEGIN
            "Checked In" := TRUE;
        END;*/

    end;

    var
        Setup: Record Setup;
        NoSeriesMgt: Codeunit NoSeriesManagement;

    local procedure CheckSeatCode()
    var
        Line: Record "Registration Header";
        No: Code[20];
        FlightDate: Date;
        DepartureTime: Time;
        SeatCode: Code[20];
    begin
        No := "Flight No.";
        FlightDate := "Flight Date";
        DepartureTime := "Departure Time";
        SeatCode := "Seat Code";
        //MESSAGE('%1 %2 %3 %4',No,FlightDate,DepartureTime,SeatCode);
        Line.SetFilter(Line."Flight No.", No);
        if Line.FindSet then begin
            repeat
                if (Line."Flight Date" = FlightDate) and (Line."Departure Time" = DepartureTime) and (Line."Seat Code" = SeatCode) and (Line."Seat Code" <> '') then begin
                    Error('The seat in this flight is already taken.');
                end;
            until Line.Next = 0;
        end;
    end;

    local procedure CheckFlightDate()
    var
        Flights: Record Flights;
        i: Integer;
    begin
        i := 0;
        Flights.SetFilter(Flights."Flight No.", "Flight No.");
        if Flights.FindSet then begin
            repeat
                if Flights."Flight Date" = "Flight Date" then begin
                    i := i + 1;
                end;
            until Flights.Next = 0;
        end;
        if (i = 0) and ("Flight Date" <> 0D) then begin
            Error('Flights with this Flight Date does not exist');
        end;
    end;

    local procedure CheckDepartureTime()
    var
        Flights: Record Flights;
        i: Integer;
    begin
        i := 0;
        Flights.SetFilter(Flights."Flight No.", "Flight No.");
        if Flights.FindSet then begin
            repeat
                if (Flights."Flight Date" = "Flight Date") and (Flights."Departure Time" = "Departure Time") then begin
                    i := i + 1;
                end;
            until Flights.Next = 0;
        end;
        if (i = 0) and ("Departure Time" <> 0T) then begin
            Error('Flights with this Departure Time does not exist');
        end;
    end;
}

