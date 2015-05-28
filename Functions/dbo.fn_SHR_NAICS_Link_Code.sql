SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_NAICS_Link_Code](
	@Code [varchar](6),
	@Classification nvarchar(255),
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN

RETURN '<A HREF="' + @PathToStart + 'results.asp?NAICS=' + @Code + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">(' + @Code + ') ' + @Classification + '</A>'

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_NAICS_Link_Code] TO [cioc_login_role]
GO
