SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CIC_Link_Ward](
	@WD_ID int,
	@WardName nvarchar(600),
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 

RETURN '<A HREF="' + @PathToStart + 'results.asp?WDID=' + CAST(@WD_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @WardName + '</A>'

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_Link_Ward] TO [cioc_login_role]
GO
