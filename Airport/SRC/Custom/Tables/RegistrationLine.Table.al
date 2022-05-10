table 50050 "Registration Line"
{

    fields
    {
        field(10; "Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Registration Header"."No.";
        }
        field(20; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(30; "Luggage No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item WHERE("Is Luggage" = CONST(true));

            trigger OnValidate()
            var
                LuggagePrice: Record "Luggage Price";
                RegistrationHeader: Record "Registration Header";
                RegistrationLine: Record "Registration Line";
                RegistrationNo: Code[20];
            begin
                LuggagePrice.Get("Luggage No.");
                "Luggage Price" := LuggagePrice.Price;

                /*RegistrationNo := "Registration No.";
                RegistrationLine.SETFILTER("Registration No.",RegistrationNo);
                IF RegistrationLine.FINDSET THEN BEGIN
                  REPEAT
                    RegistrationHeader.GET("Registration No.");
                    RegistrationHeader."Total Amount" := 0;
                    RegistrationHeader."Total Amount" := RegistrationHeader."Total Amount" + "Luggage Price" + RegistrationHeader."Additional Luggage Cost" + RegistrationHeader."Ticket Price";
                    RegistrationHeader.MODIFY;
                  UNTIL RegistrationLine.NEXT = 0;
                END;*/
                //RegistrationHeader.VALIDATE("Ticket Price");

                /*RegistrationHeader.SETFILTER(RegistrationHeader."Registration No.","Registration No.");
                IF RegistrationHeader.FINDSET THEN BEGIN
                  //RegistrationHeader."Total Amount" := RegistrationHeader."Total Purchase Amount";
                  //RegistrationHeader."Total Amount" := RegistrationHeader."Total Amount" + RegistrationHeader."Total Purchase Amount" + RegistrationHeader."Additional Luggage Cost" + RegistrationHeader."Ticket Price";
                  //RegistrationHeader.MODIFY;
                  MESSAGE('%1',RegistrationHeader."Passenger Name");
                END;*/

            end;
        }
        field(35; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Luggage Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Registration No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    [Scope('OnPrem')]
    procedure CalcLuggagePrice()
    var
        LuggagePrice: Record "Luggage Price";
    begin
        /*LuggagePrice.SETFILTER("Item No.","Luggage No.");
        IF LuggagePrice.FINDSET THEN BEGIN
        
        END;*/

    end;
}

