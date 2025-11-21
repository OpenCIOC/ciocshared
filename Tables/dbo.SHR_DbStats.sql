CREATE TABLE [dbo].[SHR_DbStats]
(
[DbName] [varchar] (100) COLLATE Latin1_General_100_CI_AI NOT NULL,
[Agencies] [int] NOT NULL CONSTRAINT [DF_SHR_DbStats_Agencies] DEFAULT ((0)),
[Layouts] [int] NOT NULL CONSTRAINT [DF__SHR_DbStats_Layouts] DEFAULT ((0)),
[Templates] [int] NOT NULL CONSTRAINT [DF__SHR_DbStats_Templates] DEFAULT ((0)),
[CICSecurityLevels] [int] NOT NULL CONSTRAINT [DF_SHR_DbStats_CICSecurityLevels] DEFAULT ((0)),
[CICActiveUsers] [int] NOT NULL CONSTRAINT [DF__SHR_DbStats_CICActiveUsers] DEFAULT ((0)),
[CICRecords] [int] NOT NULL CONSTRAINT [DF__SHR_DbStats_CICRecords] DEFAULT ((0)),
[CICViews] [int] NOT NULL CONSTRAINT [DF__SHR_DbStats_CICViews] DEFAULT ((0)),
[CICFieldsInUse] [int] NOT NULL CONSTRAINT [DF_SHR_DbStats_CICFields] DEFAULT ((0)),
[CICPublications] [int] NOT NULL CONSTRAINT [DF_SHR_DbStats_CICPublications] DEFAULT ((0)),
[VOLActiveUsers] [int] NOT NULL CONSTRAINT [DF__SHR_DbStats_VOLActiveUsers] DEFAULT ((0)),
[VOLSecurityLevels] [int] NOT NULL CONSTRAINT [DF_SHR_DbStats_VOLSecurityLevels] DEFAULT ((0)),
[VOLRecords] [int] NOT NULL CONSTRAINT [DF__SHR_DbStats_VOLRecords] DEFAULT ((0)),
[VOLViews] [int] NOT NULL CONSTRAINT [DF__SHR_DbStats__VOLViews] DEFAULT ((0)),
[VOLFieldsInUse] [int] NOT NULL CONSTRAINT [DF_SHR_DbStats_VOLFields] DEFAULT ((0)),
[VOLActiveProfiles] [int] NOT NULL CONSTRAINT [DF_SHR_DbStats_ActiveVOLProfiles] DEFAULT ((0)),
[VOLAreasOfInterest] [int] NOT NULL CONSTRAINT [DF_SHR_DbStats_VOLAreasOfInterest] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SHR_DbStats] ADD CONSTRAINT [PK__SHR_DbSt__28B940A675A278F5] PRIMARY KEY CLUSTERED ([DbName]) ON [PRIMARY]
GO
