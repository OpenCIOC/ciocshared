SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_Link_Email](
	@Email [varchar](100))
RETURNS [varchar](500) WITH EXECUTE AS CALLER
AS 
BEGIN 
DECLARE	@returnStr varchar(500)
SET @returnStr = dbo.fn_SHR_GBL_EncodeString(@Email)
IF @returnStr = '' BEGIN
	SET @returnStr = NULL
END ELSE BEGIN
	SET @returnStr =  '<a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;' + @returnStr + '">' + @returnStr + '</a>'
END
RETURN @returnStr
END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_Link_Email] TO [cioc_login_role]
GO
