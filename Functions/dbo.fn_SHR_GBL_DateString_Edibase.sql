SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_DateString_Edibase](@Date [smalldatetime])
RETURNS [varchar](10) WITH EXECUTE AS CALLER
AS 
BEGIN
DECLARE	@returnStr varchar(10)
IF @Date IS NOT NULL BEGIN
	SET @returnStr = CAST(YEAR(@Date) AS varchar) + '-'
		+ CASE WHEN MONTH(@Date) < 10 THEN '0' ELSE '' END + CAST(MONTH(@Date) AS varchar) + '-' 
		+ CASE WHEN DAY(@Date) < 10 THEN '0' ELSE '' END + CAST(DAY(@Date) AS varchar)
END
RETURN @returnStr
END
GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_DateString_Edibase] TO [cioc_login_role]
GO
