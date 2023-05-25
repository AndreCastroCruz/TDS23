USE AdventureWorks2012

--QUANTOS PRODUTOS VERMELHOS TEM PREÇO ENTRE 500 E 1000
SELECT COUNT(*) AS 'Produtos Vermelho' FROM Production.Product
WHERE ListPrice Between 500 and 1000
AND Color = 'red'


--PRODUTOS QUE TEM ESSA SEQUENCIA DE CARACTERESROAD 
--Quais
SELECT * FROM Production.Product
WHERE Name LIKE '%ROAD%'

--Quantos
SELECT COUNT(*) AS 'Produtos ROAD' FROM Production.Product
WHERE Name LIKE '%ROAD%'




SELECT * FROM Sales.SalesOrderDetail

--PEGANDO OS TOP 10 DE BAIXO PARA CIMA, UTILIZANDO O 'ORDER BY' 
SELECT TOP 10 * FROM Sales.SalesOrderDetail 
ORDER BY LineTotal ASC

--PEGANDO OS TOP 10 DE CIMA PARA BAIXO, UTILIZANDO O 'ORDER BY'
SELECT TOP 10 * FROM Sales.SalesOrderDetail 
ORDER BY LineTotal DESC


--Somando todos os valores dos produtos
SELECT SUM(LineTotal) AS TOTALVENDAS FROM Sales.SalesOrderDetail


--Maior numero da coluna 
SELECT MAX(LineTotal) AS TOTALVENDAS FROM Sales.SalesOrderDetail


--Média geral das vendas (AVG = Média) sempre
SELECT AVG(LineTotal) AS TOTALVENDAS FROM Sales.SalesOrderDetail


--Menor numero da coluna 
SELECT MIN(LineTotal) AS TOTALVENDAS FROM Sales.SalesOrderDetail



-- Contando quantos nomes iguais aparecem
SELECT FirstName, COUNT(FirstName) AS Qntd_Nomes FROM Person.Person
GROUP BY FirstName 

--Mostrando quais ofertas e valores gerado por cada uma delas ()
SELECT SpecialOfferID, SUM(UnitPrice) AS Total_Venda FROM Sales.SalesOrderDetail 
GROUP BY SpecialOfferID
ORDER BY SpecialOfferID ASC 

--Mostrando quais ofertas e o valor gerado por cada uma delas (ordenando pelo SUM)
SELECT SpecialOfferID, SUM(UnitPrice) AS Total_Venda FROM Sales.SalesOrderDetail 
GROUP BY SpecialOfferID
ORDER BY SUM(UnitPrice) DESC



SELECT ProductID, COUNT(ProductID) AS Qtd_Produtos FROM Sales.SalesOrderDetail
GROUP BY ProductID


-- média dos precos dos produtos que são pratas
SELECT AVG(ListPrice) AS Média_preços FROM Production.Product
WHERE Color = 'silver'
GROUP BY Color

-- Quantas pessoas tem o mesmo middlename e quais são
SELECT MiddleName, COUNT(MiddleName) AS Qntd_nomes FROM Person.Person
GROUP BY MiddleName
ORDER BY MiddleName



--Desafios:
--Qual a média que cada(distinct) produto é vendido? (Sales)

SELECT ProductID, AVG(OrderQty) AS Qnt_vendidos FROM Sales.SalesOrderDetail
GROUP BY ProductID


--quais os 10 produtos que no total tiveram os maiores valores de venda
--agrupados por produto do maior para o menor (Sales)

SELECT TOP 10 ProductID, SUM(LineTotal) FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(LineTotal) DESC


--Quantos produtos e qual a qntd media de produtos temos cadastrados nas
--ordens de serviço (WordOrder) - Agrupar pelo id do produto (Product)

SELECT ProductID, COUNT(ProductID) AS Qnt, AVG(OrderQty) AS Média 
FROM Production.WorkOrder
GROUP BY ProductID



--A tag 'HAVING' procura o Agrupamento 
SELECT FirstName, COUNT(FirstName) AS Qnt_nomes
FROM Person.Person
WHERE FirstName LIKE 'A%'
GROUP BY FirstName
HAVING COUNT(FirstName) > 10


--DESAFIO:
--Agrupar produtos por vendas totais entre 162k e 500k

SELECT ProductID, SUM(LineTotal) AS 'Soma de Vendas'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) BETWEEN 162000 and 500000;


--Quais produtos nao estao trazendo em media vendas de 1 milhao no total OBS: (Quando falar NAO na questao, geralmente usa '<'(menor))

SELECT ProductID, AVG(LineTotal) AS 'Média_vendas' FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) < 1000


