pageextension 50010 pageextension50010 extends "Sales Order"
{
    layout
    {
        addafter(SalesLines)
        {
            part(Dimensions; "Dimension Set Entry Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Dimension Set ID" = FIELD("Dimension Set ID");
            }
        }
    }
    actions
    {
        addafter(Dimensions)
        {
            action("Add Dimension")
            {
                ApplicationArea = All;
                Caption = 'Add Dimension';
                Image = Add;
                Promoted = true;
                PromotedCategory = Category8;

                trigger OnAction()
                var
                    DimSetEntry: Record "Dimension Set Entry" temporary;
                    DimSetID: Integer;
                    DimensionManagement: Codeunit DimensionManagement;
                begin
                    /*DimSetEntry.INIT;
                    DimSetEntry."Dimension Code" := 'PROJECT';
                    DimSetEntry."Dimension Value Code" := 'MERCEDES';
                    DimSetEntry."Dimension Set ID" := "Dimension Set ID";
                    DimSetEntry.INSERT(TRUE);
                    MESSAGE('Dimension is added');*/

                    DimensionManagement.GetDimensionSet(DimSetEntry, "Dimension Set ID");
                    DimSetEntry.Init;
                    DimSetEntry."Dimension Code" := 'PROJECT';
                    DimSetEntry."Dimension Value Code" := 'MERCEDES';
                    DimSetEntry.Insert(true);
                    "Dimension Set ID" := DimensionManagement.GetDimensionSetID(DimSetEntry);
                    Modify;

                end;
            }
            action("Delete Dimension")
            {
                ApplicationArea = All;
                Caption = 'Delete Dimension';
                Image = Delete;
                Promoted = true;
                PromotedCategory = Category8;

                trigger OnAction()
                var
                    DimSetEntry: Record "Dimension Set Entry";
                begin
                    DimSetEntry.SetRange("Dimension Set ID", Rec."Dimension Set ID");
                    DimSetEntry.SetRange("Dimension Code", 'PROJECT');
                    DimSetEntry.SetRange("Dimension Value Code", 'MERCEDES');
                    if DimSetEntry.FindSet then begin
                        DimSetEntry.DeleteAll;
                        Modify;
                    end;
                    Message('Dimension is deleted');
                end;
            }
        }
    }
}

