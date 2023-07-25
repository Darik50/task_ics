create table dbo.SKU (
    ID int identity(1,1) primary key,
    Code as 's' + cast(id as varchar(10)) persisted unique,
    Name varchar(255)
);
create table dbo.Family (
    ID int identity(1,1) primary key,
    SurName varchar(255),
	BudgetValue int
);
create table dbo.Basket (
    ID int identity(1,1) primary key,
    ID_SKU int,
    ID_Family int,
    Quantity int check (Quantity >= 0),
    Value int check (Value >= 0),
    PurchaseDate datetime default getdate(),
    DiscountValue int,
    foreign key (ID_SKU) references dbo.sku(ID),
    foreign key (ID_Family) references dbo.family(ID)
);
