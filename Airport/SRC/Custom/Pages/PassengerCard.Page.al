page 50045 "Passenger Card"
{
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Registration Header";

    layout
    {
        area(content)
        {
            field("No."; "No.")
            {
                ApplicationArea = All;
            }
            field("Flight No."; "Flight No.")
            {
                ApplicationArea = All;

                trigger OnLookup(var Text: Text): Boolean
                var
                    FlightsList: Page "Flights List";
                    Flights: Record Flights;
                begin

                    FlightsList.SetRecord(Flights);
                    FlightsList.SetTableView(Flights);
                    FlightsList.LookupMode(true);
                    if FlightsList.RunModal = ACTION::LookupOK then begin
                        FlightsList.GetRecord(Flights);
                        "Flight No." := Flights."Flight No.";
                    end
                    else begin
                        "Flight No." := 'FLIGHT NOT FOUND';
                    end;

                    "Flight Date" := Flights."Flight Date";
                    "Departure Time" := Flights."Departure Time";
                    "Airlines Name" := Flights."Airlines Name";
                    From := Flights.From;
                    Destination := Flights.Destination;
                    "Ticket Price" := Flights."Ticket Price";
                    "Total Amount" := "Ticket Price";
                    "Boarding Gate" := Flights."Boarding Gate";
                end;
            }
            field("Flight Date"; "Flight Date")
            {
                ApplicationArea = All;
            }
            field("Departure Time"; "Departure Time")
            {
                ApplicationArea = All;
            }
            field("Airlines Name"; "Airlines Name")
            {
                ApplicationArea = All;
            }
            field(From; From)
            {
                ApplicationArea = All;
            }
            field(Destination; Destination)
            {
                ApplicationArea = All;
            }
            field("Passenger Name"; "Passenger Name")
            {
                ApplicationArea = All;
            }
            field("Passenger Last Name"; "Passenger Last Name")
            {
                ApplicationArea = All;
            }
            field("Passenger ID"; "Passenger ID")
            {
                ApplicationArea = All;
            }
            field("Issued By"; "Issued By")
            {
                ApplicationArea = All;
            }
            field("Ticket No."; "Ticket No.")
            {
                ApplicationArea = All;
            }
            field("Registration No."; "Registration No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Seat Code"; "Seat Code")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Amount Of Luggage"; "Amount Of Luggage")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Ticket Price"; "Ticket Price")
            {
                ApplicationArea = All;
            }
            field("Boarding Gate"; "Boarding Gate")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

