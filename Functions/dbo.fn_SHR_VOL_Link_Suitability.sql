SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_SHR_VOL_Link_Suitability](@SB_ID [int], @SuitableForName [varchar](200), @HTTPVals [varchar](500), @PathToStart [varchar](50))
RETURNS [varchar](1000) WITH EXECUTE AS CALLER
AS 
BEGIN

RETURN '<a href="' + @PathToStart + 'volunteer/results.asp?SBID=' + CAST(@SB_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @SuitableForName + '</a>'

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_VOL_Link_Suitability] TO [cioc_login_role]
GO
