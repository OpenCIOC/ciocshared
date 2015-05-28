SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_SHR_GBL_DayMonthString](
	@Date smalldatetime
)
RETURNS nvarchar(25) WITH EXECUTE AS CALLER
AS 
BEGIN
DECLARE	@returnStr nvarchar(25),
		@dateFormatCode tinyint,
		@replaceYear nvarchar(7)
		
SELECT @dateFormatCode = DateFormatCode FROM SHR_STP_Language WHERE LangID=@@LANGID

SET @replaceYear = YEAR(@Date)

SET @replaceYear = CASE
	WHEN @dateFormatCode = 106 THEN ' ' + @replaceYear
	WHEN @dateFormatCode = 102 THEN @replaceYear + '.'
	WHEN @dateFormatCode = 104 THEN '.' + @replaceYear
	WHEN @dateFormatCode IN (101,103) THEN '/' + @replaceYear
	WHEN @dateFormatCode = 105 THEN '-' + @replaceYear
	WHEN @dateFormatCode = 107 THEN ', ' + @replaceYear
	WHEN @dateFormatCode = 111 THEN @replaceYear + '/'
END

IF @Date IS NOT NULL BEGIN
	SET @returnStr = REPLACE(CONVERT(varchar,@Date,ISNULL(@dateFormatCode,106)),@replaceYear,'')
	IF @@LANGID=2 SET @returnStr = @returnStr + '.'
END

RETURN @returnStr
END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_DayMonthString] TO [cioc_login_role]
GRANT REFERENCES ON  [dbo].[fn_SHR_GBL_DayMonthString] TO [cioc_maintenance_role]
GO
