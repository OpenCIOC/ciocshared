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

BEGIN 
RETURN '<a href="' + @PathToStart + 'bresults.asp?PBID=' + CAST(@PB_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @PubName + '</a>'
END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_Link_Publication] TO [cioc_login_role]
GO
