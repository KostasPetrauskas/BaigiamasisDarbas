pageextension 60000 pageextensionUserSetup extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("Is Role"; "Is Role")
            {
                ApplicationArea = All;
            }
        }
    }
}