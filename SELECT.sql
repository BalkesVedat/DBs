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

