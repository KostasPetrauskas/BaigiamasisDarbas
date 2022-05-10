xmlport 50000 "Flights Import"
{
    DefaultFieldsValidation = true;
    Direction = Import;
    FieldDelimiter = '<None>';
    FieldSeparator = ';';
    Format = VariableText;

    schema
    {
        textelement(root)
        {
            tableelement(Flights; Flights)
            {
                MinOccurs = Zero;
                XmlName = 'Flights';
                fieldelement(FlightNo; Flights."Flight No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(FlightDate; Flights."Flight Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(DepartureTime; Flights."Departure Time")
                {
                    MinOccurs = Zero;
                }
                fieldelement(AirplaneModel; Flights."Airplane Model")
                {
                    MinOccurs = Zero;
                }
                fieldelement(NoOfSeats; Flights."No. of Seats")
                {
                    MinOccurs = Zero;
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

