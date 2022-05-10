page 50125 "Boarding With Filters"
{
    ApplicationArea = All;
    UsageCategory = Documents;
    Editable = true;
    PageType = Document;
    SourceTable = "Registration Header";

    layout
    {
        area(content)
        {
            group(Control6)
            {
                ShowCaption = false;
                field(FlightNumber; FlightNumber)
                {
                    Caption = 'Flight No.';

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
                            FlightNumber := Flights."Flight No.";
                        end
                        else begin
                            FlightNumber := 'FLIGHT NOT FOUND';
                        end;

                        FlightDate := Flights."Flight Date";
                        DepartureTime := Flights."Departure Time";

                        SetFilter("Flight No.", '%1', FlightNumber);
                        SetFilter("Flight Date", '%1', FlightDate);
                        SetFilter("Departure Time", '%1', DepartureTime);
                    end;
                }
                field(FlightDate; FlightDate)
                {
                    Caption = 'Flight Date';
                }
                field(DepartureTime; DepartureTime)
                {
                    Caption = 'Departure Time';
                }
            }
            part(Control5; Boarding)
            {
                SubPageLink = "Flight No." = FIELD("Flight No.");
            }
        }
    }

    actions
    {
    }

    var
        FlightNumber: Code[20];
        FlightDate: Date;
        DepartureTime: Time;
}

