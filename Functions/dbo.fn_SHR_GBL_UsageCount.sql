SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_UsageCount](@Count int, @Date [smalldatetime])
RETURNS [nvarchar](100) WITH EXECUTE AS CALLER
AS 
BEGIN
DECLARE	@returnStr nvarchar(100)
		
IF @Date IS NULL BEGIN
	SET @returnStr = cioc_shared.dbo.fn_SHR_STP_ObjectName('Unknown')
END ELSE BEGIN
	SET @returnStr = CAST(@Count AS nvarchar(30)) + ' (' + cioc_shared.dbo.fn_SHR_STP_ObjectName('as of') + ' ' + cioc_shared.dbo.fn_SHR_GBL_DateString(@Date) + ')'
END
RETURN @returnStr
END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_UsageCount] TO [cioc_login_role]
GRANT REFERENCES ON  [dbo].[fn_SHR_GBL_UsageCount] TO [cioc_maintenance_role]
GO
