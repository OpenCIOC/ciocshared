CREATE TABLE [dbo].[SHR_STP_Language]
(
[LangID] [smallint] NOT NULL,
[LanguageName] [nvarchar] (50) COLLATE Latin1_General_100_CI_AI NOT NULL,
[LanguageAlias] [nvarchar] (50) COLLATE Latin1_General_100_CI_AI NOT NULL,
[Culture] [varchar] (5) COLLATE Latin1_General_100_CI_AI NOT NULL,
[LCID] [int] NOT NULL,
[DateFormatCode] [int] NOT NULL CONSTRAINT [DF_STP_Language_DateFormatCode] DEFAULT ((106))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SHR_STP_Language] ADD CONSTRAINT [PK_STP_Language] PRIMARY KEY CLUSTERED  ([LangID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SHR_STP_Language_LangIDIncl] ON [dbo].[SHR_STP_Language] ([LangID]) INCLUDE ([DateFormatCode]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[SHR_STP_Language] TO [cioc_login_role]
GO
