SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE FUNCTION [dbo].[fn_SHR_GBL_Link_Record](
	@NUM varchar(8),
	@LinkText varchar(500),
	@HTTPVals varchar(500),
	@PathToStart varchar(50)
)
RETURNS nvarchar(1100) WITH EXECUTE AS CALLER
AS 
BEGIN

/*
	Checked for Release: 3.5
	Checked by: KL
	Checked on: 10-Jan-2012
	Action: NO ACTION REQUIRED
*/

RETURN '<a href="' + @PathToStart + 'record/' + ISNULL(@NUM,'') + CASE WHEN @HTTPVals IS NOT NULL THEN '?' + @HTTPVals ELSE '' END + '">' + @LinkText + '</a>'
END


GO
GRANT EXECUTE ON  [dbo].[fn_SHR_GBL_Link_Record] TO [cioc_login_role]
GO
