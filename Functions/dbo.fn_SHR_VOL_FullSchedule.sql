SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_SHR_VOL_FullSchedule](
	@SCH_M_Morning [bit],
	@SCH_M_Afternoon [bit],
	@SCH_M_Evening [bit],
	@SCH_M_Time [nvarchar](50),
	@SCH_TU_Morning [bit],
	@SCH_TU_Afternoon [bit],
	@SCH_TU_Evening [bit],
	@SCH_TU_Time [nvarchar](50),
	@SCH_W_Morning [bit],
	@SCH_W_Afternoon [bit],
	@SCH_W_Evening [bit],
	@SCH_W_Time [nvarchar](50),
	@SCH_TH_Morning [bit],
	@SCH_TH_Afternoon [bit],
	@SCH_TH_Evening [bit],
	@SCH_TH_Time [nvarchar](50),
	@SCH_F_Morning [bit],
	@SCH_F_Afternoon [bit],
	@SCH_F_Evening [bit],
	@SCH_F_Time [nvarchar](50),
	@SCH_ST_Morning [bit],
	@SCH_ST_Afternoon [bit],
	@SCH_ST_Evening [bit],
	@SCH_ST_Time [nvarchar](50),
	@SCH_SN_Morning [bit],
	@SCH_SN_Afternoon [bit],
	@SCH_SN_Evening [bit],
	@SCH_SN_Time [nvarchar](50),
	@SCHEDULE_NOTES [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
BEGIN
DECLARE @dayStr nvarchar(200),
		@conStr nvarchar(4),
		@returnStr nvarchar(max)

SET @returnStr = ''
SET @conStr = ''

SET @dayStr = dbo.fn_SHR_VOL_ScheduleDay(@SCH_M_Morning,@SCH_M_Afternoon,@SCH_M_Evening,@SCH_M_Time)
IF @dayStr <> '' AND @dayStr IS NOT NULL BEGIN
	SET @returnStr = @returnStr + @conStr + dbo.fn_SHR_STP_ObjectName('Monday') + dbo.fn_SHR_STP_ObjectName(': ') + @dayStr
	SET @conStr = CHAR(13) + CHAR(10)
END
SET @dayStr = dbo.fn_SHR_VOL_ScheduleDay(@SCH_TU_Morning,@SCH_TU_Afternoon,@SCH_TU_Evening,@SCH_TU_Time)
IF @dayStr <> '' AND @dayStr IS NOT NULL BEGIN
	SET @returnStr = @returnStr + @conStr + dbo.fn_SHR_STP_ObjectName('Tuesday') + dbo.fn_SHR_STP_ObjectName(': ') + @dayStr
	SET @conStr = CHAR(13) + CHAR(10)
END
SET @dayStr = dbo.fn_SHR_VOL_ScheduleDay(@SCH_W_Morning,@SCH_W_Afternoon,@SCH_W_Evening,@SCH_W_Time)
IF @dayStr <> '' AND @dayStr IS NOT NULL BEGIN
	SET @returnStr = @returnStr + @conStr + dbo.fn_SHR_STP_ObjectName('Wednesday') + dbo.fn_SHR_STP_ObjectName(': ') + @dayStr
	SET @conStr = CHAR(13) + CHAR(10)
END
SET @dayStr = dbo.fn_SHR_VOL_ScheduleDay(@SCH_TH_Morning,@SCH_TH_Afternoon,@SCH_TH_Evening,@SCH_TH_Time)
IF @dayStr <> '' AND @dayStr IS NOT NULL BEGIN
	SET @returnStr = @returnStr + @conStr + dbo.fn_SHR_STP_ObjectName('Thursday') + dbo.fn_SHR_STP_ObjectName(': ') + @dayStr
	SET @conStr = CHAR(13) + CHAR(10)
END
SET @dayStr = dbo.fn_SHR_VOL_ScheduleDay(@SCH_F_Morning,@SCH_F_Afternoon,@SCH_F_Evening,@SCH_F_Time)
IF @dayStr <> '' AND @dayStr IS NOT NULL BEGIN
	SET @returnStr = @returnStr + @conStr + dbo.fn_SHR_STP_ObjectName('Friday') + dbo.fn_SHR_STP_ObjectName(': ') + @dayStr
	SET @conStr = CHAR(13) + CHAR(10)
END
SET @dayStr = dbo.fn_SHR_VOL_ScheduleDay(@SCH_ST_Morning,@SCH_ST_Afternoon,@SCH_ST_Evening,@SCH_ST_Time)
IF @dayStr <> '' AND @dayStr IS NOT NULL BEGIN

	SET @returnStr = @returnStr + @conStr + dbo.fn_SHR_STP_ObjectName('Saturday') + dbo.fn_SHR_STP_ObjectName(': ') + @dayStr
	SET @conStr = CHAR(13) + CHAR(10)
END
SET @dayStr = dbo.fn_SHR_VOL_ScheduleDay(@SCH_SN_Morning,@SCH_SN_Afternoon,@SCH_SN_Evening,@SCH_SN_Time)
IF @dayStr <> '' AND @dayStr IS NOT NULL BEGIN
	SET @returnStr = @returnStr + @conStr + dbo.fn_SHR_STP_ObjectName('Sunday') + dbo.fn_SHR_STP_ObjectName(': ') + @dayStr
	SET @conStr = CHAR(13) + CHAR(10)
END
IF @SCHEDULE_NOTES IS NOT NULL BEGIN
	IF @returnStr <> '' AND @returnStr IS NOT NULL
		SET @conStr = CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10)
	SET @returnStr = @returnStr + @conStr + @SCHEDULE_NOTES
END
IF @returnStr = '' SET @returnStr = NULL
RETURN @returnStr
END
GO
GRANT EXECUTE ON  [dbo].[fn_SHR_VOL_FullSchedule] TO [cioc_login_role]
GO
