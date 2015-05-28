SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CIC_Link_Distribution](
	@DistID int,
	@DistCode varchar(20),
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS [varchar](1000) WITH EXECUTE AS CALLER
AS 
BEGIN 
RETURN '<A HREF="' + @PathToStart + 'results.asp?DSTID=' + CAST(@DistID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END +'">' + @DistCode + '</A>'
END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_Link_Distribution] TO [cioc_login_role]
GO
