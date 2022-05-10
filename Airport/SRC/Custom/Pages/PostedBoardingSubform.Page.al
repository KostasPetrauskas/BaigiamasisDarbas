page 50150 "Posted Boarding Subform"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    PageType = ListPart;
    SourceTable = "Posted Line";

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;
                field("Registration No."; "Registration No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = All;
                }
                field("Luggage No."; "Luggage No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Luggage Price"; "Luggage Price")
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

