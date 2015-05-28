SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_SHR_GBL_AnonString](
	@StringToAnon nvarchar(500)
)
RETURNS nvarchar(500) WITH EXECUTE AS CALLER
AS 
BEGIN

/*
	Checked for Release: 3.1
	Checked by: KL
	Checked on: 17-Apr-2012
	Action: NO ACTION REQUIRED
*/

DECLARE	@returnStr nvarchar(500),
		@String1 nvarchar(500),
		@String2 nvarchar(500),
		@String3 nvarchar(500),
		@Len int,
		@Len1 int,
		@PosAt int,
		@PosDot int

SET @Len = LEN(@StringToAnon)
SET @PosAt = CHARINDEX('@',@StringToAnon,1)
SET @PosDot = CHARINDEX('.',REVERSE(@StringToAnon),1)

IF @PosAt > 0 AND @PosDot > 0 BEGIN
	SET @String1 = LEFT(@StringToAnon,@PosAt-1)
	SET @String2 = SUBSTRING(@StringToAnon,@PosAt+1,@PosDot+1)
	SET @String3 = RIGHT(@StringToAnon,@PosDot)
END ELSE BEGIN
	SET @String1 = @StringToAnon
END

SET @Len1 = LEN(@String1)

SET @returnStr = LEFT(@String1,CASE WHEN @Len1 < 4 THEN 1 WHEN @Len1 < 8 THEN 2 WHEN @Len1 < 12 THEN 3 WHEN @Len1 < 16 THEN 4 ELSE 5 END)
	+ REPLICATE('*',LEN(@String1)-CASE WHEN @Len1 < 4 THEN 2 WHEN @Len1 < 8 THEN 3 WHEN @Len1 < 12 THEN 4 WHEN @Len1 < 16 THEN 6 ELSE 7 END)
	+ RIGHT(@String1,CASE WHEN @Len1 > 16 THEN 3 WHEN @Len1 > 12 THEN 2 ELSE 1 END)
IF @PosAt > 0 AND @PosDot > 0 BEGIN
	SET @returnStr = @returnStr + '@' + LEFT(@String2,1) + REPLICATE('*',LEN(@String2)-2) + RIGHT(@String2,1) + @String3
END

RETURN @returnStr

END



GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_AnonString] TO [cioc_login_role]
GRANT REFERENCES ON  [dbo].[fn_SHR_GBL_AnonString] TO [cioc_maintenance_role]
GO
