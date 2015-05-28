SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CIC_Link_Publication](
	@PB_ID [int],
	@PubName nvarchar(255),
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 

/*
	Checked for Release: 3.1
	Checked by: KL
	Checked on: 03-Jan-2012
	Action: NO ACTION REQUIRED
*/


BEGIN 
RETURN '<A HREF="' + @PathToStart + 'bresults.asp?PBID=' + CAST(@PB_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @PubName + '</A>'
END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_Link_Publication] TO [cioc_login_role]
GO
