CREATE TABLE [dbo].[Orders]
(
	[OrderId] INT NOT NULL PRIMARY KEY, 
    [UserId] NVARCHAR(50) NOT NULL, 
    [OrderType] NCHAR(10) NOT NULL, 
    [DeliveryAddress] NCHAR(10) NOT NULL, 
    [DeliveryDate] CHAR(10) NOT NULL, 
    [PaymentType] NCHAR(10) NOT NULL
)
