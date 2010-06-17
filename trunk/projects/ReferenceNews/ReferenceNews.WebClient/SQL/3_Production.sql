USE [DigitalPublishDB]
GO
/****** Object:  Table [Production].[Product]    Script Date: 06/13/2010 16:19:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Production].[Product]') AND type in (N'U'))
DROP TABLE [Production].[Product]
GO
/****** Object:  Table [Production].[ProductCategory]    Script Date: 06/13/2010 16:19:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Production].[ProductCategory]') AND type in (N'U'))
DROP TABLE [Production].[ProductCategory]
GO

/****** Object:  Table [Production].[Product]    Script Date: 06/13/2010 16:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RowId] [uniqueidentifier] NOT NULL,
	[ProductId] [varchar](128) NULL,
	[Category] [int] NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Specification] [nvarchar](2048) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[StandardPrice] [money] NOT NULL CONSTRAINT [DF_Product_BasePrice]  DEFAULT ((0)),
	[OrderPrice] [money] NOT NULL CONSTRAINT [DF_Product_OrderPrice]  DEFAULT ((0)),
	[Status] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Product_ModifiedDate]  DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Product_IsDeleted]  DEFAULT ((0)),
	[Description] [nvarchar](2048) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Production].[ProductCategory]    Script Date: 06/13/2010 16:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[RowId] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductCategory_ModifiedDate]  DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_ProductCategory_IsDeleted]  DEFAULT ((0)),
	[Description] [nvarchar](2048) NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
