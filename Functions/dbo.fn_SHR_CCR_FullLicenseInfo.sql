SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_SHR_CCR_FullLicenseInfo](
	@LICENSE_NUMBER nvarchar(50),
	@LICENSE_RENEWAL smalldatetime,
	@LC_TOTAL smallint,
	@LC_INFANT smallint,
	@LC_TODDLER smallint,
	@LC_PRESCHOOL smallint,
	@LC_KINDERGARTEN smallint,
	@LC_SCHOOLAGE smallint,
	@LC_NOTES nvarchar(max)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 

DECLARE @conStr nvarchar(4),
		@returnStr nvarchar(max),
		@capacityStr nvarchar(1000),
		@capacityConStr nvarchar(3),
		@colonStr nvarchar(3),
		@semiColonStr nvarchar(3),
		@openBr nvarchar(2),
		@closeBr nvarchar(2)

SET @returnStr = ''
SET @conStr = ''
SET @capacityStr = ''
SET @capacityConStr = ''
SET @colonStr = dbo.fn_SHR_STP_ObjectName(': ')
SET @semiColonStr = cioc_shared.dbo.fn_SHR_STP_ObjectName(' ; ')
SET @openBr = cioc_shared.dbo.fn_SHR_STP_ObjectName(' (')
SET @closeBr = cioc_shared.dbo.fn_SHR_STP_ObjectName(')')

IF @LICENSE_NUMBER IS NOT NULL BEGIN
	SET @returnStr = @returnStr + @conStr + dbo.fn_SHR_STP_ObjectName('License Number') + @colonStr + @LICENSE_NUMBER
	SET @conStr = CHAR(13) + CHAR(10)
END
IF @LICENSE_RENEWAL IS NOT NULL BEGIN
	SET @returnStr = @returnStr + @conStr + dbo.fn_SHR_STP_ObjectName('License Renewal') + @colonStr + dbo.fn_SHR_GBL_DateString(@LICENSE_RENEWAL)
	SET @conStr = CHAR(13) + CHAR(10)
END

IF @returnStr <> '' AND @returnStr IS NOT NULL
	SET @conStr = CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10)

IF @LC_TOTAL > 0 BEGIN
	SET @capacityStr = @capacityStr + @capacityConStr + dbo.fn_SHR_STP_ObjectName('Total') + @openBr + CAST(@LC_TOTAL AS varchar) + @closeBr 
	SET @capacityConStr = @semiColonStr
END
IF @LC_INFANT > 0 BEGIN
	SET @capacityStr = @capacityStr + @capacityConStr + dbo.fn_SHR_STP_ObjectName('Infant') + @openBr + CAST(@LC_INFANT AS varchar) + @closeBr 
	SET @capacityConStr = @semiColonStr
END
IF @LC_TODDLER > 0 BEGIN
	SET @capacityStr = @capacityStr + @capacityConStr + dbo.fn_SHR_STP_ObjectName('Toddler') + @openBr + CAST(@LC_TODDLER AS varchar) + @closeBr 
	SET @capacityConStr = @semiColonStr
END
IF @LC_PRESCHOOL > 0 BEGIN
	SET @capacityStr = @capacityStr + @capacityConStr + dbo.fn_SHR_STP_ObjectName('Preschool') + @openBr + CAST(@LC_PRESCHOOL AS varchar) + @closeBr 
	SET @capacityConStr = @semiColonStr
END
IF @LC_KINDERGARTEN > 0 BEGIN
	SET @capacityStr = @capacityStr + @capacityConStr + dbo.fn_SHR_STP_ObjectName('Kindergarten') + @openBr + CAST(@LC_KINDERGARTEN AS varchar) + @closeBr 
	SET @capacityConStr = @semiColonStr
END
IF @LC_SCHOOLAGE > 0 BEGIN
	SET @capacityStr = @capacityStr + @capacityConStr + dbo.fn_SHR_STP_ObjectName('School Age') + @openBr + CAST(@LC_SCHOOLAGE AS varchar) + @closeBr 
	SET @capacityConStr = @semiColonStr
END

IF @capacityStr IS NOT NULL AND @capacityStr <> '' BEGIN
	SET @returnStr = @returnStr + @conStr + dbo.fn_SHR_STP_ObjectName('License Capacity') + @colonStr + @capacityStr
	SET @conStr = CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10)
END

IF @LC_NOTES IS NOT NULL BEGIN
	IF @returnStr <> '' AND @returnStr IS NOT NULL
		SET @conStr = CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10)
	SET @returnStr = @returnStr + @conStr + @LC_NOTES
END
IF @returnStr = '' SET @returnStr = NULL
RETURN @returnStr

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CCR_FullLicenseInfo] TO [cioc_login_role]
GRANT EXECUTE ON  [dbo].[fn_SHR_CCR_FullLicenseInfo] TO [cioc_maintenance_role]
GO
