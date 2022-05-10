xmlport 50020 "Flight Destination Import"
{
    Direction = Import;
    FieldDelimiter = '<None>';
    FieldSeparator = ';';
    Format = VariableText;

    schema
    {
        textelement(root)
        {
            tableelement("Flight Destination"; "Flight Destination")
            {
                XmlName = 'FlightDestination';
                fieldelement(FlightNo; "Flight Destination"."Flight No.")
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

