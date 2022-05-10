page 50200 "User List"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    PageType = List;
    SourceTable = "User Setup";

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;


                field("User ID"; "User ID")
                {
                    ApplicationArea = All;
                    //DataClassification = ToBeClassified;
                }
                field("Is Role"; "Is Role")
                {
                    ApplicationArea = All;
                    //DataClassification = ToBeClassified;
                }
            }
        }
    }

    actions
    {
    }
}

