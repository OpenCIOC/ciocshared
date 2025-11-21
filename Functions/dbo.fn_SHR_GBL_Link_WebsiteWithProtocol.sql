SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_SHR_GBL_Link_WebsiteWithProtocol](
	@URL nvarchar(200),
	@NewWindow bit = 0,
	@Protocol varchar(8) = 'https://'
)
RETURNS nvarchar(400) WITH EXECUTE AS CALLER
AS 
BEGIN

RETURN '<a href="' + ISNULL(@Protocol, 'https://') + @URL + '" class="force-word-break"'
	+ CASE WHEN @NewWindow=1 THEN ' target="_blank"' ELSE '' END
	+ '>' + @URL + '</a>'
END





GO


GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_Link_WebsiteWithProtocol] TO [cioc_login_role]
GO
