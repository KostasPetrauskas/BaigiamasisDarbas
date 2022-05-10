page 50100 "Flight Destination"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    PageType = List;
    SourceTable = "Flight Destination";

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;
                field("Flight No."; "Flight No.")
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
                field("Boarding Gate"; "Boarding Gate")
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
            group("Add Flights")
            {
                action("Import Flights")
                {
                    ApplicationArea = All;
                    Image = ImportExcel;
                    Promoted = true;
                    RunObject = XMLport "Flight Destination Import";
                }
            }
        }
    }
}

