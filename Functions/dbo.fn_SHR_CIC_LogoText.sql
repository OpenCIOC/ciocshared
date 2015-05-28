SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CIC_LogoText](@LogoURL [varchar](200), @LogoLink [varchar](200))
RETURNS [varchar](500) WITH EXECUTE AS CALLER
AS 
BEGIN 
DECLARE @RetVal varchar(500)

SET @RetVal = @LogoURL
IF @LogoLink IS NOT NULL SET @RetVal = @RetVal + ' ' + @LogoLink

RETURN @RetVal
END
GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_LogoText] TO [cioc_login_role]
GO
