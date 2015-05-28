CREATE TABLE [dbo].[SHR_STP_Error]
(
[Error] [int] NOT NULL,
[LangID] [smallint] NOT NULL,
[Description] [nvarchar] (255) COLLATE Latin1_General_100_CS_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SHR_STP_Error] ADD CONSTRAINT [PK_SHR_STP_Error] PRIMARY KEY CLUSTERED  ([Error], [LangID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SHR_STP_Error] ADD CONSTRAINT [FK_SHR_STP_Error_SHR_STP_Language] FOREIGN KEY ([LangID]) REFERENCES [dbo].[SHR_STP_Language] ([LangID])
GO
