CREATE TABLE [dbo].[SHR_GBL_GeoCodeType]
(
[GCTypeID] [tinyint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SHR_GBL_GeoCodeType] ADD CONSTRAINT [PK_SHR_GBL_GeoCodeType] PRIMARY KEY CLUSTERED  ([GCTypeID]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[SHR_GBL_GeoCodeType] TO [cioc_login_role]
GO
