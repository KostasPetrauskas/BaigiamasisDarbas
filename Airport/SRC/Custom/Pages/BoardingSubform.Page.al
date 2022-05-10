page 50140 "Boarding Subform"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    PageType = ListPart;
    SourceTable = "Registration Line";

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
                    Visible = false;
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = All;
                    Visible = false;
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

