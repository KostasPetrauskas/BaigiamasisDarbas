page 50130 "Boarding Document"
{
    ApplicationArea = All;
    UsageCategory = Documents;
    PageType = Document;
    SourceTable = "Registration Header";

    layout
    {
        area(content)
        {
            group(Control2)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Flight No."; "Flight No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Airlines Name"; "Airlines Name")
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
                }
                field("Seat Code"; "Seat Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Total Purchase Amount"; "Total Purchase Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Ticket Price"; "Ticket Price")
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
            part("Boarding Subform"; "Boarding Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Registration No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Posting")
            {
                action(Post)
                {
                    ApplicationArea = All;
                    Image = PostDocument;
                    Promoted = true;

                    trigger OnAction()
                    var
                        RegistrationHeader: Record "Registration Header";
                    begin
                        if (Rec."Seat Code" <> '') and (Rec."Registration No." <> '') then begin
                            Rec."Posting Date" := Today;
                            PostingCodeunit.PostRecords(Rec);
                            Message('Passenger boarding approved. Record is posted');
                        end
                        else begin
                            Error('Record cannot be posted. Passenger has not checked in.');
                        end;
                    end;
                }
            }
        }
    }

    var
        PostingCodeunit: Codeunit "Codeunit";
        IsChecked: Boolean;
}

