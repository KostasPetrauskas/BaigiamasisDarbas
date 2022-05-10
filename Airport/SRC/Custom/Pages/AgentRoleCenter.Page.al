page 50006 "Agent Role Center"
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
            group("Registration And Boarding")
            {
                action(Registration)
                {
                    ApplicationArea = All;
                    Image = Register;
                    Promoted = true;
                    RunObject = Page "Registration List";
                }
                action(Boarding)
                {
                    ApplicationArea = All;
                    Image = Check;
                    Promoted = true;
                    RunObject = Page Boarding;
                }
            }
        }
    }
}

