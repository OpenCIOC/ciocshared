SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_XML_DateFormat](@Date [smalldatetime])
RETURNS [varchar](20) WITH EXECUTE AS CALLER
AS 
BEGIN
DECLARE	@returnStr varchar(20)
IF @Date IS NOT NULL BEGIN
	SET @returnStr = CONVERT(varchar,@Date,126)
END
RETURN @returnStr
END
GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_XML_DateFormat] TO [cioc_login_role]
GO
