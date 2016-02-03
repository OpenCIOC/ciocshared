
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[sp_SHR_STP_RecordOwner_ListGen]
WITH EXECUTE AS CALLER
AS
SET NOCOUNT ON

DELETE FROM SHR_RecordOwner

EXEC master.sys.sp_MSforeachdb 'USE [?]

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME=''GBL_Agency'') BEGIN

INSERT INTO cioc_shared.dbo.SHR_RecordOwner (
	AgencyCode,
	DbName,
	UserCount,
	UserTaxonomyCount,
	CICRecordCount,
	VOLRecordCount,
	ORG_LEVEL_1,
	ORG_LEVEL_2,
	ORG_LEVEL_3,
	ORG_LEVEL_4,
	ORG_LEVEL_5
)
SELECT a.AgencyCode,
	''?'' AS DbName,
	(SELECT COUNT(*) FROM GBL_Users u
		WHERE Inactive=0 AND Agency=a.AgencyCode) AS UserCount,
	(SELECT COUNT(*) FROM GBL_Users u
		INNER JOIN CIC_SecurityLevel sl ON u.SL_ID_CIC=sl.SL_ID
			AND ((sl.CanIndexTaxonomy=1 OR sl.SuperUser=1)
				AND EXISTS(SELECT * FROM STP_Member mem WHERE mem.UseTaxonomy=1)
				)
		WHERE Inactive=0 AND Agency=a.AgencyCode) AS UserTaxonomyCount,
	(SELECT COUNT(*) FROM GBL_BaseTable bt WHERE bt.RECORD_OWNER=a.AgencyCode AND EXISTS(SELECT * FROM GBL_BaseTable_Description btd WHERE btd.NUM=bt.NUM AND btd.DELETION_DATE IS NULL)) AS CICRecordCount,
	(SELECT COUNT(*) FROM VOL_Opportunity vo WHERE vo.RECORD_OWNER=a.AgencyCode AND (vo.DISPLAY_UNTIL IS NULL OR vo.DISPLAY_UNTIL > GETDATE()) AND EXISTS(SELECT * FROM VOL_Opportunity_Description vod WHERE vod.OP_ID=vo.OP_ID AND vod.DELETION_DATE IS NULL)) AS VOLRecordCount,
	btd.ORG_LEVEL_1, btd.ORG_LEVEL_2, btd.ORG_LEVEL_3, btd.ORG_LEVEL_4, btd.ORG_LEVEL_5
FROM GBL_Agency a
LEFT JOIN GBL_BaseTable_Description btd
	ON ISNULL(a.AgencyNUMCIC,a.AgencyNUMVOL)=btd.NUM
		AND LangID=(SELECT TOP 1 LangID FROM GBL_BaseTable_Description WHERE NUM=btd.NUM ORDER BY LangID)

END'


SET NOCOUNT OFF
GO
