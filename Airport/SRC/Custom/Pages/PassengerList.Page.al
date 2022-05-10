page 50050 "Passenger List"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageID = "Passenger Card";
    Editable = false;
    PageType = List;
    SourceTable = "Registration Header";

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Flight No."; "Flight No.")
                {
                    ApplicationArea = All;
                }
                field("Flight Date"; "Flight Date")
                {
                    ApplicationArea = All;
                }
                field("Departure Time"; "Departure Time")
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
                field("Ticket No."; "Ticket No.")
                {
                    ApplicationArea = All;
                }
                field("Registration No."; "Registration No.")
                {
                    ApplicationArea = All;
                }
                field("Seat Code"; "Seat Code")
                {
                    ApplicationArea = All;
                }
                field("Amount Of Luggage"; "Amount Of Luggage")
                {
                    ApplicationArea = All;
                }
                field("Ticket Price"; "Ticket Price")
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
            action("Import Passengers")
            {
                ApplicationArea = All;
                Image = ImportExcel;
                Promoted = true;
                RunObject = XMLport "Registration Import";
            }
        }
    }
}

