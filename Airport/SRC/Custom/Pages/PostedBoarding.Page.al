page 50160 "Posted Boarding"
{
    ApplicationArea = All;
    UsageCategory = Documents;
    Editable = false;
    PageType = Document;
    SourceTable = "Posted Header";

    layout
    {
        area(content)
        {
            group(Control2)
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
                field("Flight Date"; "Flight Date")
                {
                    ApplicationArea = All;
                }
                field("Departure Time"; "Departure Time")
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
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = All;
                }
            }
            part("Posted Boarding Subform"; "Posted Boarding Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Registration No." = FIELD("No.");
            }
        }
    }

    actions
    {
    }
}

