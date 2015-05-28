SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_SHR_VOL_Link_Skill](
	@SK_ID [int],
	@SkillName [varchar](200),
	@HTTPVals [varchar](500),
	@PathToStart [varchar](50)
)
RETURNS [varchar](1000) WITH EXECUTE AS CALLER
AS 
BEGIN

RETURN '<A HREF="' + @PathToStart + 'volunteer/results.asp?SKID=' + CAST(@SK_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @SkillName + '</A>'

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_VOL_Link_Skill] TO [cioc_login_role]
GO
