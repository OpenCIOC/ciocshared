SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_SHR_GBL_HTMLEncode](
	@strEncode nvarchar(max)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 
DECLARE	@returnStr nvarchar(max)
		
RETURN	Replace(
			Replace(
				Replace(@strEncode,'&','&amp;'),
			'<', '&lt;'),
		'>', '&gt;')

END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_HTMLEncode] TO [cioc_login_role]
GO
