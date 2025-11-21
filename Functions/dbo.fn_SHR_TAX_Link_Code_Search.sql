SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_TAX_Link_Code_Search] (
	@TMList varchar(500),
	@Term varchar(255),
	@ToPage varchar(150),
	@HTTPVals varchar(500),
	@PathToStart [varchar](50)
)
RETURNS varchar(1500) WITH EXECUTE AS CALLER
AS 
BEGIN 

RETURN '<a href="' + @PathToStart + @ToPage + '?TMC=' + @TMList + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @Term + '</a>'

END
GO
GRANT EXECUTE ON  [dbo].[fn_SHR_TAX_Link_Code_Search] TO [cioc_login_role]
GO
