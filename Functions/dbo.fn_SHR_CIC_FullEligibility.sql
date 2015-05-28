SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CIC_FullEligibility](
	@MinAge float,
	@MaxAge float,
	@Eligibility nvarchar(max)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN

DECLARE @returnStr nvarchar(max)

SET @returnStr = dbo.fn_SHR_GBL_FullAges(@MinAge,@MaxAge)
IF @returnStr IS NULL SET @returnStr = ''

IF @returnStr <> '' SET @returnStr = dbo.fn_SHR_STP_ObjectName('Ages') + dbo.fn_SHR_STP_ObjectName(': ') + @returnStr
IF @Eligibility <> '' AND @Eligibility IS NOT NULL BEGIN
	IF @returnStr <> '' SET @returnStr = @returnStr + CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10)
	SET @returnStr = @returnStr + @Eligibility
END

IF @returnStr = '' SET @returnStr = NULL
RETURN @returnStr

END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_FullEligibility] TO [cioc_login_role]
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_FullEligibility] TO [cioc_maintenance_role]
GO
