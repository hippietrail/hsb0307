-- =============================================
-- Script Template
-- =============================================
INSERT INTO [dbo].[aspnet_SchemaVersions] (
	[Feature],
	[CompatibleSchemaVersion],
	[IsCurrentVersion]
)
	SELECT 'common', '1', 1 UNION
	SELECT 'health monitoring', '1', 1 UNION
	SELECT 'membership', '1', 1 UNION
	SELECT 'personalization', '1', 1 UNION
	SELECT 'profile', '1', 1 UNION
	SELECT 'role manager', '1', 1
	
GO