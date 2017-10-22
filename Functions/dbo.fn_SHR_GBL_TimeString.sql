SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_TimeString](
	@Time time(7)
)
RETURNS nvarchar(25) WITH EXECUTE AS CALLER
AS 
BEGIN
DECLARE	@returnStr nvarchar(25),
		@dateFormatCode tinyint
		
-- SELECT @dateFormatCode = DateFormatCode FROM SHR_STP_Language WHERE LangID=@@LANGID

IF @Time IS NOT NULL BEGIN
	SET @returnStr = CONVERT(varchar,@Time,0)
END
RETURN @returnStr
END

GO
