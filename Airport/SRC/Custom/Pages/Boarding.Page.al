page 50120 Boarding
{
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageID = "Boarding Document";
    Editable = true;
    PageType = List;
    SourceTable = "Registration Header";

    layout
    {
        area(content)
        {
            group(Control15)
            {
                ShowCaption = false;
                field(FlightNumber; FlightNumber)
                {
                    ApplicationArea = All;
                    Caption = 'Flight No.';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        FlightsList: Page "Flights List";
                        Flights: Record Flights;
                        User: Record User;
                        UserName: Code[50];
                    begin
                        Flights.SetRange("User ID", UserId);
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

                        CurrPage.Update(false);
                    end;
                }
                field(FlightDate; FlightDate)
                {
                    ApplicationArea = All;
                    Caption = 'Flight Date';
                }
                field(DepartureTime; DepartureTime)
                {
                    ApplicationArea = All;
                    Caption = 'Departure Time';
                }
            }
            repeater(Control2)
            {
                Editable = false;
                ShowCaption = false;
                field("No."; "No.")
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
                    Editable = false;
                }
                field("Ticket No."; "Ticket No.")
                {
                    ApplicationArea = All;
                }
                field("Registration No."; "Registration No.")
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; "Total Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Boarding Actions")
            {
                action("Finish Boarding")
                {
                    ApplicationArea = All;
                    Image = Close;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        SetFilter("Flight No.", '%1', FlightNumber);
                        SetFilter("Flight Date", '%1', FlightDate);
                        SetFilter("Departure Time", '%1', DepartureTime);
                        repeat
                            if ("Seat Code" = '') and ("Registration No." = '') then begin
                                Rec."Posting Date" := Today;
                                CalcFields("Total Purchase Amount");
                                PostingCodeunit.FinishBoarding(Rec);
                                //MESSAGE('%1 %2',"No.","Total Purchase Amount");
                            end;
                        until Rec.Next = 0;
                        Message('Boarding is finished. All records are posted');
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetFilter("Flight No.", '%1', '');
        SetFilter("Flight Date", '%1', 0D);
        SetFilter("Departure Time", '%1', 0T);
    end;

    var
        FlightNumber: Code[20];
        FlightDate: Date;
        DepartureTime: Time;
        PostingCodeunit: Codeunit "Codeunit";
}

