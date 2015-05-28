SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_SHR_GBL_Link_OrgLocationService](
	@OLS_ID int,
	@OrgLocationService nvarchar(100),
	@HTTPVals [varchar](500),
	@PathToStart [varchar](50)
)
RETURNS nvarchar(max) WITH EXECUTE AS CALLER
AS 
BEGIN 

RETURN '<a href="' + @PathToStart + 'results.asp?OLSID=' + CAST(@OLS_ID AS varchar) + CASE WHEN @HTTPVals IS NOT NULL THEN '&' + @HTTPVals ELSE '' END + '">' + @OrgLocationService + '</a>'

END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_Link_OrgLocationService] TO [cioc_login_role]
GO
