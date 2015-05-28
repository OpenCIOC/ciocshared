
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_Link_Website](
	@URL nvarchar(200),
	@NewWindow bit = 0
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

RETURN dbo.fn_SHR_GBL_Link_WebsiteWithProtocol(@URL, @NewWindow, DEFAULT)

END

GO

GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_Link_Website] TO [cioc_login_role]
GO
