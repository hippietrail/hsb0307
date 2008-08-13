SET  ARITHABORT, CONCAT_NULL_YIELDS_NULL, ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, QUOTED_IDENTIFIER ON 
SET  NUMERIC_ROUNDABORT OFF
GO
:setvar DatabaseName "SecurityDatabase"
:setvar PrimaryFilePhysicalName "d:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\SecurityDatabase.mdf"
:setvar PrimaryLogFilePhysicalName "d:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\SecurityDatabase_log.ldf"

USE [master]

GO

:on error exit

IF  (DB_ID(N'$(DatabaseName)') IS NOT NULL
    AND DATABASEPROPERTYEX(N'$(DatabaseName)','Status') <> N'ONLINE')
BEGIN
    RAISERROR(N'目标数据库 %s 的状态未设置为 ONLINE。要部署此数据库，数据库状态必须设置为 ONLINE。', 16, 127,N'$(DatabaseName)') WITH NOWAIT
    RETURN
END
GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL)
BEGIN
    IF ((SELECT CAST(value AS nvarchar(128))
	    FROM 
		    [$(DatabaseName)]..fn_listextendedproperty('microsoft_database_tools_deploystamp', null, null, null, null, null, null )) 
	    = CAST(N'3163bec0-9dd8-4c67-9c44-2312ffd3b89a' AS nvarchar(128)))
    BEGIN
	    RAISERROR(N'由于脚本已经部署到目标服务器，因此跳过了部署。', 16 ,100) WITH NOWAIT
	    RETURN
    END
END
GO


:on error exit

CREATE DATABASE [$(DatabaseName)] ON ( NAME = N'PrimaryFileName', FILENAME = N'$(PrimaryFilePhysicalName)') LOG ON ( NAME = N'PrimaryLogFileName', FILENAME = N'$(PrimaryLogFilePhysicalName)') COLLATE SQL_Latin1_General_CP1_CS_AS 

GO

:on error resume
     
EXEC sp_dbcmptlevel N'$(DatabaseName)', 90

GO

IF EXISTS (SELECT 1 FROM [sys].[databases] WHERE [name] = N'$(DatabaseName)') 
    ALTER DATABASE [$(DatabaseName)] SET  
	ALLOW_SNAPSHOT_ISOLATION OFF
GO

IF EXISTS (SELECT 1 FROM [sys].[databases] WHERE [name] = N'$(DatabaseName)') 
    ALTER DATABASE [$(DatabaseName)] SET  
	READ_COMMITTED_SNAPSHOT OFF
GO

IF EXISTS (SELECT 1 FROM [sys].[databases] WHERE [name] = N'$(DatabaseName)') 
    ALTER DATABASE [$(DatabaseName)] SET  
	MULTI_USER,
	CURSOR_CLOSE_ON_COMMIT OFF,
	CURSOR_DEFAULT LOCAL,
	AUTO_CLOSE OFF,
	AUTO_CREATE_STATISTICS ON,
	AUTO_SHRINK OFF,
	AUTO_UPDATE_STATISTICS ON,
	AUTO_UPDATE_STATISTICS_ASYNC ON,
	ANSI_NULL_DEFAULT ON,
	ANSI_NULLS ON,
	ANSI_PADDING ON,
	ANSI_WARNINGS ON,
	ARITHABORT ON,
	CONCAT_NULL_YIELDS_NULL ON,
	NUMERIC_ROUNDABORT OFF,
	QUOTED_IDENTIFIER ON,
	RECURSIVE_TRIGGERS OFF,
	RECOVERY FULL,
	PAGE_VERIFY NONE,
	DISABLE_BROKER,
	PARAMETERIZATION SIMPLE
	WITH ROLLBACK IMMEDIATE
GO

IF IS_SRVROLEMEMBER ('sysadmin') = 1
BEGIN

IF EXISTS (SELECT 1 FROM [sys].[databases] WHERE [name] = N'$(DatabaseName)') 
    EXEC sp_executesql N'
    ALTER DATABASE [$(DatabaseName)] SET  
	DB_CHAINING OFF,
	TRUSTWORTHY OFF'

END
ELSE
BEGIN
    RAISERROR(N'无法为 DB_CHAINING 或 TRUSTWORTHY 修改数据库设置。您必须是 SysAdmin 才能应用这些设置。',0,1)
END

GO

USE [$(DatabaseName)]

GO
/*
 预先部署脚本模板							
--------------------------------------------------------------------------------------
 此文件包含将在生成脚本前执行的 SQL 语句	
 使用 SQLCMD 语法将文件包含在预先部署脚本中			
 示例:      :r .\filename.sql								
 使用 SQLCMD 语法引用预先部署脚本中的变量		
 示例:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
GO

:on error exit

:on error resume
GO

GO
/*
-- 后期部署脚本模板							
----------------------------------------------------------------------------------------
-- 此文件包含将追加到生成脚本的 SQL 语句		
-- 使用 SQLCMD 语法将文件包含到后期部署脚本中			
-- 示例:      :r .\filename.sql								
-- 使用 SQLCMD 语法引用后期部署脚本中的变量		
-- 示例:      :setvar $TableName MyTable							
--               SELECT * FROM [$(TableName)]					
----------------------------------------------------------------------------------------
*/
USE [$(DatabaseName)]
IF ((SELECT COUNT(*) 
	FROM 
		::fn_listextendedproperty( 'microsoft_database_tools_deploystamp', null, null, null, null, null, null )) 
	> 0)
BEGIN
	EXEC [dbo].sp_dropextendedproperty 'microsoft_database_tools_deploystamp'
END
EXEC [dbo].sp_addextendedproperty 'microsoft_database_tools_deploystamp', N'3163bec0-9dd8-4c67-9c44-2312ffd3b89a'
GO

