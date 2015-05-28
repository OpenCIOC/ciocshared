
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CIC_Link_ExtraDropDown](
	@Type char(1),
	@EXD_ID int,
	@ExtraDropDown nvarchar(255),
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 

-- THIS FUNCTION IS DEPRECATED AS OF 3.6

RETURN '<A HREF="' + @PathToStart + 'results.asp?EXD' + @Type + 'ID=' + CAST(@EXD_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @ExtraDropDown + '</A>'

END


GO

GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_Link_ExtraDropDown] TO [cioc_login_role]
GO
