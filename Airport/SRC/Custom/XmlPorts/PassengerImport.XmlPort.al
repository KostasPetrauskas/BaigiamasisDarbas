xmlport 50030 "Passenger Import"
{
    Direction = Import;
    FieldDelimiter = '<>';
    FieldSeparator = ';';
    Format = VariableText;

    schema
    {
        textelement(root)
        {
            tableelement(Passenger; Passenger)
            {
                XmlName = 'Passenger';
                fieldelement(FlightNo; Passenger."Flight No.")
                {
                }
                fieldelement(FlightDate; Passenger."Flight Date")
                {
                }
                fieldelement(Name; Passenger."Passenger Name")
                {
                }
                fieldelement(LastName; Passenger."Passenger Last Name")
                {
                }
                fieldelement(ID; Passenger."Passenger ID")
                {
                }
                fieldelement(TicketNo; Passenger."Ticket No.")
                {
                }
                fieldelement(RegistrationNo; Passenger."Registration No.")
                {
                }
                fieldelement(SeatCode; Passenger."Seat Code")
                {
                }
                fieldelement(AmoutOfLuggage; Passenger."Amount of Luggage")
                {
                }

                trigger OnAfterInsertRecord()
                var
                    RegistrationHeader: Record "Registration Header";
                    PassengerTable: Integer;
                begin
                    /*RegistrationHeader.INIT;
                    RegistrationHeader."Flight No." := Passenger."Flight No.";
                    
                    RegistrationHeader."Passenger No." := "No.";
                    RegistrationHeader."Flight Date" := Passenger."Flight Date";
                    RegistrationHeader."Passenger Name" := Passenger."Passenger Name";
                    RegistrationHeader."Passenger Last Name" := Passenger."Passenger Last Name";
                    RegistrationHeader."Passenger ID" := Passenger."Passenger ID";
                    RegistrationHeader."Ticket No." := Passenger."Ticket No.";
                    RegistrationHeader."Registration No." := Passenger."Registration No.";
                    RegistrationHeader."Seat Code" := Passenger."Seat Code";
                    RegistrationHeader."Amount Of Luggage" := Passenger."Amount of Luggage";
                    RegistrationHeader.INSERT(TRUE);*/

                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }
}

