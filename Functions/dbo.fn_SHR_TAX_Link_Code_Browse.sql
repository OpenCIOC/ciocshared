SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_TAX_Link_Code_Browse](
	@Code [varchar](21),
	@Term [varchar](255),
	@ToPage [varchar](150),
	@HTTPVals [varchar](500),
	@PathToStart [varchar](50)
)
RETURNS [varchar](1000) WITH EXECUTE AS CALLER
AS 
BEGIN 

RETURN '<A HREF="' + @PathToStart + @ToPage + '?TC=' + @Code + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @Term + '</A>'

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_TAX_Link_Code_Browse] TO [cioc_login_role]
GO
