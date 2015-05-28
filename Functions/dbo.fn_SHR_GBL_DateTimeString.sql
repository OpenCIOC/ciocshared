SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_SHR_GBL_DateTimeString](
	@Date datetime
)
RETURNS nvarchar(25) WITH EXECUTE AS CALLER
AS 
BEGIN
DECLARE	@returnStr nvarchar(25),
		@dateFormatCode tinyint
		
SELECT @dateFormatCode = DateFormatCode FROM SHR_STP_Language WHERE LangID=@@LANGID

IF @Date IS NOT NULL BEGIN
	SET @returnStr = CONVERT(varchar,@Date,ISNULL(@dateFormatCode,106))
		+ ' ' + CASE
			WHEN @@LANGID=0 THEN REPLACE(REPLACE(LTRIM(RIGHT(CONVERT(varchar(25), @Date, 100), 7)),'AM',' AM'),'PM',' PM')
			ELSE CONVERT(varchar(8),@Date,108)
		END
END
RETURN @returnStr
END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_DateTimeString] TO [cioc_login_role]
GRANT REFERENCES ON  [dbo].[fn_SHR_GBL_DateTimeString] TO [cioc_maintenance_role]
GO
