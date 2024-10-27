

USE master;

--CREATE DATABASE DB1;

--IF NOT EXISTS(SELECT * FROM sys.databases WHERE NAME = 'DB1')
--BEGIN
--	CREATE DATABASE DB1;
--END


IF NOT EXISTS(SELECT * FROM sys.databases WHERE NAME = 'DB1')
BEGIN
	DROP DATABASE DB1;
END

----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------










