SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_TAX_ParentCode](@CdLvl1 [char](1), @CdLvl2 [varchar](1), @CdLvl3 [varchar](4), @CdLvl4 [varchar](4), @CdLvl5 [varchar](3), @CdLvl6 [varchar](2))
RETURNS [varchar](16) WITH EXECUTE AS CALLER
AS 
BEGIN 

DECLARE	@ParentCode	varchar(16)

SET @ParentCode = CASE
		/* Level 1 Code - No Parent */
		WHEN @CdLvl2 IS NULL THEN NULL
		/* Level 2 Code */
		WHEN @CdLvl3 IS NULL THEN dbo.fn_SHR_TAX_FullCode(@CdLvl1,NULL,NULL,NULL,NULL,NULL,NULL)
		/* Level 3 Code */
		WHEN @CdLvl4 IS NULL THEN dbo.fn_SHR_TAX_FullCode(@CdLvl1,@CdLvl2,NULL,NULL,NULL,NULL,NULL)
		/* Level 4 Code */
		WHEN @CdLvl5 IS NULL THEN dbo.fn_SHR_TAX_FullCode(@CdLvl1,@CdLvl2,@CdLvl3,NULL,NULL,NULL,NULL)
		/* Level 5 Code */
		WHEN @CdLvl6 IS NULL THEN dbo.fn_SHR_TAX_FullCode(@CdLvl1,@CdLvl2,@CdLvl3,@CdLvl4,NULL,NULL,NULL)
		/* Level 6 Code */
		ELSE dbo.fn_SHR_TAX_FullCode(@CdLvl1,@CdLvl2,@CdLvl3,@CdLvl4,@CdLvl5,NULL,NULL)
	END
RETURN @ParentCode

END
GO
GRANT EXECUTE ON  [dbo].[fn_SHR_TAX_ParentCode] TO [cioc_login_role]
GO
