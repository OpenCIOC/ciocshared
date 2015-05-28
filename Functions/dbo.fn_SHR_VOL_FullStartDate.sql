SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_VOL_FullStartDate](
	@StartFirst [smalldatetime],
	@StartLast [smalldatetime]
)
RETURNS [nvarchar](1000) WITH EXECUTE AS CALLER
AS 
BEGIN 
DECLARE @returnStr nvarchar(1000)

/*
	Checked for Release: 3.5
	Checked by: KL
	Checked on: 24-Jul-2012
	Action: NO ACTION REQUIRED
*/

SET @returnStr =
	CASE
		WHEN @StartFirst IS NULL THEN ''
		ELSE dbo.fn_SHR_STP_ObjectName('On or after ') + dbo.fn_SHR_GBL_DateString(@StartFirst) + CASE WHEN @StartLast IS NULL THEN '' ELSE dbo.fn_SHR_STP_ObjectName(' and ') END
	END
	+ CASE
		WHEN @StartLast IS NULL THEN ''
		ELSE CASE
			WHEN @StartFirst IS NULL THEN dbo.fn_SHR_STP_ObjectName('On or before ')
			ELSE dbo.fn_SHR_STP_ObjectName('on or before ')
			END + dbo.fn_SHR_GBL_DateString(@StartLast)
	END
	
IF @returnStr = '' SET @returnStr = NULL
RETURN @returnStr
END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_VOL_FullStartDate] TO [cioc_login_role]
GO
