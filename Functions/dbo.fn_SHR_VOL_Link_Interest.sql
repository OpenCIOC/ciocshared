SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_VOL_Link_Interest](@AI_ID [int], @InterestName [varchar](200), @HTTPVals [varchar](500), @PathToStart [varchar](50))
RETURNS [varchar](1000) WITH EXECUTE AS CALLER
AS 
BEGIN

RETURN '<A HREF="' + @PathToStart + 'volunteer/results.asp?AIID=' + CAST(@AI_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @InterestName + '</A>'

END
GO
GRANT EXECUTE ON  [dbo].[fn_SHR_VOL_Link_Interest] TO [cioc_login_role]
GO
