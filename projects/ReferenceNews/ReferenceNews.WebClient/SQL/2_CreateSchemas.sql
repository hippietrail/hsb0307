USE [DigitalPublishDB]
GO

-- Production
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Production')
DROP SCHEMA [Production]
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Production')
EXEC sys.sp_executesql N'CREATE SCHEMA [Production] AUTHORIZATION [dbo]'
GO

-- Sales
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Sales')
DROP SCHEMA [Sales]
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Sales')
EXEC sys.sp_executesql N'CREATE SCHEMA [Sales] AUTHORIZATION [dbo]'
GO

-- Membership
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Membership')
DROP SCHEMA [Membership]
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Membership')
EXEC sys.sp_executesql N'CREATE SCHEMA [Membership] AUTHORIZATION [dbo]'
GO

-- Repository
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Repository')
DROP SCHEMA [Repository]
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Repository')
EXEC sys.sp_executesql N'CREATE SCHEMA [Repository] AUTHORIZATION [dbo]'
GO

-- Payment
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Payment')
DROP SCHEMA [Payment]
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Payment')
EXEC sys.sp_executesql N'CREATE SCHEMA [Payment] AUTHORIZATION [dbo]'
GO
