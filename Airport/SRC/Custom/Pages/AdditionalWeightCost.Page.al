page 50190 "Additional Weight Cost"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    PageType = List;
    SourceTable = "Additional Luggage Cost";

    layout
    {
        area(content)
        {
            repeater(Control6)
            {
                ShowCaption = false;
                field("No."; "Airlines Name")
                {
                    ApplicationArea = All;
                }
                field("Airlines Name"; "Allowed Weight")
                {
                    ApplicationArea = All;
                }
                field("Allowed Weight"; "Additional Cost Kg")
                {
                    ApplicationArea = All;
                }
                field("Additional Cost Kg"; "Allowed Amount Of Luggage")
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

