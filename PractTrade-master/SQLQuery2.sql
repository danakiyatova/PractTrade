create database [TradeDB]
go
use [TradeDB]
go

create table [UserInfo]
(
	UserInfoID int primary key identity,
	UserSurname nvarchar(100) not null,
	UserName nvarchar(100) not null,
	UserPatronymic nvarchar(100) not null,
)
go

create table [Role]
(
	RoleID int primary key identity,
	RoleName nvarchar(100) not null
)
go

create table [User]
(
	UserID int primary key identity,
	UserInfo int foreign key references [UserInfo](UserInfoID) not null,
	UserLogin nvarchar(max) not null,
	UserPassword nvarchar(max) not null,
	UserRole int foreign key references [Role](RoleID) not null
)
go

create table [City]
(
	CityID int primary key identity,
	CityName nvarchar(100) not null,
)
go

create table [Street]
(
	StreetID int primary key identity,
	StreetName nvarchar(100) not null,
)
go

create table [Status]
(
	StatusID int primary key identity,
	StatusName nvarchar(100) not null,
)
go

create table [PickupPoint]
(
	PickupPointID int primary key identity,
	IndexPickupPoint int not null,
	City int foreign key references [City](CityID) not null,
	Street int foreign key references [Street](StreetID) not null,
	House int not null
)
go
create table [Order]
(
	OrderID int primary key identity,
	OrderNumber int not null,
	OrderNontents nvarchar(max) not null,
	OrderDate datetime not null,
	OrderDeliveryDate datetime not null,
	OrderPickupPoint int foreign key references [PickupPoint](PickupPointID) not null,
	OrderInfo int foreign key references [UserInfo](UserInfoID) null,
	OrderCodeToObtain int not null,
	OrderStatus int foreign key references [Status](StatusID) not null,
)
go
create table [TovarName]
(
	TovarNameID int primary key identity,
	TovarName nvarchar(150) not null,
)
go
create table [Provider]
(
	ProviderID int primary key identity,
	ProviderName nvarchar(150) not null,
)
go
create table [Manufacturer]
(
	ManufacturerID int primary key identity,
	ManufacturerName nvarchar(150) not null,
)
go
create table [Tovar]
(
	TovarID int primary key identity,
	TovarName int foreign key references [TovarName](TovarNameID) not null,
	TovarManufacturer int foreign key references [Manufacturer](ManufacturerID) not null,
	TovarProvider int foreign key references [Provider](ProviderID) not null,
	TovarDescription nvarchar(max) not null,
)
go
create table [Category]
(
	CategoryID int primary key identity,
	CategoryName nvarchar(150) not null,
)
go
create table [Unit]
(
	UnitID int primary key identity,
	UnitName nvarchar(50) not null,
)
go
create table Product
(
	ProductArticle nvarchar(50) primary key,
	ProductTovar int foreign key references [Tovar](TovarID) not null,
	ProductMeasurementUnit int foreign key references [Unit](UnitID) not null,
	ProductCost decimal(19,4) not null,
	ProductMaximumDiscountAmount tinyint null,
	ProductCategory int foreign key references [Category](CategoryID) not null,
	ProductDiscountAmount tinyint null,
	ProductQuantityInStock int not null,
	ProductPhoto image null,
)
go
create table OrderProduct
(
	OrderID int foreign key references [Order](OrderID) not null,
	ProductArticle nvarchar(50) foreign key references Product(ProductArticle) not null,
	Primary key (OrderID,ProductArticle)
)
go