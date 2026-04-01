-------------------------------------------------------
--------------- STORED PROCEDURES - SPs ---------------
-------------------------------------------------------
----------------------------------------
--CREATE PROC SP_MüþteriListesi
--AS
--BEGIN
--	-- Bu sp örnek için yaratýldý
--	--USE Northwind
--	--GO

--	SELECT * FROM Customers 
--END
------------------------------------------
--EXEC SP_MüþteriListesi
------------------------------------------
--CREATE PROC KategoridekiÜrünler 
--(
--	@CategoryID int
--)
--AS
--BEGIN
--	SELECT * FROM Northwind.dbo.Products 
--		WHERE CategoryID = @CategoryID
--END
----------------------------------------------
--EXEC KategoridekiÜrünler 8
----------------------------------------------

--CREATE PROC KategoriEkle
--(
--	@CategoryName nvarchar(15),
--	@Description ntext
--)
--AS
--BEGIN
--	INSERT INTO Categories 
--	(CategoryName,Description)
--	VALUES
--	(@CategoryName,@Description)
--END
----------------------------------------------------------------------
--EXEC KategoriEkle 'Bakliyat','Kurufasülye, Nohut, Mercimek, v.b.'
----------------------------------------------------------------------

--CREATE Proc SPKategoriSil
--(@CategoryID int)
--AS
--BEGIN
--	DELETE FROM Categories WHERE CategoryID = @CategoryID
--END

--------------------------------------------------------------
--EXEC SPKategoriSil 8
--------------------------------------------------------------
--CREATE TABLE Users
--(
--	UserID int IDENTITY(1,1) NOT NULL,
--	UserName varchar(15) NOT NULL,
--	Password nvarchar(15) NOT NULL,
--	CONSTRAINT PK_Users_UserID PRIMARY KEY CLUSTERED (UserID ASC)  
--)

--INSERT INTO Users VALUES ('vedat','1234')
--INSERT INTO Users VALUES ('sa','1')
--INSERT INTO Users VALUES ('user1','user1')
--INSERT INTO Users VALUES ('admin','password')

-------------------------------------------------
--ALTER Proc UserKontrol
----Parametre alacaksa, parametre deðiþkenleri burada tanýmlanýr
----(@ParametreDeðiþkeni1 tip1, @ParametreDeðiþkeni2 tip2, ... )
--(@username varchar(15), @password nvarchar(15))
--AS
--BEGIN
--	--Ýçeride deðiþken tanýmlanacaksa DECLARE ifadesi ile yazarýz.
--	--DECLARE @degisken1 tip1, @degisken2 tip2, ...

--	DECLARE @gelenpassword nvarchar(15)

--	DECLARE @sayac int = 0 --ilk deðer atamasý yaptýk
	
--	SELECT @sayac = COUNT(UserID) FROM Users WHERE UserName = @username

--	if @sayac > 0 	
--		BEGIN
--			SELECT @gelenpassword = Password FROM Users WHERE UserName = @username

--			if @gelenpassword = @password 
--				BEGIN 
--					Print 'Giriþ Baþarýlý'
--					SELECT 1 AS 'Status'
--				END
--			ELSE
--				BEGIN
--					Print 'Þifre Hatalý'
--					SELECT 0 AS 'Status'
--				END
--		END
--	else
--		BEGIN
--			SELECT 0  AS 'Status'
--			PRINT 'Kullanýcý Bulunamadý'
--		END
--END

------------
--EXEC UserKontrol 'sa', '1'
-------------------

--ALTER TRIGGER TrgUserInsertLog
--ON Users FOR Delete
--AS
--Begin
--	DECLARE @silinen nvarchar(100)

--	SELECT @silinen = UserName from Deleted

--	Insert Into ProcessLogs Values ('Kullanýcý Silindi-'+@silinen, SYSTEM_USER ,GETDATE())
--End

-----------------------------------
--DELETE FROM Users where USERID = 3
