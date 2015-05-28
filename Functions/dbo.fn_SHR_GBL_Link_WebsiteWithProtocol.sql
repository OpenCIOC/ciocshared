
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_SHR_GBL_Link_WebsiteWithProtocol](
	@URL nvarchar(200),
	@NewWindow bit = 0,
	@Protocol varchar(8) = 'http://'
)
RETURNS nvarchar(400) WITH EXECUTE AS CALLER
AS 
BEGIN

/*
	Checked for Release: 3.5
	Checked by: KL
	Checked on: 02-Nov-2012
	Action: NO ACTION REQUIRED
*/

RETURN '<a href="' + ISNULL(@Protocol, 'http://') + @URL + '" class="force-word-break"'
	+ CASE WHEN @NewWindow=1 THEN ' target="_blank"' ELSE '' END
	+ '>' + CASE WHEN ISNULL(@Protocol, '') = 'https://' THEN @Protocol ELSE '' END + @URL + '</A>'
END





GO


GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_Link_WebsiteWithProtocol] TO [cioc_login_role]
GO
