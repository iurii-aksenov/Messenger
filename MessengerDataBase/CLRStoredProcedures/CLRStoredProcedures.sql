USE MessengerDb
GO
-- =============================================
-- Author:		Yuriy Aksenov
-- Create date: 08.05.2017
-- Description:	Assembly CLRStoredProcedures count the number of contact friends
-- =============================================
CREATE ASSEMBLY CLRStoredProcedures
FROM 'D:\ИТМО университет\Проектирование БД\MessengerDB\CLRStoredProcedures\CLRStoredProcedures\CLRStoredProcedures\bin\Debug\CLRStoredProcedures.dll'
    WITH PERMISSION_SET = SAFE
GO
EXEC sp_configure 'clr_enabled',1
GO
RECONFIGURE
GO

