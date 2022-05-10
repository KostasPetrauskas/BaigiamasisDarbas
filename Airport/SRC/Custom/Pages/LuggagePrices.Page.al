page 50040 "Luggage Prices"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = true;
    PageType = List;
    SourceTable = "Luggage Price";

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                }
                field(Price; Price)
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

