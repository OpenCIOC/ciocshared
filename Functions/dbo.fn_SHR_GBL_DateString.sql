SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_DateString](
	@Date smalldatetime
)
RETURNS nvarchar(25) WITH EXECUTE AS CALLER
AS 
BEGIN
DECLARE	@returnStr nvarchar(25),
		@dateFormatCode tinyint
		
SELECT @dateFormatCode = DateFormatCode FROM SHR_STP_Language WHERE LangID=@@LANGID

IF @Date IS NOT NULL BEGIN
	SET @returnStr = CONVERT(varchar,@Date,ISNULL(@dateFormatCode,106))
END
RETURN @returnStr
END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_DateString] TO [cioc_login_role]
GRANT REFERENCES ON  [dbo].[fn_SHR_GBL_DateString] TO [cioc_maintenance_role]
GO
