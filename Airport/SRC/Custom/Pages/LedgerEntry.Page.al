page 50180 "Ledger Entry"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    PageType = List;
    SourceTable = "Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = All;
                }
                field("Passenger No."; "Passenger No.")
                {
                    ApplicationArea = All;
                }
                field("Flight No."; "Flight No.")
                {
                    ApplicationArea = All;
                }
                field("Airlines Name"; "Airlines Name")
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
                field("Luggage No."; "Luggage No.")
                {
                    ApplicationArea = All;
                }
                field("Ticket Price"; "Ticket Price")
                {
                    ApplicationArea = All;
                }
                field("Total Purchase Amount"; "Total Purchase Amount")
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; "Total Amount")
                {
                    ApplicationArea = All;
                }
                field("Checked In"; "Checked In")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

