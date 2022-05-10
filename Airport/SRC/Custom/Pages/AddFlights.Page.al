page 50090 "Add Flights"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    PageType = List;
    SourceTable = Flights;

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;
                field("Flight No."; Rec."Flight No.")
                {
                    ApplicationArea = All;
                }
                field("Airlines Name"; Rec."Airlines Name")
                {
                    ApplicationArea = All;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = All;
                }
                field("Flight Date"; Rec."Flight Date")
                {
                    ApplicationArea = All;
                }
                field("Departure Time"; Rec."Departure Time")
                {
                    ApplicationArea = All;
                }
                field("Airplane Model"; Rec."Airplane Model")
                {
                    ApplicationArea = All;
                }
                field("No. of Seats"; Rec."No. of Seats")
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

