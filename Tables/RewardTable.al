table 50100 Reward
{

    fields
    {
        field(1;"Reward ID";Code[30])
        {
        }
        field(2;"Description";Text[250])
        {
            NotBlank = true;
        }
        field(3;"Discount Percentage";Decimal)
        {
            MinValue = 0;
            MaxValue = 100;
            DecimalPlaces = 2;
        }
        field(4;"Minimum Purchase";Decimal)
        {
            MinValue = 0;
            DecimalPlaces = 2;
        }

        field(5;"Last Modified Date";Date)
        {
            // The "Editable" property sets a value that indicates whether the field can be edited 
            // through the UI.
            Editable = false;
        }
    }

    keys
    {
        key(PK;"Reward ID")
        {
            Clustered = true;
        }
    }
    
    var
        myInt : Integer;

    trigger OnInsert();
    begin
        SetLastModifiedDate;
    end;

    trigger OnModify();
    begin
        SetLastModifiedDate
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
        SetLastModifiedDate;
    end;

    local procedure SetLastModifiedDate();
    begin
        Rec."Last Modified Date" := Today;
    end;

}