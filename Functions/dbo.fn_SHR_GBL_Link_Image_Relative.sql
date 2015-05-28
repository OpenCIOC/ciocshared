SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_Link_Image_Relative](@ImgURL [varchar](200), @ImgLink [varchar](200), @ImgID [varchar](50))
RETURNS [varchar](500) WITH EXECUTE AS CALLER
AS 
BEGIN 
DECLARE @returnStr varchar(500)

IF @ImgURL IS NULL BEGIN
	SET @returnStr = NULL
END ELSE BEGIN
	SET @returnStr = '<img src="' + @ImgURL + '" border="0"' + CASE WHEN @ImgID IS NULL THEN '' ELSE ' id="' + @ImgID + '"' END + '>'
	IF @ImgLink IS NOT NULL
		SET @returnStr = '<a href="' + @ImgLink + '">' + @returnStr + '</a>'
END

RETURN @returnStr
END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_Link_Image_Relative] TO [cioc_login_role]
GO
