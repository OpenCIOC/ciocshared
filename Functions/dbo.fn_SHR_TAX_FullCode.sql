SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_TAX_FullCode](@CdLvl1 [char](1), @CdLvl2 [varchar](1), @CdLvl3 [varchar](4), @CdLvl4 [varchar](4), @CdLvl5 [varchar](3), @CdLvl6 [varchar](2), @CdLocal [varchar](1))
RETURNS [varchar](21) WITH EXECUTE AS CALLER
AS 
BEGIN

RETURN @CdLvl1 + ISNULL(@CdLvl2,'') +
	CASE WHEN @CdLvl3 IS NULL THEN '' ELSE '-' + @CdLvl3 END +
	CASE WHEN @CdLvl4 IS NULL THEN '' ELSE '.' + @CdLvl4 END +
	CASE WHEN @CdLvl5 IS NULL THEN '' ELSE '-' + @CdLvl5 END +
	CASE WHEN @CdLvl6 IS NULL THEN '' ELSE '.' + @CdLvl6 END +
	CASE WHEN @CdLocal IS NULL THEN '' ELSE '-' + @CdLocal END

END
GO
GRANT EXECUTE ON  [dbo].[fn_SHR_TAX_FullCode] TO [cioc_login_role]
GO
