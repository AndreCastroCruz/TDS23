USE AdventureWorks2012

--DESAFIO
--Selecionar daperson.person o FirstName, Title and MidleName de todos que tem Mr. no nome e também
--Todos que tem middle name = a

SELECT * FROM Person.Person

SELECT FirstName, Title, MiddleName
FROM Person.Person
WHERE Title = 'Mr.'
AND MiddleName IS NOT NULL
UNION
SELECT FirstName, Title, MiddleName
FROM Person.Person
WHERE MiddleName = 'A'
AND Title IS NOT NULL
ORDER BY MiddleName ASC

--DESAFIO agrupar todos os uncionarios que entraram no mesmo ano

use Northwind

SELECT * FROM Employees

SELECT E.FirstName, E.HireDate, EE.FirstName, EE.HireDate  FROM Employees E, Employees EE
WHERE DATEPART(MONTH, E.HireDate) = DATEPART(MONTH, EE.HireDate)

--Mostrar a média mensal de valores vendidos
--SALES.SALESORDERHEADER
USE AdventureWorks2012

SELECT * FROM Sales.SalesOrderHeader;

SELECT AVG(TotalDue), DATEPART(MONTH, OrderDate) 'MÊS' FROM Sales.SalesOrderHeader
GROUP BY DATEPART(MONTH, OrderDate)
ORDER BY 2 DESC

--QUAIS OS PRODUTOS QUE ESTÃO ACIMA DA MEDIA DAS VENDAS
--PRODCTION.PRODUCT - ID, LISTPRICE
--SUB SELECT - PRODUCTION.PRODUCT

SELECT * FROM Production.Product
ORDER BY ListPrice DESC

SELECT PP.ProductID, AVG(PP.ListPrice) FROM Production.Product PP
GROUP BY ProductID
ORDER BY 2 DESC

SELECT ProductID,Name, ListPrice FROM Production.Product P
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product)
ORDER BY ListPrice;