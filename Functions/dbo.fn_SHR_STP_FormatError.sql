SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_STP_FormatError](
	@Error [int],
	@ErrParam1 [nvarchar](255),
	@ErrParam2 [nvarchar](255)
)
RETURNS [nvarchar](1000) WITH EXECUTE AS CALLER
AS 
BEGIN 

DECLARE	@returnStr AS nvarchar(1000),
		@sepStr AS nvarchar(3)

SET @sepStr = '$,$'

SELECT @returnStr = [Description]
	FROM SHR_STP_Error err
WHERE Error=@Error
	AND LangID=(SELECT TOP 1 LangID FROM SHR_STP_Error WHERE Error=err.Error ORDER BY CASE WHEN LangID=@@LANGID THEN 0 ELSE 1 END, LangID)

SET @returnStr = dbo.fn_SHR_GBL_sprintf(@returnStr,
		CASE
			WHEN @ErrParam1 IS NULL AND @ErrParam2 IS NULL THEN NULL
			WHEN @ErrParam1 IS NULL THEN @ErrParam2
			WHEN @ErrParam2 IS NULL THEN @ErrParam1
			ELSE @ErrParam1 + @sepStr + @ErrParam2
		END,
		@sepStr
	)

RETURN @returnStr

END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_STP_FormatError] TO [cioc_login_role]
GO
