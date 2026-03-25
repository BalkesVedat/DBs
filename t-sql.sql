-- T-SQL : Transact Structured Query Language
-- 3 Gruba ayýrýyoruz. DDL - DML - DCL
-- DDL : Data Definition Language: Veri Altyapýsýný (Nesneleri) Tanýmlama Komutlarý
-- CREATE - ALTER - DROP 
-- CREATE : VT NESNELERÝNÝ (Database-Table-View-SP(Proc)-Trigger-Login) yaratmak için kullanýlýr.
-- CREATE Nesne_Türü Nesne_Adý

USE WeekDaysClass
GO


/* Suppliers TBL
	CREATE TABLE Suppliers
	(
		SupplierID int IDENTITY(1,1) NOT NULL,
		CompanyName nvarchar(50),
		ContactPerson nvarchar(20),
		ContactGSM varchar(10),
		AddressText nvarchar(250),
		Email nvarchar(100)
	)
*/

/* Items TBL

CREATE TABLE Items
(
	ItemID int IDENTITY(1,1) NOT NULL,
	ItemText nvarchar(20)
)

*/


--Create Table Products
--(
--	ProductID int IDENTITY(1,1) NOT NULL,
--	ProductName nvarchar(30),
--	CategoryID int,
--	SizeID int,
--	Renk nvarchar(10),
--	Materyal nvarchar(10),
--	Maliyet money
--)

--CREATE Table Categories
--(
--	CategoryID int IDENTITY(1,1) not null,
--	CategoryText nvarchar(20)
--)

--CREATE Table Sizes
--(
--	SizeID int IDENTITY(1,1) NOT NULL, 
--	CategoryID int,
--	SizeText varchar(10) 
--)


--CREATE Database Test

CREATE Table Sales
(
	SaleID int IDENTITY(1,1) NOT NULL,
	CustomerID int,
	SalesDate smalldatetime,
	PaymentType int, -- TODO: Create PaymentTypes Table
	PaymentDueDayCount int
)

CREATE Table SaleDetails
(
	SaleDetailID int IDENTITY(1,1) NOT NULL,
	SaleID int,



)




-- DROP : VT nesnelerini (Database-Table-View-SP(Proc)-Trigger-Login) silmek için kullanýlýr.
-- DROP Nesne_Türü Nesne_Adý

--DROP Database Test
--DROP TABLE Items

-- ALTER : VT nesnelerini (Database-Table-View-SP(Proc)-Trigger-Login) güncellemek (tasarýmýnda deðiþiklik) için kullanýlýr.
-- ALTER Nesne_Türü Nesne_Adý Yeni_ayarlar

--Tabloya yeni kolon ekleme
--ALTER TABLE Categories 
--	ADD VAT decimal(3,2)

-- Tablonun kolonlarýný güncellemek
--ALTER TABLE Categories
--	ALTER Column CategoryText nvarchar(20)

--ALTER TABLE Categories
--	ALTER Column VAT decimal(5,2)

-- Tablonun kolonlarýný silmek
--ALTER Table Categories
--	DROP Column VAT

---------------------------------------------------------------
--------------------        DML       -------------------------
---------------------------------------------------------------

-- DML : Data Manipulation Language - Tablolarda veri iþleme ve düzenleme komutlarý
-- INSERT - UPDATE - DELETE - SELECT

--INSERT : tablolara kayýt eklemek için kullanýlýr.
-- INSERT INTO tablo_adý (alan listesi) VALUES (veriler) 

--INSERT INTO Suppliers 
--([CompanyName],[ContactGSM],[ContactPerson],[Email]) 
--VALUES 
--('ABC Ticaret','5555555555','Ali Bey','ali@abc.com')

--INSERT INTO Suppliers
--VALUES
--('XYZ Toptancýsý','Fatma Haným','4444444444',NULL,'fatma@xyz.com')





