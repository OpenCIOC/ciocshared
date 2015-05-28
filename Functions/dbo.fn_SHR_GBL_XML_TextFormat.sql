SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_XML_TextFormat](
	@TextToFormat nvarchar(max)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN

DECLARE @returnStr nvarchar(max)

IF @TextToFormat IS NOT NULL BEGIN
	SET @returnStr = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@TextToFormat,'&','&amp;'),'"','&quot;'),'''','&apos;'),'<','&lt;'),'>','&gt;')
END

RETURN @returnStr

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_XML_TextFormat] TO [cioc_login_role]
GO
