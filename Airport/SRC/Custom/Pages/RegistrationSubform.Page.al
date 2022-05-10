page 50020 "Registration Subform"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    AutoSplitKey = true;
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

                    trigger OnValidate()
                    var
                        RegistrationHeader: Record "Registration Header";
                        Registration: Page Registration;
                        LuggagePrice: Record "Luggage Price";
                    begin
                        Description := '';
                        //CountSum;
                        //MESSAGE('%1', Sum);
                        /*RegistrationHeader.GET("Registration No.");
                        RegistrationHeader."Total Amount" := 0;
                        RegistrationHeader."Total Amount" := RegistrationHeader."Total Amount" + RegistrationHeader."Additional Luggage Cost" + RegistrationHeader."Ticket Price" + "Luggage Price" + Sum;
                        RegistrationHeader.MODIFY;
                        MESSAGE('Total Amount: %1', RegistrationHeader."Total Amount");*/

                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ShowMandatory = true;

                    trigger OnValidate()
                    var
                        RegistrationHeader: Record "Registration Header";
                    begin
                        CountSum;
                        //MESSAGE('%1', Sum);
                        RegistrationHeader.Get("Registration No.");
                        RegistrationHeader."Total Amount" := 0;
                        RegistrationHeader."Total Amount" := RegistrationHeader."Total Amount" + RegistrationHeader."Additional Luggage Cost" + RegistrationHeader."Ticket Price" + Sum;
                        RegistrationHeader.Modify;
                        //MESSAGE('Total Amount: %1', RegistrationHeader."Total Amount");
                    end;
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        RegistrationHeader: Record "Registration Header";
    begin
        /*CountSum;
        MESSAGE('%1', Sum);
        RegistrationHeader.GET("Registration No.");
        RegistrationHeader."Total Amount" := 0;
        RegistrationHeader."Total Amount" := RegistrationHeader."Total Amount" + RegistrationHeader."Additional Luggage Cost" + RegistrationHeader."Ticket Price" + "Luggage Price" + Sum;
        RegistrationHeader.MODIFY;
        MESSAGE('Total Amount: %1', RegistrationHeader."Total Amount");*/

    end;

    var
        "Sum": Decimal;

    local procedure CountSum()
    var
        RegistrationLine: Record "Registration Line";
    begin
        RegistrationLine.SetFilter(RegistrationLine."Registration No.", "Registration No.");
        if RegistrationLine.FindSet then begin
            Sum := 0;
            repeat
                Sum := Sum + RegistrationLine."Luggage Price";
            until RegistrationLine.Next = 0;
            RegistrationLine.Get("Registration No.", "Line No.");
            Sum := Sum - RegistrationLine."Luggage Price";
        end;
        Sum := Sum + "Luggage Price";
        Rec.Modify;
    end;
}

