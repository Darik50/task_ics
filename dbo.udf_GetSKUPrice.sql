create function dbo.udf_GetSKUPrice(@ID_SKU int)
returns decimal(18, 2)
as
begin
    declare @Cost decimal(18, 2);
    select @Cost = cast(sum(Value) as decimal(18, 2)) / cast(sum(Quantity)as decimal(18, 2))
    from dbo.Basket
    where ID_SKU = @ID_SKU;
    return @Cost;
end;
