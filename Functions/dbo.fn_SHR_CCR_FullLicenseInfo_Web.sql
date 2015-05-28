SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CCR_FullLicenseInfo_Web](
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

DECLARE @returnStr nvarchar(max),
		@capacityStr nvarchar(1000),
		@colonStr nvarchar(3)

SET @returnStr = ''
SET @capacityStr = ''

SET @colonStr = dbo.fn_SHR_STP_ObjectName(': ')

IF @LICENSE_NUMBER IS NOT NULL BEGIN
	SET @returnStr = '<strong>' + dbo.fn_SHR_STP_ObjectName('License Number') + @colonStr + '</strong>'
		+ @LICENSE_NUMBER
END
IF @LICENSE_RENEWAL IS NOT NULL BEGIN
	SET @returnStr = @returnStr + CASE WHEN @LICENSE_NUMBER IS NOT NULL THEN '<br>' ELSE '' END
		+ '<strong>' + dbo.fn_SHR_STP_ObjectName('License Renewal') + @colonStr + '</strong>'
		+ dbo.fn_SHR_GBL_DateString(@LICENSE_RENEWAL)
END

IF @LC_TOTAL > 0 BEGIN
	SET @capacityStr = @capacityStr + '<tr><td>' + dbo.fn_SHR_STP_ObjectName('Total') + '</td><td>' + CAST(@LC_TOTAL AS varchar) + '</td></tr>'
END
IF @LC_INFANT > 0 BEGIN
	SET @capacityStr = @capacityStr + '<tr><td>' + dbo.fn_SHR_STP_ObjectName('Infant') + '</td><td>' + CAST(@LC_INFANT AS varchar) + '</td></tr>'
END
IF @LC_TODDLER > 0 BEGIN
	SET @capacityStr = @capacityStr + '<tr><td>' + dbo.fn_SHR_STP_ObjectName('Toddler') + '</td><td>' + CAST(@LC_TODDLER AS varchar) + '</td></tr>'
END
IF @LC_PRESCHOOL > 0 BEGIN
	SET @capacityStr = @capacityStr + '<tr><td>' + dbo.fn_SHR_STP_ObjectName('Preschool') + '</td><td>' + CAST(@LC_PRESCHOOL AS varchar) + '</td></tr>'
END
IF @LC_KINDERGARTEN > 0 BEGIN
	SET @capacityStr = @capacityStr + '<tr><td>' + dbo.fn_SHR_STP_ObjectName('Kindergarten') + '</td><td>' + CAST(@LC_KINDERGARTEN AS varchar) + '</td></tr>'
END
IF @LC_SCHOOLAGE > 0 BEGIN
	SET @capacityStr = @capacityStr + '<tr><td>' + dbo.fn_SHR_STP_ObjectName('School Age') + '</td><td>' + CAST(@LC_SCHOOLAGE AS varchar) + '</td></tr>'
END

IF @capacityStr IS NOT NULL AND @capacityStr <> '' BEGIN
	SET @returnStr = @returnStr + CASE WHEN @returnStr = '' THEN '' ELSE '<br>&nbsp;' END
		+ '<table class="BasicBorder" border="1" cellpadding="2" cellspacing="0">'
		+ '<tr><th colspan="2">' + dbo.fn_SHR_STP_ObjectName('License Capacity') + '</th></tr>'
		+ @capacityStr
		+ '</table>'
END

IF @LC_NOTES IS NOT NULL BEGIN
	SET @returnStr = @returnStr + CASE WHEN @returnStr = '' THEN '' ELSE '<br>' END
		+ @LC_NOTES
END

IF @returnStr = '' SET @returnStr = NULL

RETURN @returnStr

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CCR_FullLicenseInfo_Web] TO [cioc_login_role]
GO
