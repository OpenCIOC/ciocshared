SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_Link_URL](
	@Protocol varchar(10) = 'http://',
	@URL nvarchar(200),
	@NewWindow bit = 0
)
RETURNS nvarchar(500) WITH EXECUTE AS CALLER
AS 
BEGIN

/*
	Checked for Release: 3.5
	Checked by: KL
	Checked on: 02-Nov-2012
	Action: NO ACTION REQUIRED
*/

RETURN '<a href="' + @Protocol + @URL + '"'
	+ CASE WHEN @NewWindow=1 THEN ' target="_blank"' ELSE '' END
	+ '>' + @URL + '</A>'
END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_Link_URL] TO [cioc_login_role]
GO
