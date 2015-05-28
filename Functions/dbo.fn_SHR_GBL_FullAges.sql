SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_FullAges](
	@MinAge [float],
	@MaxAge [float]
)
RETURNS nvarchar(50) WITH EXECUTE AS CALLER
AS 
BEGIN 

DECLARE @returnStr nvarchar(50),
		@YearsObjectName nvarchar(60)

SET @YearsObjectName = dbo.fn_SHR_STP_ObjectName(' year(s)')

SET @returnStr = ''
IF @MinAge IS NOT NULL AND @MinAge <> 0 BEGIN
	SET @returnStr = dbo.fn_SHR_GBL_FloatString(@MinAge) + @YearsObjectName
	IF @MaxAge IS NOT NULL BEGIN
		SET @returnStr = @returnStr + dbo.fn_SHR_STP_ObjectName(' - ') + dbo.fn_SHR_GBL_FloatString(@MaxAge) + @YearsObjectName
	END ELSE BEGIN
		SET @returnStr = @returnStr + dbo.fn_SHR_STP_ObjectName(' and up')
	END
END ELSE BEGIN
	IF @MaxAge IS NOT NULL BEGIN
		SET @returnStr = CAST(@MaxAge AS varchar) + @YearsObjectName + dbo.fn_SHR_STP_ObjectName(' and under')
	END
END
IF @returnStr = '' SET @returnStr = NULL
RETURN  @returnStr
END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_FullAges] TO [cioc_login_role]
GO
