SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_Link_URL](
	@Protocol varchar(10) = 'https://',
	@URL nvarchar(200),
	@NewWindow bit = 0
)
RETURNS nvarchar(500) WITH EXECUTE AS CALLER
AS 
BEGIN

RETURN '<a href="' + ISNULL(@Protocol,'https://') + @URL + '"'
	+ CASE WHEN @NewWindow=1 THEN ' target="_blank"' ELSE '' END
	+ '>' + @URL + '</A>'
END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_Link_URL] TO [cioc_login_role]
GO
