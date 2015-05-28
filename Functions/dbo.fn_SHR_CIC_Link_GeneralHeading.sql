SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CIC_Link_GeneralHeading](
	@GH_ID int,
	@GeneralHeading nvarchar(255),
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 
RETURN '<A HREF="' + ISNULL(@PathToStart,'') + 'bresults.asp?GHID=' + CAST(@GH_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @GeneralHeading + '</A>'
END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_Link_GeneralHeading] TO [cioc_login_role]
GO
