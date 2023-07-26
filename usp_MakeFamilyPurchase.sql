create procedure dbo.usp_MakeFamilyPurchase
    @FamilySurName varchar(255)
as
begin
    if not exists (select * from dbo.Family where surname = @FamilySurName)
    begin
        raiserror('Такой семьи нет', 10, 1);
        return;
    end;
    update dbo.Family
    set BudgetValue = f.BudgetValue - b.SumValue
    from dbo.Family f
    join (
        select ID_Family, sum(Value) as SumValue
        from dbo.Basket
        group by ID_Family
    ) b on f.ID = b.ID_Family
    where f.SurName = @FamilySurName;
end;
