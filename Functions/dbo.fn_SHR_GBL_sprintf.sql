SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_sprintf] (
	@s nvarchar(max),
	@params nvarchar(4000),
	@separator nvarchar(3) = ','
)
RETURNS nvarchar(max) AS
BEGIN

DECLARE @p nvarchar(4000)
		
SET @params = @params + @separator

WHILE NOT @params = '' BEGIN
	SET @p = LEFT(@params + @separator, CHARINDEX(@separator, @params)-1)
	SET @s = STUFF(@s, CHARINDEX('%s', @s), 2, @p)
	SET @params = SUBSTRING(@params, len(@p)+4, 4000)
END

RETURN @s

END
GO
