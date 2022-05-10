page 50005 "Admin Role Center"
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
            group("Manage Users and Flights")
            {
                action("Manage Users")
                {
                    ApplicationArea = All;
                    Image = Users;
                    Promoted = true;
                    RunObject = Page Users;
                }
                action("Add flights")
                {
                    ApplicationArea = All;
                    Image = Add;
                    Promoted = true;
                    RunObject = Page "Add Flights";
                }
                action("Flights Information")
                {
                    ApplicationArea = All;
                    Image = Info;
                    Promoted = true;
                    RunObject = Page "Flight Destination";
                }
            }
        }
    }
}

