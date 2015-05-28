SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_GBL_Link_CommunityFinder](
	@CM_ID int,
	@Community nvarchar(200),
	@HasChildren bit,
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 
DECLARE @returnStr varchar(max)

IF @HasChildren=1 BEGIN
	SET @returnStr = '<A HREF="' + @PathToStart + 'comfind_results.asp?CMID=' + CAST(@CM_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @Community + '</A>'
END ELSE BEGIN
	SET @returnStr = @Community
END

RETURN @returnStr
END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_Link_CommunityFinder] TO [cioc_login_role]
GO
