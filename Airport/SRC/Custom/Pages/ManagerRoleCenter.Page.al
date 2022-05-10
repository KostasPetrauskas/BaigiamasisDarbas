page 50007 "Manager Role Center"
{
    PageType = RoleCenter;

    layout
    {
        area(content)
        {
        }
    }

    actions
    {
        area(processing)
        {
            group("Manage Flights And Passengers")
            {
                action("Flight List")
                {
                    ApplicationArea = All;
                    Image = List;
                    Promoted = true;
                    RunObject = Page "Flights List";
                }
                action("Passenger List")
                {
                    ApplicationArea = All;
                    Image = Registered;
                    Promoted = true;
                    RunObject = Page "Passenger List";
                }
                action("Ledger")
                {
                    ApplicationArea = All;
                    Image = LedgerEntries;
                    Promoted = true;
                    RunObject = Page "Ledger Entry";
                }
            }
        }
    }
}

