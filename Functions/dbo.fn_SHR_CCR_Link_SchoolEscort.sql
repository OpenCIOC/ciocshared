SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CCR_Link_SchoolEscort](
	@SCH_ID int,
	@SchoolName nvarchar(355),
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN

RETURN '<A HREF="' + @PathToStart + 'cresults.asp?SCHEID=' + CAST(@SCH_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @SchoolName + '</A>'

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CCR_Link_SchoolEscort] TO [cioc_login_role]
GO
