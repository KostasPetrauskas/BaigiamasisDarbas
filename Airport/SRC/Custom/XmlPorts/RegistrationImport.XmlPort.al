xmlport 50040 "Registration Import"
{
    Direction = Import;
    FieldDelimiter = '<>';
    FieldSeparator = ';';
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(root)
        {
            tableelement("Registration Header"; "Registration Header")
            {
                XmlName = 'Registration';
                fieldelement(FlightNo; "Registration Header"."Flight No.")
                {
                }
                fieldelement(FlightDate; "Registration Header"."Flight Date")
                {
                }
                fieldelement(DepartureTime; "Registration Header"."Departure Time")
                {
                }
                fieldelement(Name; "Registration Header"."Passenger Name")
                {
                }
                fieldelement(LastName; "Registration Header"."Passenger Last Name")
                {
                }
                fieldelement(ID; "Registration Header"."Passenger ID")
                {
                }
                fieldelement(TicketNo; "Registration Header"."Ticket No.")
                {
                }
                fieldelement(RegistrationNo; "Registration Header"."Registration No.")
                {
                }
                fieldelement(SeatCode; "Registration Header"."Seat Code")
                {
                }
                fieldelement(AmountOfLuggage; "Registration Header"."Amount Of Luggage")
                {
                }
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

