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
	    = CAST(N'c00e1b0d-88a6-4222-957e-9e53583bc2e9' AS nvarchar(128)))
    BEGIN
	    RAISERROR(N'由于脚本已经部署到目标服务器，因此跳过了部署。', 16 ,100) WITH NOWAIT
	    RETURN
    END
END
GO


:on error resume
     
:on error exit

IF (@@servername != 'HG-EIP\SQLEXPRESS')
BEGIN
    RAISERROR(N'生成脚本中的服务器名称 %s 与目标服务器的名称 %s 不匹配。请验证数据库项目设置是否正确以及生成脚本是否是最新的。', 16, 127,N'HG-EIP\SQLEXPRESS',@@servername) WITH NOWAIT
    RETURN
END
GO


DECLARE @sqlver as INT;
SET @sqlver = cast(((@@microsoftversion / 0x1000000) * 10) as int);
IF (@sqlver != 90)
BEGIN
    RAISERROR(N'生成脚本中的 SQL Server 版本 %i 与目标服务器上的版本 %i 不匹配。请验证数据库项目设置是否正确以及生成脚本是否是最新的。', 16, 127,90,@sqlver) WITH NOWAIT;
    RETURN;
END
GO


IF NOT EXISTS (SELECT 1 FROM [master].[dbo].[sysdatabases] WHERE [name] = N'SecurityDatabase')
BEGIN
    RAISERROR(N'不能将此更新脚本部署到目标 HG-EIP\SQLEXPRESS。此服务器上没有为此脚本生成的数据库 SecurityDatabase。', 16, 127) WITH NOWAIT
    RETURN
END
GO


IF (N'$(DatabaseName)' ! = N'SecurityDatabase')
BEGIN
    RAISERROR(N'生成脚本中的数据库名称 %s 与目标数据库的名称 %s 不匹配。请验证数据库项目设置是否正确以及生成脚本是否是最新的。', 16, 127,N'$(DatabaseName)',N'SecurityDatabase') WITH NOWAIT;
    RETURN
END
GO


DECLARE @dbcompatlvl as int;
SELECT  @dbcompatlvl = cmptlevel
FROM    [master].[dbo].[sysdatabases]
WHERE   [name] = N'$(DatabaseName)';
IF (ISNULL(@dbcompatlvl, 0) != 90)
BEGIN
    RAISERROR(N'生成脚本的数据库兼容级别 %i 与目标数据库的兼容级别 %i 不匹配。请验证数据库项目设置是否正确以及生成脚本是否是最新的。', 16, 127, 90, @dbcompatlvl) WITH NOWAIT;
    RETURN;
END
GO


IF CAST(DATABASEPROPERTY(N'$(DatabaseName)','IsReadOnly') as bit) = 1
BEGIN
    RAISERROR(N'由于生成此脚本的数据库 %s 已设置为 READ_ONLY，因此您不能部署此更新脚本。', 16, 127, N'$(DatabaseName)') WITH NOWAIT
    RETURN
END
GO

:on error resume
     
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
EXEC [dbo].sp_addextendedproperty 'microsoft_database_tools_deploystamp', N'c00e1b0d-88a6-4222-957e-9e53583bc2e9'
GO
