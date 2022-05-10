report 50000 "Boarding Pass"
{
    ApplicationArea = All;
    UsageCategory = Documents;
    DefaultLayout = RDLC;
    RDLCLayout = 'SRC\Custom\Reports\RdlcLayouts\BoardingPass.rdl';

    dataset
    {
        dataitem("Registration Header"; "Registration Header")
        {
            column(FlightNo; "Registration Header"."Flight No.")
            {
            }
            column(Airlines; "Registration Header"."Airlines Name")
            {
            }
            column(From; "Registration Header".From)
            {
            }
            column(Destination; "Registration Header".Destination)
            {
            }
            column(FlightDate; "Registration Header"."Flight Date")
            {
            }
            column(PassengerName; "Registration Header"."Passenger Name")
            {
            }
            column(PassengerLastName; "Registration Header"."Passenger Last Name")
            {
            }
            column(BoardingGate; "Registration Header"."Boarding Gate")
            {
            }
            column(Seat; "Registration Header"."Seat Code")
            {
            }
            column(RegistrtionNo; "Registration Header"."Registration No.")
            {
            }
            column(TicketNo; "Registration Header"."Ticket No.")
            {
            }
            column(PassengerID; "Registration Header"."Passenger ID")
            {
            }
            dataitem(Flights; Flights)
            {
                DataItemLink = "Flight No." = FIELD("Flight No."), "Flight Date" = FIELD("Flight Date"), "Departure Time" = FIELD("Departure Time");
                column(StartOfBoarding; Flights."Start of Boarding")
                {
                }
                column(DepartureTime; Flights."Departure Time")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    FlightsTable.Get("Registration Header"."Flight No.", "Registration Header"."Flight Date", "Registration Header"."Departure Time");
                    Flights."Start of Boarding" := FlightsTable."Start of Boarding";
                    Flights."Departure Time" := FlightsTable."Departure Time";
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        FlightsTable: Record Flights;
}

