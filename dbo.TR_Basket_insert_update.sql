DROP TRIGGER dbo.TR_Basket_insert_update;
go
create trigger dbo.TR_Basket_insert_update
on dbo.Basket
after insert
as
begin
    update dbo.Basket
    set DiscountValue = case
                           when b2.CountSKU >= 2 then b.Value * 0.05
                           else 0
                       end
    from dbo.Basket b
    join (
        select ID_SKU, count(*) as CountSKU
        from inserted
        group by ID_SKU
    ) b2 on b.ID_SKU = b2.ID_SKU
    where b.ID in (select ID from inserted);
end;
