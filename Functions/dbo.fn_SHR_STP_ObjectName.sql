SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_STP_ObjectName](
	@ObjectName [nvarchar](255)
)
RETURNS [nvarchar](255) WITH EXECUTE AS CALLER
AS 
BEGIN 

DECLARE	@returnStr nvarchar(255),
		@ObjectID int

SELECT @returnStr = ISNULL(nm.ObjectName,ob.ObjectName)
	FROM SHR_STP_Object ob
	LEFT JOIN SHR_STP_Object_Name nm 
		ON ob.ObjectID=nm.ObjectID AND nm.LangID=@@LANGID
WHERE ob.ObjectName=@ObjectName

RETURN ISNULL(@returnStr,@ObjectName)

END

GO
GRANT EXECUTE ON  [dbo].[fn_SHR_STP_ObjectName] TO [cioc_login_role]
GRANT EXECUTE ON  [dbo].[fn_SHR_STP_ObjectName] TO [cioc_maintenance_role]
GO
