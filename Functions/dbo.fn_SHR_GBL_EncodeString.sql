SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_EncodeString](
	@strEncode nvarchar(100)
)
RETURNS nvarchar(600) WITH EXECUTE AS CALLER
AS 
BEGIN 
DECLARE	@returnStr nvarchar(600),
		@curChar char(1),
		@Encode bit
		
SET @returnStr=''
SET @Encode=0

WHILE LEN(@strEncode) > 0 BEGIN
	SET @curChar = LEFT(@strEncode,1)
	IF @Encode=0 AND @curChar <> '@' BEGIN
		SET @returnStr = @returnStr + @curChar
		SET @Encode = 1
	END ELSE BEGIN
		SET @returnStr = @returnStr + '&#' + CAST(ASCII(@curChar) AS varchar) + ';'
		SET @Encode = 0
	END
	SET @strEncode = RIGHT(@strEncode,LEN(@strEncode)-1) 
END
RETURN @returnStr
END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_EncodeString] TO [cioc_login_role]
GO
