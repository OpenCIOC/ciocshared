SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_VOL_ScheduleDay](@Morning [bit], @Afternoon [bit], @Evening [bit], @Time [varchar](100))
RETURNS [varchar](200) WITH EXECUTE AS CALLER
AS 
BEGIN 
DECLARE	@conStr varchar(3),
		@returnStr varchar(200)
SET @returnStr = ''
SET @conStr = ''
IF @Morning=1 BEGIN
	SET @returnStr = @returnStr + @conStr + 'Morning'
	SET @conStr = ', '
END
IF @Afternoon=1 BEGIN
	SET @returnStr = @returnStr + @conStr + 'Afternoon'
	SET @conStr = ', '
END
IF @Evening=1 BEGIN
	SET @returnStr = @returnStr + @conStr + 'Evening'
	SET @conStr = ', '
END
IF @returnStr <> '' AND @returnStr IS NOT NULL
	SET @conStr = ' '
IF @Time <> '' AND @Time IS NOT NULL BEGIN
	SET @returnStr = @returnStr + @conStr + '(' + @Time + ')'
END
RETURN @returnStr
END
GO
GRANT EXECUTE ON  [dbo].[fn_SHR_VOL_ScheduleDay] TO [cioc_login_role]
GO
