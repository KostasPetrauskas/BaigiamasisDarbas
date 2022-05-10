page 50070 Flights
{
    ApplicationArea = All;
    UsageCategory = Documents;
    PageType = Document;
    SourceTable = Flights;

    layout
    {
        area(content)
        {
            group(Control2)
            {
                ShowCaption = false;
                field("Flight No."; "Flight No.")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = All;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        UserList: Page "User List";
                        User: Record "User Setup";
                        UserID: Code[50];
                        text10000: Label 'Boarding Agent allready has flight assigned at this Departure Time';
                        DepartureTime: Time;
                        FlightDate: Date;
                    begin
                        User.SetRange("Is Role", true);
                        UserList.SetRecord(User);
                        UserList.SetTableView(User);
                        UserList.LookupMode(true);
                        if UserList.RunModal = ACTION::LookupOK then begin
                            UserList.GetRecord(User);
                            "User ID" := User."User ID";
                            UserID := "User ID";
                            FlightDate := "Flight Date";
                            DepartureTime := "Departure Time";
                        end else begin
                            "User ID" := 'USER NOT FOUND';
                        end;

                        Rec.SetRange("User ID", UserID);
                        Rec.SetRange("Flight Date", FlightDate);
                        Rec.SetRange("Departure Time", DepartureTime);
                        if Rec.FindSet then begin
                            Error(text10000);
                        end;
                    end;
                }
                field("Airlines Name"; "Airlines Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(From; From)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Destination; Destination)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Boarding Gate"; "Boarding Gate")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Flight Date"; "Flight Date")
                {
                    ApplicationArea = All;
                }
                field("Start of Registration"; "Start of Registration")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("End of Registration"; "End of Registration")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Start of Boarding"; "Start of Boarding")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("End of Boarding"; "End of Boarding")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Departure Time"; "Departure Time")
                {
                    ApplicationArea = All;
                }
                field("Airplane Model"; "Airplane Model")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("No. of Seats"; "No. of Seats")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Ticket Price"; "Ticket Price")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Is Finished"; "Is Finished")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
            part("Passenger Subform"; "Flights Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Flight No." = FIELD("Flight No.");
            }
        }
    }

    actions
    {
    }
}

