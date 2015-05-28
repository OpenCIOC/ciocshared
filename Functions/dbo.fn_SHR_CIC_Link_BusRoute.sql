SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CIC_Link_BusRoute](
	@BR_ID int,
	@RouteName nvarchar(500),
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 
RETURN '<A HREF="' + @PathToStart + 'bresults.asp?BRID=' + CAST(@BR_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @RouteName + '</A>'
END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_Link_BusRoute] TO [cioc_login_role]
GO
