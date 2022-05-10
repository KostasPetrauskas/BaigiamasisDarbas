page 50010 Registration
{
    ApplicationArea = All;
    UsageCategory = Documents;
    PageType = Document;
    SourceTable = "Registration Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    Editable = Registered = FALSE;
                }
                field("Flight No."; "Flight No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Flight Date"; "Flight Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Departure Time"; "Departure Time")
                {
                    ApplicationArea = All;
                    Editable = false;
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
                field("Passenger Name"; "Passenger Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Passenger Last Name"; "Passenger Last Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Passenger ID"; "Passenger ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Issued By"; "Issued By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Ticket No."; "Ticket No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Registration No."; "Registration No.")
                {
                    ApplicationArea = All;
                    Editable = false;

                    trigger OnValidate()
                    var
                        MyRec: Record "Registration Header";
                    begin
                    end;
                }
                field("Seat Code"; "Seat Code")
                {
                    ApplicationArea = All;
                    Editable = Registered = FALSE;
                    Enabled = true;

                    trigger OnValidate()
                    var
                        MyRec: Record "Registration Header";
                        text10001: Label 'Enter weight of luggage in "Luggage weight" field';
                    begin
                        if ("Seat Code" <> '') and ("Registration No." <> '') then begin
                            if ("Amount Of Luggage" <> 0) and ("Luggage weight" = 0) then begin
                                Error(text10001);
                            end;
                        end;

                        CurrPage.Update;
                        if ("Seat Code" <> '') and ("Registration No." <> '') then begin
                            if ("Amount Of Luggage" <> 0) and ("Luggage weight" = 0) then begin
                                Error(text10001);
                            end;
                            Registered := true;
                            Rec.Modify;
                            MyRec.SetRange("No.", Rec."No.");
                            MyRec.SetRange("Total Purchase Amount", Rec."Total Purchase Amount");
                            Commit;
                            REPORT.Run(50000, true, false, MyRec);
                        end;
                    end;
                }
                field("Boarding Gate"; "Boarding Gate")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Registered; Registered)
                {
                    ApplicationArea = All;
                    Editable = Registered = FALSE;
                }
                field("Amount Of Luggage"; "Amount Of Luggage")
                {
                    ApplicationArea = All;
                    Editable = Registered = FALSE;
                }
                field("Luggage weight"; "Luggage weight")
                {
                    ApplicationArea = All;
                    Editable = Registered = FALSE;
                }
            }
            part("Registration Subform"; "Registration Subform")
            {
                ApplicationArea = All;
                Editable = Registered = FALSE;
                SubPageLink = "Registration No." = FIELD("No.");
            }
            field("Additional Luggage Cost"; "Additional Luggage Cost")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Ticket Price"; "Ticket Price")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Total Purchase Amount"; "Total Purchase Amount")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Total Amount"; "Total Amount")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Registration Actions")
            {
                action("Boarding Pass")
                {
                    ApplicationArea = All;
                    Enabled = "Seat Code" <> '';
                    Image = Card;
                    Promoted = true;

                    trigger OnAction()
                    var
                        MyRec: Record "Registration Header";
                    begin
                        MyRec.SetRange("No.", Rec."No.");
                        MyRec.SetRange("Total Purchase Amount", Rec."Total Purchase Amount");
                        REPORT.Run(50000, true, true, MyRec);
                    end;
                }
                action("Edit Record")
                {
                    ApplicationArea = All;
                    Enabled = Registered = TRUE;
                    Image = EditCustomer;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        Registered := false;
                    end;
                }
            }
        }
    }

    var
        RegistrationCodeunit: Codeunit "Codeunit";
        IsChecked: Boolean;
        "Boarding Pass": Boolean;
        [InDataSet]
        FieldEditable: Boolean;
}

