codeunit 50000 "Codeunit"
{

    trigger OnRun()
    begin
    end;

    var
        NextEntryNo: Integer;
        NextEntryNo2: Integer;

    [Scope('Internal')]
    procedure CalculateTotalPrice(RegistrationHeader: Record "Registration Header")
    begin
        RegistrationHeader."Total Amount" := 0;
        RegistrationHeader."Total Amount" := RegistrationHeader."Total Amount" + RegistrationHeader."Additional Luggage Cost" + RegistrationHeader."Total Purchase Amount" + RegistrationHeader."Ticket Price";
        RegistrationHeader.Modify;
        //MESSAGE('Total price has been calculated');
    end;

    [Scope('Internal')]
    procedure PostRecords(RegistrationHeader: Record "Registration Header")
    var
        RegistrationLine: Record "Registration Line";
        JournalLine: Record "Journal Line";
        PostedLine: Record "Posted Line";
        PostedHeader: Record "Posted Header";
    begin

        RegistrationLine.SetFilter("Registration No.", RegistrationHeader."No.");
        if RegistrationLine.FindSet then begin
            repeat
                JournalLine.Init;
                JournalLine."Line No." := RegistrationLine."Line No.";
                JournalLine."Posting Date" := RegistrationHeader."Posting Date";
                JournalLine."Passenger No." := RegistrationHeader."No.";
                JournalLine."Flight No." := RegistrationHeader."Flight No.";
                JournalLine."Airlines Name" := RegistrationHeader."Airlines Name";
                JournalLine.From := RegistrationHeader.From;
                JournalLine.Destination := RegistrationHeader.Destination;
                JournalLine."Flight Date" := RegistrationHeader."Flight Date";
                JournalLine."Departure Time" := RegistrationHeader."Departure Time";
                JournalLine."Ticket No." := RegistrationHeader."Ticket No.";
                JournalLine."Registration No." := RegistrationHeader."Registration No.";
                JournalLine."Seat Code" := RegistrationHeader."Seat Code";
                JournalLine."Amount Of Luggage" := RegistrationHeader."Amount Of Luggage";
                JournalLine."Luggage No." := RegistrationLine."Luggage No.";
                JournalLine."Ticket Price" := RegistrationHeader."Ticket Price";
                JournalLine."Total Purchase Amount" := RegistrationHeader."Total Purchase Amount";
                JournalLine."Total Amount" := RegistrationHeader."Total Amount";
                JournalLine.Insert(true);

                PostedLine.Init;
                PostedLine."Registration No." := RegistrationLine."Registration No.";
                PostedLine."Line No." := RegistrationLine."Line No.";
                PostedLine."Luggage No." := RegistrationLine."Luggage No.";
                PostedLine.Description := RegistrationLine.Description;
                PostedLine."Luggage Price" := RegistrationLine."Luggage Price";
                PostedLine.Insert(true);
                RegistrationLine.Delete;
            until RegistrationLine.Next = 0;
        end
        else begin
            InitNextEntryNo2;
            JournalLine.Init;
            JournalLine."Line No." := NextEntryNo2;
            JournalLine."Posting Date" := RegistrationHeader."Posting Date";
            JournalLine."Passenger No." := RegistrationHeader."No.";
            JournalLine."Flight No." := RegistrationHeader."Flight No.";
            JournalLine."Airlines Name" := RegistrationHeader."Airlines Name";
            JournalLine.From := RegistrationHeader.From;
            JournalLine.Destination := RegistrationHeader.Destination;
            JournalLine."Flight Date" := RegistrationHeader."Flight Date";
            JournalLine."Departure Time" := RegistrationHeader."Departure Time";
            JournalLine."Ticket No." := RegistrationHeader."Ticket No.";
            JournalLine."Registration No." := RegistrationHeader."Registration No.";
            JournalLine."Seat Code" := RegistrationHeader."Seat Code";
            JournalLine."Amount Of Luggage" := RegistrationHeader."Amount Of Luggage";
            JournalLine."Luggage No." := RegistrationLine."Luggage No.";
            JournalLine."Ticket Price" := RegistrationHeader."Ticket Price";
            JournalLine."Total Purchase Amount" := RegistrationHeader."Total Purchase Amount";
            JournalLine."Total Amount" := RegistrationHeader."Total Amount";
            JournalLine.Insert(true);
        end;

        PostedHeader.Init;
        PostedHeader."No." := RegistrationHeader."No.";
        PostedHeader."Flight No." := RegistrationHeader."Flight No.";
        PostedHeader."Flight Date" := RegistrationHeader."Flight Date";
        PostedHeader."Departure Time" := RegistrationHeader."Departure Time";
        PostedHeader."Airlines Name" := RegistrationHeader."Airlines Name";
        PostedHeader.From := RegistrationHeader.From;
        PostedHeader.Destination := RegistrationHeader.Destination;
        PostedHeader."Passenger Name" := RegistrationHeader."Passenger Name";
        PostedHeader."Passenger Last Name" := RegistrationHeader."Passenger Last Name";
        PostedHeader."Passenger ID" := RegistrationHeader."Passenger ID";
        PostedHeader."Issued By" := RegistrationHeader."Issued By";
        PostedHeader."Ticket No." := RegistrationHeader."Ticket No.";
        PostedHeader."Ticket Sold" := RegistrationHeader.Registered;
        PostedHeader."Registration No." := RegistrationHeader."Registration No.";
        PostedHeader."Seat Code" := RegistrationHeader."Seat Code";
        PostedHeader."Posting Date" := RegistrationHeader."Posting Date";
        PostedHeader."Amount Of Luggage" := RegistrationHeader."Amount Of Luggage";
        PostedHeader."Luggage weight" := RegistrationHeader."Luggage weight";
        PostedHeader."Additional Luggage Cost" := RegistrationHeader."Additional Luggage Cost";
        PostedHeader."Ticket Price" := RegistrationHeader."Ticket Price";
        PostedHeader."Total Purchase Amount" := RegistrationHeader."Total Purchase Amount";
        PostedHeader."Total Amount" := RegistrationHeader."Total Amount";
        PostedHeader.Insert(true);
        RegistrationHeader.Delete;

        /*ELSE BEGIN
          RegistrationLine.SETFILTER("Registration No.",RegistrationHeader."No.");
          IF RegistrationLine.FINDSET THEN BEGIN
            REPEAT
              RegistrationLine.DELETE;
            UNTIL RegistrationLine.NEXT = 0;
          END;
          RegistrationHeader.DELETE;
        END;*/

        PostJournalToLedger;

    end;

    [Scope('Internal')]
    procedure PostJournalToLedger()
    var
        JournalLine: Record "Journal Line";
        generalLedger: Record "Ledger Entry";
    begin
        repeat
            if (JournalLine."Document No." <> '') and (JournalLine."Passenger No." <> '') then begin
                generalLedger.Init;
                InitNextEntryNo;
                generalLedger."Entry No." := NextEntryNo;
                generalLedger."Posting Date" := JournalLine."Posting Date";
                generalLedger."Document No." := JournalLine."Document No.";
                generalLedger."Passenger No." := JournalLine."Passenger No.";
                generalLedger."Flight No." := JournalLine."Flight No.";
                generalLedger."Airlines Name" := JournalLine."Airlines Name";
                generalLedger."Flight Date" := JournalLine."Flight Date";
                generalLedger."Departure Time" := JournalLine."Departure Time";
                generalLedger."Ticket No." := JournalLine."Ticket No.";
                generalLedger."Registration No." := JournalLine."Registration No.";
                generalLedger."Seat Code" := JournalLine."Seat Code";
                generalLedger."Amount Of Luggage" := JournalLine."Amount Of Luggage";
                generalLedger."Luggage No." := JournalLine."Luggage No.";
                generalLedger."Ticket Price" := JournalLine."Ticket Price";
                generalLedger."Total Purchase Amount" := JournalLine."Total Purchase Amount";
                generalLedger."Total Amount" := JournalLine."Total Amount";
                generalLedger."Checked In" := true;
                generalLedger.Insert(true);
                JournalLine.Delete;
            end;
        until JournalLine.Next = 0;
    end;

    local procedure InitNextEntryNo()
    var
        generalLedger: Record "Ledger Entry";
    begin
        generalLedger.LockTable;
        if generalLedger.FindLast then begin
            NextEntryNo := generalLedger."Entry No." + 1;
        end else begin
            NextEntryNo := 1;
        end;
    end;

    [Scope('Internal')]
    procedure FinishBoarding(RegistrationHeader: Record "Registration Header")
    var
        RegistrationLine: Record "Registration Line";
        JournalLine: Record "Journal Line";
        PostedLine: Record "Posted Line";
        PostedHeader: Record "Posted Header";
        i: Integer;
    begin
        RegistrationLine.SetFilter("Registration No.", RegistrationHeader."No.");
        if RegistrationLine.FindSet then begin
            repeat
                JournalLine.Init;
                JournalLine."Line No." := RegistrationLine."Line No.";
                JournalLine."Posting Date" := RegistrationHeader."Posting Date";
                JournalLine."Passenger No." := RegistrationHeader."No.";
                JournalLine."Flight No." := RegistrationHeader."Flight No.";
                JournalLine."Airlines Name" := RegistrationHeader."Airlines Name";
                JournalLine.From := RegistrationHeader.From;
                JournalLine.Destination := RegistrationHeader.Destination;
                JournalLine."Flight Date" := RegistrationHeader."Flight Date";
                JournalLine."Departure Time" := RegistrationHeader."Departure Time";
                JournalLine."Ticket No." := RegistrationHeader."Ticket No.";
                JournalLine."Registration No." := RegistrationHeader."Registration No.";
                JournalLine."Seat Code" := RegistrationHeader."Seat Code";
                JournalLine."Amount Of Luggage" := RegistrationHeader."Amount Of Luggage";
                JournalLine."Luggage No." := RegistrationLine."Luggage No.";
                JournalLine."Ticket Price" := RegistrationHeader."Ticket Price";
                JournalLine."Total Purchase Amount" := RegistrationHeader."Total Purchase Amount";
                JournalLine."Total Amount" := RegistrationHeader."Total Amount";
                JournalLine.Insert(true);

                PostedLine.Init;
                PostedLine."Registration No." := RegistrationLine."Registration No.";
                PostedLine."Line No." := RegistrationLine."Line No.";
                PostedLine."Luggage No." := RegistrationLine."Luggage No.";
                PostedLine.Description := RegistrationLine.Description;
                PostedLine."Luggage Price" := RegistrationLine."Luggage Price";
                PostedLine.Insert(true);
                RegistrationLine.Delete;
            until RegistrationLine.Next = 0;
        end
        else begin
            InitNextEntryNo2;
            JournalLine.Init;
            JournalLine."Line No." := NextEntryNo2;
            JournalLine."Posting Date" := RegistrationHeader."Posting Date";
            JournalLine."Passenger No." := RegistrationHeader."No.";
            JournalLine."Flight No." := RegistrationHeader."Flight No.";
            JournalLine."Airlines Name" := RegistrationHeader."Airlines Name";
            JournalLine.From := RegistrationHeader.From;
            JournalLine.Destination := RegistrationHeader.Destination;
            JournalLine."Flight Date" := RegistrationHeader."Flight Date";
            JournalLine."Departure Time" := RegistrationHeader."Departure Time";
            JournalLine."Ticket No." := RegistrationHeader."Ticket No.";
            JournalLine."Registration No." := RegistrationHeader."Registration No.";
            JournalLine."Seat Code" := RegistrationHeader."Seat Code";
            JournalLine."Amount Of Luggage" := RegistrationHeader."Amount Of Luggage";
            JournalLine."Luggage No." := RegistrationLine."Luggage No.";
            JournalLine."Ticket Price" := RegistrationHeader."Ticket Price";
            JournalLine."Total Purchase Amount" := RegistrationHeader."Total Purchase Amount";
            JournalLine."Total Amount" := RegistrationHeader."Total Amount";
            JournalLine.Insert(true);
        end;

        //MESSAGE('%1 %2',RegistrationHeader."No.",RegistrationHeader."Total Purchase Amount");
        PostedHeader.Init;
        PostedHeader."No." := RegistrationHeader."No.";
        PostedHeader."Flight No." := RegistrationHeader."Flight No.";
        PostedHeader."Flight Date" := RegistrationHeader."Flight Date";
        PostedHeader."Departure Time" := RegistrationHeader."Departure Time";
        PostedHeader."Airlines Name" := RegistrationHeader."Airlines Name";
        PostedHeader.From := RegistrationHeader.From;
        PostedHeader.Destination := RegistrationHeader.Destination;
        PostedHeader."Passenger Name" := RegistrationHeader."Passenger Name";
        PostedHeader."Passenger Last Name" := RegistrationHeader."Passenger Last Name";
        PostedHeader."Passenger ID" := RegistrationHeader."Passenger ID";
        PostedHeader."Issued By" := RegistrationHeader."Issued By";
        PostedHeader."Ticket No." := RegistrationHeader."Ticket No.";
        PostedHeader."Ticket Sold" := RegistrationHeader.Registered;
        PostedHeader."Registration No." := RegistrationHeader."Registration No.";
        PostedHeader."Seat Code" := RegistrationHeader."Seat Code";
        PostedHeader."Posting Date" := RegistrationHeader."Posting Date";
        PostedHeader."Amount Of Luggage" := RegistrationHeader."Amount Of Luggage";
        PostedHeader."Luggage weight" := RegistrationHeader."Luggage weight";
        PostedHeader."Additional Luggage Cost" := RegistrationHeader."Additional Luggage Cost";
        PostedHeader."Ticket Price" := RegistrationHeader."Ticket Price";
        PostedHeader."Total Purchase Amount" := RegistrationHeader."Total Purchase Amount";
        PostedHeader."Total Amount" := RegistrationHeader."Total Amount";
        PostedHeader.Insert(true);
        RegistrationHeader.DELETE;
        PostJournalToLedger2
    end;

    [Scope('Internal')]
    procedure FinishRegistration(RegistrationHeader: Record "Registration Header")
    begin
    end;

    [Scope('Internal')]
    procedure IsBoardingFinished(RegistrationHeader: Record "Registration Header")
    var
        i: Integer;
    begin
    end;

    local procedure InitNextEntryNo2()
    var
        JournalLines: Record "Journal Line";
    begin
        JournalLines.LockTable;
        if JournalLines.FindLast then begin
            NextEntryNo2 := JournalLines."Line No." + 1;
        end else begin
            NextEntryNo2 := 1;
        end;
    end;

    [Scope('Internal')]
    procedure PostJournalToLedger2()
    var
        JournalLine: Record "Journal Line";
        generalLedger: Record "Ledger Entry";
    begin
        repeat
            if (JournalLine."Document No." <> '') and (JournalLine."Passenger No." <> '') then begin
                generalLedger.Init;
                InitNextEntryNo;
                generalLedger."Entry No." := NextEntryNo;
                generalLedger."Posting Date" := JournalLine."Posting Date";
                generalLedger."Document No." := JournalLine."Document No.";
                generalLedger."Passenger No." := JournalLine."Passenger No.";
                generalLedger."Flight No." := JournalLine."Flight No.";
                generalLedger."Airlines Name" := JournalLine."Airlines Name";
                generalLedger."Flight Date" := JournalLine."Flight Date";
                generalLedger."Departure Time" := JournalLine."Departure Time";
                generalLedger."Ticket No." := JournalLine."Ticket No.";
                generalLedger."Registration No." := JournalLine."Registration No.";
                generalLedger."Seat Code" := JournalLine."Seat Code";
                generalLedger."Amount Of Luggage" := JournalLine."Amount Of Luggage";
                generalLedger."Luggage No." := JournalLine."Luggage No.";
                generalLedger."Ticket Price" := JournalLine."Ticket Price";
                generalLedger."Total Purchase Amount" := JournalLine."Total Purchase Amount";
                generalLedger."Total Amount" := JournalLine."Total Amount";
                generalLedger."Checked In" := false;
                generalLedger.Insert(true);
                JournalLine.Delete;
            end;
        until JournalLine.Next = 0;
    end;
}

