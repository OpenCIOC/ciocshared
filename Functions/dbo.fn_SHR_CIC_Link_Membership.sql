SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CIC_Link_Membership](
	@MT_ID int,
	@MembershipType nvarchar(255),
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 

RETURN '<A HREF="' + @PathToStart + 'results.asp?MTID=' + CAST(@MT_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @MembershipType + '</A>'

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_Link_Membership] TO [cioc_login_role]
GO
