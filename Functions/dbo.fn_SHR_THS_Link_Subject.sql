SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_THS_Link_Subject](@SubjID [int], @SubjectTerm [varchar](200), @ToPage [varchar](150), @HTTPVals [varchar](500), @PathToStart [varchar](50))
RETURNS [varchar](1000) WITH EXECUTE AS CALLER
AS 
BEGIN

RETURN '<A HREF="' + @PathToStart + @ToPage + '?SubjID=' + CAST(@SubjID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @SubjectTerm + '</A>'

END
GO
GRANT EXECUTE ON  [dbo].[fn_SHR_THS_Link_Subject] TO [cioc_login_role]
GO
