page 50110 "Sold Ticket List"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    PageType = List;
    SourceTable = "Sold Tickets";

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;
                field("Ticket No."; "Ticket No.")
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
                field("Ticket Price"; "Ticket Price")
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

