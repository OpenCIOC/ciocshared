SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_SHR_GBL_FloatString](
	@Number float
)
RETURNS nvarchar(25) WITH EXECUTE AS CALLER
AS 
BEGIN
DECLARE	@returnStr nvarchar(25)
		
IF @Number IS NOT NULL BEGIN
	SET @returnStr = CASE
		WHEN @@LANGID = 2 THEN REPLACE(CAST(@Number AS varchar),'.',',')
		ELSE CAST(@Number AS varchar)
	END
END
RETURN @returnStr
END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_FloatString] TO [cioc_login_role]
GO
