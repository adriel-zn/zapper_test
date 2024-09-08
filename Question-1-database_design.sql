CREATE DATABASE Zapper;

USE Zapper;

CREATE TABLE MerchantCategory (
    Id INT PRIMARY KEY IDENTITY(1,1),
    [Name] VARCHAR(100) NOT NULL,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
	CreatedBy VARCHAR(200) NULL,
	ModifiedDate DATETIME NULL,
	ModifiedBy VARCHAR(200) NULL
);

CREATE TABLE Customers (
    Id INT PRIMARY KEY IDENTITY(1,1),
	Code VARCHAR(30) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20) NULL,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
	CreatedBy VARCHAR(200) NULL,
	ModifiedDate DATETIME NULL,
	ModifiedBy VARCHAR(200) NULL
);

CREATE TABLE Merchants (
    Id INT PRIMARY KEY IDENTITY(1,1),
	Code VARCHAR(30) NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    Category VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20) NULL,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
	CreatedBy VARCHAR(200) NULL,
	ModifiedDate DATETIME NULL,
	ModifiedBy VARCHAR(200) NULL
);

CREATE TABLE Transactions (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CustomerId INT NOT NULL FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
    MerchantId INT NOT NULL FOREIGN KEY (MerchantId) REFERENCES Merchants(Id),
    Amount DECIMAL(10, 2) NULL,
    TransactionDate DATETIME NOT NULL,
    [Status] INT NOT NULL DEFAULT 0, --'0 - Pending', '1 - Completed', '2 - Failed'
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
	CreatedBy VARCHAR(200) NULL,
	ModifiedDate DATETIME NULL,
	ModifiedBy VARCHAR(200) NULL
);


SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([Id], [Code], [FirstName], [LastName], [Email], [PhoneNumber], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'CUS0001', N'John', N'Smith', N'john.smith@abc.com', N'+27678883456', CAST(N'2024-09-08T23:57:00.023' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Merchants] ON 
GO
INSERT [dbo].[Merchants] ([Id], [Code], [Name], [Category], [Email], [PhoneNumber], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'MER0001', N'KFC', N'1', N'test@kfc.co.za', N'+27839993399', CAST(N'2024-09-08T23:59:07.647' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Merchants] ([Id], [Code], [Name], [Category], [Email], [PhoneNumber], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'MER0002', N'EDGARS', N'2', N'cpt@edgars.co.za', N'+27455533333', CAST(N'2024-09-09T00:00:30.420' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Merchants] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 
GO
INSERT [dbo].[Transactions] ([Id], [CustomerId], [MerchantId], [Amount], [TransactionDate], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, 2, CAST(345.89 AS Decimal(10, 2)), CAST(N'2024-09-07T00:00:00.000' AS DateTime), 0, CAST(N'2024-09-09T00:01:22.140' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[MerchantCategory] ON 
GO
INSERT [dbo].[MerchantCategory] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Restaurants', CAST(N'2024-09-08T23:57:50.007' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MerchantCategory] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Retail
', CAST(N'2024-09-08T23:57:57.720' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MerchantCategory] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'E-commerce', CAST(N'2024-09-08T23:58:02.020' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MerchantCategory] ([Id], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Technology', CAST(N'2024-09-08T23:58:05.253' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MerchantCategory] OFF
GO

