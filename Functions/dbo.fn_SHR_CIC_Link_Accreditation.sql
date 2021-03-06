SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_CIC_Link_Accreditation](
	@ACR_ID int,
	@Accreditation nvarchar(255),
	@HTTPVals varchar(500),
	@PathToStart nvarchar(50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 

RETURN '<A HREF="' + @PathToStart + 'results.asp?ACRID=' + CAST(@ACR_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @Accreditation + '</A>'

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_CIC_Link_Accreditation] TO [cioc_login_role]
GO
