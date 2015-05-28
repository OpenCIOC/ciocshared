SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_SHR_CIC_Link_GeneralHeading_Group](
	@GroupID int,
	@GroupName nvarchar(255),
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 
RETURN '<A HREF="' + ISNULL(@PathToStart,'') + 'bresults.asp?GHID_GRP=' + CAST(@GroupID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @GroupName + '</A>'
END



GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_Link_GeneralHeading_Group] TO [cioc_login_role]
GO
