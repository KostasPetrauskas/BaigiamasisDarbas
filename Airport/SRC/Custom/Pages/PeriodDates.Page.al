page 50185 "Period Dates"
{
    ApplicationArea = All;
    UsageCategory = Documents;
    PageType = StandardDialog;

    layout
    {
        area(content)
        {
            group(Control4)
            {
                ShowCaption = false;
                field("Date From"; "Date From")
                {
                    ApplicationArea = All;
                    Caption = 'Choose starting date of the period';

                    trigger OnValidate()
                    begin
                        if "Date From" <> FirstDayOfTheMonth then begin
                            "Date To" := 0D;
                        end;
                    end;
                }
                field("Date To"; "Date To")
                {
                    ApplicationArea = All;
                    Caption = 'Choose ending date of the period';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        "Date From" := Today;
        "Date From" := CalcDate('<-CM>', "Date From");
        FirstDayOfTheMonth := "Date From";
        "Date To" := Today;
        "Date To" := CalcDate('<CM>', "Date To");
    end;

    var
        "Date From": Date;
        "Date To": Date;
        FirstDayOfTheMonth: Date;

    [Scope('Internal')]
    procedure GetDates(var DateFrom: Date; var DateTo: Date)
    begin
        DateFrom := "Date From";
        DateTo := "Date To";
    end;
}

