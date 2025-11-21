SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_THS_Link_Subject](
	@SubjID int,
	@SubjectTerm varchar(200),
	@ToPage varchar(150),
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS VARCHAR(1000) WITH EXECUTE AS CALLER
AS 
BEGIN

RETURN '<a href="' + @PathToStart + @ToPage + '?SubjID=' + CAST(@SubjID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @SubjectTerm + '</a>'

END
GO
GRANT EXECUTE ON  [dbo].[fn_SHR_THS_Link_Subject] TO [cioc_login_role]
GO
