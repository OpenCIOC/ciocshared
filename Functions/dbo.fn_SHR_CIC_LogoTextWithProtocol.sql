SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_SHR_CIC_LogoTextWithProtocol](@LogoURL [varchar](200), @LogoLink [varchar](200), @LogoProtocol varchar(8), @LogoLinkProtocol varchar(8))
RETURNS [varchar](500) WITH EXECUTE AS CALLER
AS 
BEGIN 
DECLARE @RetVal varchar(500)

SET @RetVal = ISNULL(CASE WHEN @LogoProtocol = 'https://' THEN @LogoProtocol ELSE '' END, '') + @LogoURL
IF @LogoLink IS NOT NULL SET @RetVal = @RetVal + ' ' + ISNULL(CASE WHEN @LogoLinkProtocol = 'https://' THEN @LogoLinkProtocol ELSE '' END, '') + @LogoLink

RETURN @RetVal
END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_LogoTextWithProtocol] TO [cioc_login_role]
GO
