--SELECT : Veri Tabaný nesnelerini ve tablolardaki kayýtlarý 
-- listelemek için kullanýlýr. Kayýtlarý sadece liste olarak alabilir 
-- ya da istersek üzerinde hesaplamalar yaptýrabiliriz.
-------------------------------------------------------

-- SELECT [TOP 10 PERCENT] alan_listesi FROM Tablo_adý WHERE filtre_ifadesi

--CREATE VIEW ProductListView
--AS
--SELECT [ProductName],[Renk],[Materyal],[Maliyet]  FROM Products


--CREATE View ProductCostsView
--AS
--SELECT [ProductName] AS 'Ürün',[Renk],[Materyal],[Maliyet],Maliyet*0.2 AS 'KDV Tutarý (%20)' ,maliyet*1.2 AS 'KDV Dahil Tutar' FROM Products

--SELECT * FROM Products

--SELECT * FROM sys.databases
--SELECT name,type_desc,max_column_id_used FROM sys.tables

--CREATE VIEW SaleDetailReportView
--AS
--SELECT ProductID,Quantity,UnitPrice,[VAT],[DiscountRate]
--,Quantity*UnitPrice AS 'Toplam Tutar' 
--,Quantity*UnitPrice*DiscountRate As 'Ýndirim Tutarý'  
--,(Quantity*UnitPrice)-(Quantity*UnitPrice*DiscountRate) AS 'Ýndirimli Tutar'
--,((Quantity*UnitPrice)-(Quantity*UnitPrice*DiscountRate)) * (1+VAT) AS 'KDV Dahil Tutar'  
--FROM [dbo].[SaleDetails]

--CREATE VIEW CountOfReceiptsReportView
--AS
--SELECT COUNT(SaleID) AS 'Fatura Adedi' FROM Sales

--CREATE VIEW CountOfCustomersView
--AS
--SELECT COUNT(*) AS 'Müþteri Sayýsý' FROM Customers

--CREATE VIEW SumOfProductsReportView
--AS
--SELECT SUM(Quantity) AS 'Satýlan Toplam Ürün Adedi' FROM SaleDetails

------------------------------------------------------------------------
-------------------------- NORTHWIND -----------------------------------
------------------------------------------------------------------------

--
--SELECT ProductName,[UnitPrice],[UnitsInStock],[Discontinued]  FROM Products WHERE UnitsInStock > 0 OR Discontinued = 0

--
--SELECT ProductName,UnitPrice,UnitsInStock,UnitPrice*UnitsInStock AS 'Stok Deðeri' FROM Products

--
--SELECT ProductName,UnitPrice,UnitsInStock,ReorderLevel FROM Products WHERE ReorderLevel > UnitsInStock AND Discontinued = 0

--SELECT COUNT(ProductName) AS 'Ürün Adedi',SUM(UnitPrice*UnitsInStock) AS 'Toplam Stok Deðeri' FROM Products

--SELECT CategoryID, COUNT(ProductName) AS 'Ürün Adedi',SUM(UnitPrice*UnitsInStock) AS 'Toplam Stok Deðeri' FROM Products GROUP BY CategoryID

--SELECT cOUNT(CategoryName),SUBSTRING(Description,1,50) FROM Categories GROUP BY SUBSTRING(Description,1,50)


--SELECT  dbo.Categories.CategoryName, SUBSTRING(dbo.Categories.Description, 1, 50) AS [Kategori Açýklamasý], COUNT(dbo.Products.ProductName) AS [ürün adedi], SUM(dbo.Products.UnitsInStock * dbo.Products.UnitPrice) 
--                         AS [Toplam  stok deðeri]
--FROM dbo.Products INNER JOIN
--    dbo.Categories ON dbo.Products.CategoryID = dbo.Categories.CategoryID
--GROUP BY dbo.Categories.CategoryName, SUBSTRING(dbo.Categories.Description, 1, 50)


--SELECT 
--[OrderID],[ProductID],[UnitPrice],[Quantity],[Discount],
--[UnitPrice]*[Quantity] AS 'Tutar',
--[UnitPrice]*[Quantity]*[Discount] AS 'Ýndirim Tutarý',
--([UnitPrice]*[Quantity])-([UnitPrice]*[Quantity]*[Discount]) AS 'Ýndirimli Tutar'
--from [Order Details]

--SELECT 
--FORMAT(SUM([UnitPrice]*[Quantity]),'C','tr-TR') AS 'Toplam Tutar',
--FORMAT(SUM([UnitPrice]*[Quantity]*[Discount]),'C','tr-TR') AS 'Ýndirimler Toplamý',
--FORMAT(SUM(([UnitPrice]*[Quantity])-([UnitPrice]*[Quantity]*[Discount])),'C','tr-TR') AS 'Ciro'
--FROM [Order Details]

--Ürüne göre satýþ raporu
--SELECT ProductID,
--FORMAT(SUM([UnitPrice]*[Quantity]),'C','tr-TR') AS 'Toplam Tutar',
--FORMAT(SUM([UnitPrice]*[Quantity]*[Discount]),'C','tr-TR') AS 'Ýndirimler Toplamý',
--FORMAT(SUM(([UnitPrice]*[Quantity])-([UnitPrice]*[Quantity]*[Discount])),'C','tr-TR') AS 'Ciro'
--FROM [Order Details]
--GROUP BY ProductID
--ORDER by SUM(([UnitPrice]*[Quantity])-([UnitPrice]*[Quantity]*[Discount])) DESC

-- Sipariþe göre satýþ tutarlarý Raporu
--ALTER VIEW [Sipariþe göre satýþ tutarlarý Raporu]
--AS
--SELECT OrderID,
--FORMAT(SUM([UnitPrice]*[Quantity]),'C','tr-TR') AS 'Toplam Tutar',
--FORMAT(SUM([UnitPrice]*[Quantity]*[Discount]),'C','tr-TR') AS 'Ýndirimler Toplamý',
--FORMAT(SUM(([UnitPrice]*[Quantity])-([UnitPrice]*[Quantity]*[Discount])),'C','tr-TR') AS 'Ciro',
--SUM(([UnitPrice]*[Quantity])-([UnitPrice]*[Quantity]*[Discount])) AS 'CurCiro'
--FROM [Order Details]
--GROUP BY OrderID
----ORDER by SUM(([UnitPrice]*[Quantity])-([UnitPrice]*[Quantity]*[Discount])) DESC

--SELECT [OrderID],[Toplam Tutar],[Ýndirimler Toplamý],[Ciro] FROM [dbo].[Sipariþe göre satýþ tutarlarý Raporu]
--order by CurCiro DESC

--SELECT T.[OrderID],T.[Toplam Tutar],T.[Ýndirimler Toplamý],T.[Ciro] FROM 
--(
--	SELECT OrderID,
--FORMAT(SUM([UnitPrice]*[Quantity]),'C','tr-TR') AS 'Toplam Tutar',
--FORMAT(SUM([UnitPrice]*[Quantity]*[Discount]),'C','tr-TR') AS 'Ýndirimler Toplamý',
--FORMAT(SUM(([UnitPrice]*[Quantity])-([UnitPrice]*[Quantity]*[Discount])),'C','tr-TR') AS 'Ciro',
--SUM(([UnitPrice]*[Quantity])-([UnitPrice]*[Quantity]*[Discount])) AS 'CurCiro'
--FROM [Order Details]
--GROUP BY OrderID
--) AS T
--order by T.CurCiro DESC


CREATE PROC [SP_Sipariþe_göre_satýþ_tutarlarý_Raporu]
AS
SELECT OrderID,
FORMAT(SUM([UnitPrice]*[Quantity]),'C','tr-TR') AS 'Toplam Tutar',
FORMAT(SUM([UnitPrice]*[Quantity]*[Discount]),'C','tr-TR') AS 'Ýndirimler Toplamý',
FORMAT(SUM(([UnitPrice]*[Quantity])-([UnitPrice]*[Quantity]*[Discount])),'C','tr-TR') AS 'Ciro',
SUM(([UnitPrice]*[Quantity])-([UnitPrice]*[Quantity]*[Discount])) AS 'CurCiro'
FROM [Order Details]
GROUP BY OrderID
ORDER by SUM(([UnitPrice]*[Quantity])-([UnitPrice]*[Quantity]*[Discount])) DESC


EXEC [SP_Sipariþe_göre_satýþ_tutarlarý_Raporu]


--CREATE PROC DB_Yarat
--AS
--CREATE DATABASE TEST


--CREATE PROC DB_Sil
--AS
--DROP DATABASE TEST


--EXEC DB_Yarat

--EXEC DB_Sil