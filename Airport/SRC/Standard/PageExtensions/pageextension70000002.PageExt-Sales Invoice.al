pageextension 50000 pageextension50000 extends "Sales Invoice"
{
    layout
    {

        //Unsupported feature: Property Modification (Name) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        addafter("Remove From Job Queue")
        {
            action("Add Flight Lines")
            {
                ApplicationArea = All;
                Image = Add;
                Promoted = true;

                trigger OnAction()
                var
                    SalesLine: Record "Sales Line";
                    Dates: Page "Period Dates";
                    DateFrom: Date;
                    DateTo: Date;
                    Ledger: Record "Ledger Entry";
                    FlightNo: Code[20];
                    PassengerNo: Code[20];
                    FlightDate: Date;
                    DepartureTime: Time;
                    SalesLineNo: Integer;
                    Setup: Record Setup;
                    AirlinesName: Text[40];
                    i: Integer;
                    j: Integer;
                begin
                    Dates.RunModal();
                    Dates.GetDates(DateFrom, DateTo);
                    //MESSAGE('%1 %2',DateFrom,DateTo);
                    /*FlightNo := 'RYR1185';
                    FlightDate := 010818D;
                    DepartureTime := 113000T;*/
                    //AirlinesName := 'Ryanair';
                    i := 0;
                    j := 0;
                    PassengerNo := '0';
                    //SalesLineNo := 10100;
                    repeat
                        if (DateFrom <= Ledger."Posting Date") and (DateTo >= Ledger."Posting Date") and (Ledger."Airlines Name" = Rec."Bill-to Name") then begin
                            if PassengerNo <> Ledger."Passenger No." then begin
                                SalesLine.SetRange("Document Type", Rec."Document Type");
                                SalesLine.SetRange("Document No.", Rec."No.");
                                if SalesLine.FindLast then begin
                                    SalesLineNo := SalesLine."Line No." + 1;
                                end else begin
                                    SalesLineNo := 10000;
                                end;
                                SalesLine.Init;
                                //Rec.VALIDATE("Sell-to Customer No.");
                                SalesLine."Document No." := Rec."No.";
                                SalesLine."Document Type" := Rec."Document Type";
                                SalesLine."Line No." := SalesLineNo;
                                //SalesLine."Line No." := SalesLineNo;
                                SalesLine.Type := SalesLine.Type::Item;
                                SalesLine."No." := '70061';
                                SalesLine.Validate("No.");
                                SalesLine.Description := 'Flight No: ' + Format(Ledger."Flight No.") + ', Passenger No: ' + Format(Ledger."Passenger No.") + ', Date: ' + Format(Ledger."Flight Date") + ', Departure Time: ' + Format(Ledger."Departure Time");
                                SalesLine.Quantity := 1;
                                SalesLine."Unit Price" := Ledger."Ticket Price";
                                SalesLine.Validate(Quantity);
                                SalesLine.Insert(true);
                                //SalesLineNo := SalesLineNo + 1;
                                //MESSAGE('%1, %2, %3, %4, %5, %6 ,%7', Ledger."Entry No.", Ledger."Posting Date", Ledger."Document No.", Ledger."Passenger No.", Ledger."Flight No.", Ledger."Airlines Name", Ledger."Ticket Price");
                            end;
                            //MESSAGE('%1, %2, %3, %4, %5', Ledger."Entry No.", Ledger."Posting Date", Ledger."Document No.", Ledger."Passenger No.", Ledger."Flight No.");
                        end
                        else begin
                            i := i + 1;
                            //MESSAGE('There is no records posted within this period of time');
                        end;
                        PassengerNo := Ledger."Passenger No.";
                        j := j + 1;
                    until Ledger.Next = 0;
                    if j = i then begin
                        Message('There is no records posted within this period of time');
                    end;

                end;
            }
        }
    }

    var
        NextEntryNo: Integer;

    local procedure InitNextEntryNo()
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.LockTable;
        if SalesLine.FindLast then begin
            NextEntryNo := SalesLine."Line No." + 1;
        end else begin
            NextEntryNo := 1;
        end;
    end;
}

