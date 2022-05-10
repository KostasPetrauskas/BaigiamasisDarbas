page 50080 "Flights List"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageID = Flights;
    Editable = false;
    PageType = List;
    SourceTable = Flights;

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
                field("User ID"; "User ID")
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
                field("Boarding Gate"; "Boarding Gate")
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
                field("Airplane Model"; "Airplane Model")
                {
                    ApplicationArea = All;
                }
                field("No. of Seats"; "No. of Seats")
                {
                    ApplicationArea = All;
                }
                field("Is Finished"; "Is Finished")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Import Flights")
            {
                ApplicationArea = All;
                Image = ImportExcel;
                Promoted = true;
                RunObject = XMLport "Flights Import";
            }
            action("Add Flights")
            {
                ApplicationArea = All;
                Image = Add;
                Promoted = true;
                RunObject = Page "Add Flights";
            }
            action("Flight Destination")
            {
                ApplicationArea = All;
                Image = List;
                Promoted = true;
                RunObject = Page "Flight Destination";
            }
            action("Passenger List")
            {
                ApplicationArea = All;
                Image = List;
                Promoted = true;
                RunObject = Page "Passenger List";
            }
            action("Luggage Restrictions")
            {
                ApplicationArea = All;
                Image = CompanyInformation;
                Promoted = true;

                trigger OnAction()
                var
                    MyRec: Record Flights;
                    LuggageRestrictions: Record "Additional Luggage Cost";
                begin
                    LuggageRestrictions.Get(Rec."Airlines Name");
                    //MESSAGE('%1, %2, %3',LuggageRestrictions."Additional Cost Kg",LuggageRestrictions."Allowed Weight",LuggageRestrictions."Allowed Amount Of Luggage");
                    PAGE.Run(50065, LuggageRestrictions);
                end;
            }
            action(Report)
            {
                ApplicationArea = All;
                Image = NewSalesInvoice;
                Promoted = true;
                RunObject = Page "Sales Invoice";
            }
        }
    }
}

