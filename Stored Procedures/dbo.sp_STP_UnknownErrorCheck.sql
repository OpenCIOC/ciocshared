SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[sp_STP_UnknownErrorCheck]
	@Error [int],
	@ObjectName [nvarchar](50),
	@ErrMsg [nvarchar](500) OUTPUT
WITH EXECUTE AS CALLER
AS
SET NOCOUNT ON

IF @Error <> 0 BEGIN
	SET @ErrMsg = dbo.fn_SHR_STP_FormatError(1, @ObjectName, @Error)
	RETURN 1
END ELSE BEGIN
	RETURN 0
END

SET NOCOUNT OFF

GO
GRANT EXECUTE ON  [dbo].[sp_STP_UnknownErrorCheck] TO [cioc_login_role]
GRANT EXECUTE ON  [dbo].[sp_STP_UnknownErrorCheck] TO [cioc_maintenance_role]
GO
