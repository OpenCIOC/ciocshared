CREATE TABLE [dbo].[SHR_RecordOwner]
(
[AgencyCode] [char] (3) COLLATE Latin1_General_100_CI_AI NOT NULL,
[DbName] [varchar] (50) COLLATE Latin1_General_100_CI_AI NOT NULL,
[UserCount] [int] NULL CONSTRAINT [DF_SHR_RecordOwner_UserCount] DEFAULT ((0)),
[UserTaxonomyCount] [int] NULL,
[CICRecordCount] [int] NULL CONSTRAINT [DF_SHR_RecordOwner_CICRecordCount] DEFAULT ((0)),
[VOLRecordCount] [int] NULL CONSTRAINT [DF_SHR_RecordOwner_VOLRecordCount] DEFAULT ((0)),
[ORG_LEVEL_1] [nvarchar] (200) COLLATE Latin1_General_100_CI_AI NULL,
[ORG_LEVEL_2] [nvarchar] (200) COLLATE Latin1_General_100_CI_AI NULL,
[ORG_LEVEL_3] [nvarchar] (200) COLLATE Latin1_General_100_CI_AI NULL,
[ORG_LEVEL_4] [nvarchar] (200) COLLATE Latin1_General_100_CI_AI NULL,
[ORG_LEVEL_5] [nvarchar] (200) COLLATE Latin1_General_100_CI_AI NULL
) ON [PRIMARY]
GO
