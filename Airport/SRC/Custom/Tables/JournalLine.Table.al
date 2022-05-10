table 50120 "Journal Line"
{

    fields
    {
        field(10; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Passenger No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Flight No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70; "Airlines Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(80; From; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(90; Destination; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(100; "Flight Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(103; "Departure Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(107; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(110; "Ticket No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(120; "Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(130; "Seat Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(140; "Amount Of Luggage"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(150; "Luggage No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(153; "Ticket Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(155; "Total Purchase Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(160; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No." = '' then begin
            Setup.Get;
            Setup.TestField("Document Nos.");
            NoSeriesMgt.InitSeries(Setup."Document Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
    end;

    var
        Setup: Record Setup;
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

