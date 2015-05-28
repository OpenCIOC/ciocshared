SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CIC_Link_ActivityServiceCategory](
	@ACAT_ID int,
	@ServiceCategory nvarchar(255),
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 

RETURN '<A HREF="' + @PathToStart + 'results.asp?ACATID=' + CAST(@ACAT_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @ServiceCategory + '</A>'

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_Link_ActivityServiceCategory] TO [cioc_login_role]
GO
