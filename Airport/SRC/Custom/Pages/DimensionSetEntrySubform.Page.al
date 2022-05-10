page 50210 "Dimension Set Entry Subform"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Dimension Set Entry";

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;
                field("Dimension Code"; "Dimension Code")
                {
                }
                field("Dimension Value Code"; "Dimension Value Code")
                {
                }
                field("Dimension Value Name"; "Dimension Value Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

