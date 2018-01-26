SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE FUNCTION [dbo].[fn_SHR_VOL_Link_Record](
	@VNUM VARCHAR(10),
	@LinkText VARCHAR(500),
	@HTTPVals VARCHAR(500),
	@PathToStart VARCHAR(50)
)
RETURNS NVARCHAR(1100) WITH EXECUTE AS CALLER
AS 
BEGIN

/*
	Checked by: KL
	Checked on: 25-Jan-2018
	Action: NO ACTION REQUIRED
*/

RETURN '<a href="' + @PathToStart + 'volunteer/record/' + ISNULL(@VNUM,'') + CASE WHEN @HTTPVals IS NOT NULL THEN '?' + @HTTPVals ELSE '' END + '">' + @LinkText + '</a>'
END



GO
GRANT EXECUTE ON  [dbo].[fn_SHR_VOL_Link_Record] TO [cioc_login_role]
GO
