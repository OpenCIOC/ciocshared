SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CCR_Link_TypeOfProgram](
	@TOP_ID int,
	@TypeOfProgram nvarchar(255),
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 

RETURN '<A HREF="' + @PathToStart + 'cresults.asp?TOPID=' + CAST(@TOP_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @TypeOfProgram + '</A>'

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CCR_Link_TypeOfProgram] TO [cioc_login_role]
GO
