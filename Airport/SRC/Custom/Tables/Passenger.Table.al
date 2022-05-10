table 50020 Passenger
{

    fields
    {
        field(10; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(20; "Flight No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Flights."Flight No.";

            trigger OnValidate()
            var
                FlightDestination: Record "Flight Destination";
            begin
                /*IF "Ticket No." = '' THEN BEGIN
                  Setup.GET;
                  Setup.TESTFIELD("Ticket Nos.");
                  NoSeriesMgt.InitSeries(Setup."Ticket Nos.",xRec."No. Series",0D,"Ticket No.","No. Series");
                END;
                
                FlightDestination.GET("Flight No.");
                "Ticket Price" := FlightDestination."Ticket Price";
                */

            end;
        }
        field(30; "Flight Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*RegistrationHeader.SETFILTER(RegistrationHeader."Ticket No.","Ticket No.");
                IF RegistrationHeader.FINDSET THEN BEGIN
                  RegistrationHeader."Flight Date" := "Flight Date";
                  RegistrationHeader.MODIFY;
                END;
                */

            end;
        }
        field(40; "Passenger Name"; Text[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*RegistrationHeader.SETFILTER(RegistrationHeader."Ticket No.","Ticket No.");
                IF RegistrationHeader.FINDSET THEN BEGIN
                  RegistrationHeader."Passenger Name" := "Passenger Name";
                  RegistrationHeader.MODIFY;
                END;
                */

            end;
        }
        field(50; "Passenger Last Name"; Text[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*RegistrationHeader.SETFILTER(RegistrationHeader."Ticket No.","Ticket No.");
                IF RegistrationHeader.FINDSET THEN BEGIN
                  RegistrationHeader."Passenger Last Name" := "Passenger Last Name";
                  RegistrationHeader.MODIFY;
                END;
                */

            end;
        }
        field(60; "Passenger ID"; Text[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*RegistrationHeader.SETFILTER(RegistrationHeader."Ticket No.","Ticket No.");
                IF RegistrationHeader.FINDSET THEN BEGIN
                  RegistrationHeader."Passenger ID" := "Passenger ID";
                  RegistrationHeader.MODIFY;
                END;
                */

            end;
        }
        field(70; "Ticket No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(80; "Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(90; "Seat Code"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*IF "Registration No." = '' THEN BEGIN
                  Setup.GET;
                  Setup.TESTFIELD("Registration Nos.");
                  NoSeriesMgt.InitSeries(Setup."Registration Nos.",xRec."No. Series",0D,"Registration No.","No. Series");
                END;
                
                RegistrationHeader.SETFILTER(RegistrationHeader."Ticket No.","Ticket No.");
                IF RegistrationHeader.FINDSET THEN BEGIN
                  RegistrationHeader."Seat Code" := "Seat Code";
                  RegistrationHeader."Registration No." := "Registration No.";
                  RegistrationHeader.MODIFY;
                END;
                */

            end;
        }
        field(93; "Paid Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                SoldTickets: Record "Sold Tickets";
                Flights: Record Flights;
            begin
                /*RegistrationHeader.SETFILTER(RegistrationHeader."Ticket No.","Ticket No.");
                IF RegistrationHeader.FINDSET THEN BEGIN
                  RegistrationHeader."Paid Amount" := "Paid Amount";
                  IF RegistrationHeader."Paid Amount" + RegistrationHeader."Ticket Price" = 0 THEN BEGIN
                    RegistrationHeader."Ticket Sold" := TRUE;
                  END
                  ELSE BEGIN
                    RegistrationHeader."Ticket Sold" := FALSE;
                  END;
                  IF (RegistrationHeader."Registration No." <> '') AND (RegistrationHeader."Seat Code" <> '') AND (RegistrationHeader."Ticket Sold" = TRUE) THEN BEGIN
                    RegistrationHeader."Checked In" := TRUE;
                  END
                  ELSE BEGIN
                    RegistrationHeader."Checked In" := FALSE;
                  END;
                  RegistrationHeader.MODIFY;
                END;
                
                IF "Ticket Price" + "Paid Amount" = 0 THEN BEGIN
                  "Ticket Sold" := TRUE;
                END
                ELSE BEGIN
                  "Ticket Sold" := FALSE;
                END;
                
                IF "Ticket Sold" = TRUE THEN BEGIN
                  Flights.GET("Flight No.");
                  SoldTickets.INIT;
                  SoldTickets."Ticket No." := "Ticket No.";
                  SoldTickets."Flight No." := "Flight No.";
                  SoldTickets."Airlines Name" := Flights."Airlines Name";
                  SoldTickets."Flight Date" := "Flight Date";
                  SoldTickets."Passenger Name" := "Passenger Name";
                  SoldTickets."Passenger Last Name" := "Passenger Last Name";
                  SoldTickets."Passenger ID" := "Passenger ID";
                  SoldTickets."Ticket Price" := "Ticket Price";
                  SoldTickets.INSERT(TRUE);
                END;
                */

            end;
        }
        field(95; "Ticket Price"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                RegistrationHeader: Record "Registration Header";
            begin
                /*RegistrationHeader.SETFILTER(RegistrationHeader."Ticket No.","Ticket No.");
                IF RegistrationHeader.FINDSET THEN BEGIN
                  RegistrationHeader."Total Amount" := 0;
                  RegistrationHeader."Total Amount" := RegistrationHeader."Ticket Price" + RegistrationHeader."Total Purchase Amount" + RegistrationHeader."Additional Luggage Cost";
                  RegistrationHeader.MODIFY;
                END;*/

            end;
        }
        field(97; "Ticket Sold"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(100; "Amount of Luggage"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*RegistrationHeader.SETFILTER(RegistrationHeader."Ticket No.","Ticket No.");
                IF RegistrationHeader.FINDSET THEN BEGIN
                  RegistrationHeader."Amount Of Luggage" := "Amount of Luggage";
                  RegistrationHeader.MODIFY;
                END;
                */

            end;
        }
        field(107; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "No.", "Flight No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        Flights: Record Flights;
        SoldTickets: Record "Sold Tickets";
    begin
        /*IF "No." = '' THEN BEGIN
          Setup.GET;
          Setup.TESTFIELD("Passenger Nos.");
          NoSeriesMgt.InitSeries(Setup."Passenger Nos.",xRec."No. Series",0D,"No.","No. Series");
        END;
        
        Flights.GET("Flight No.");
        RegistrationHeader.INIT;
        RegistrationHeader."Flight No." := "Flight No.";
        RegistrationHeader."Airlines Name" := Flights."Airlines Name";
        RegistrationHeader.From := Flights.From;
        RegistrationHeader.Destination := Flights.Destination;
        RegistrationHeader."Passenger No." := "No.";
        RegistrationHeader."Flight Date" := "Flight Date";
        RegistrationHeader."Passenger Name" := "Passenger Name";
        RegistrationHeader."Passenger Last Name" := "Passenger Last Name";
        RegistrationHeader."Passenger ID" := "Passenger ID";
        RegistrationHeader."Ticket No." := "Ticket No.";
        RegistrationHeader."Registration No." := "Registration No.";
        RegistrationHeader."Seat Code" := "Seat Code";
        RegistrationHeader."Paid Amount" := "Paid Amount";
        RegistrationHeader."Ticket Price" := "Ticket Price";
        RegistrationHeader."Amount Of Luggage" := "Amount of Luggage";
        RegistrationHeader."Boarding Gate" := Flights."Boarding Gate";
        RegistrationHeader.INSERT(TRUE);
        
        RegistrationHeader."Total Amount" := 0;
        RegistrationHeader."Total Amount" := RegistrationHeader."Ticket Price" + RegistrationHeader."Total Purchase Amount" + RegistrationHeader."Additional Luggage Cost";
        RegistrationHeader.MODIFY;
        
        {IF ("Paid Amount" + "Ticket Price" = 0) THEN BEGIN
          Flights.GET("Flight No.");
          SoldTickets.INIT;
          SoldTickets."Ticket No." := "Ticket No.";
          SoldTickets."Flight No." := "Flight No.";
          SoldTickets."Airlines Name" := Flights."Airlines Name";
          SoldTickets."Flight Date" := "Flight Date";
          SoldTickets."Passenger No." := "No.";
          SoldTickets."Passenger Name" := "Passenger Name";
          SoldTickets."Passenger Last Name" := "Passenger Last Name";
          SoldTickets."Passenger ID" := "Passenger ID";
          SoldTickets."Ticket Price" := "Ticket Price";
          SoldTickets.INSERT(TRUE);
        END;}
        */

    end;

    var
        Setup: Record Setup;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RegistrationHeader: Record "Registration Header";
}

