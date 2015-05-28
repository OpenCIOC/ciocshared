SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[sp_SHR_GBL_PageInfo_s_Help]
	@PageName [varchar](255)
WITH EXECUTE AS CALLER
AS
SET NOCOUNT ON

IF @@LANGID=0 BEGIN
	SELECT PageTitle, PageHelp
		FROM SHR_GBL_PageInfo
	WHERE PageName = @PageName
END ELSE BEGIN
	SELECT ISNULL(PageTitleEq, PageTitle) AS PageTitle, ISNULL(PageHelpEq,PageHelp) AS PageHelp
		FROM SHR_GBL_PageInfo
	WHERE PageName = @PageName
END

SET NOCOUNT OFF
GO
GRANT EXECUTE ON  [dbo].[sp_SHR_GBL_PageInfo_s_Help] TO [cioc_login_role]
GO
