-- AULA 4 

CREATE DATABASE AULAJOIN

USE AULAJOIN

CREATE TABLE TabelaA (
id int,
nome varchar(10)
)

CREATE TABLE tabelaB (
id int,
nome varchar(10)
)





INSERT INTO TabelaA (id, nome) values (1, 'Robo')
INSERT INTO TabelaA (id, nome) values (2, 'Macaco')
INSERT INTO TabelaA (id, nome) values (3, 'Samurai')
INSERT INTO TabelaA (id, nome) values (4, 'Monitor')

INSERT INTO TabelaB (id, nome) values (1, 'Espada')
INSERT INTO TabelaB (id, nome) values (2, 'Robo')
INSERT INTO TabelaB (id, nome) values (3, 'Mario')
INSERT INTO TabelaB (id, nome) values (4, 'Samurai')

SELECT * FROM tabelaA
SELECT * FROM tabelaB

--Caso der F5 na mesma informação e ela estiver copiada, esse comando serve para excluir
DELETE FROM TabelaA WHERE id = 1
DELETE FROM TabelaA WHERE id = 2
DELETE FROM TabelaA WHERE id = 3
DELETE FROM TabelaA WHERE id = 4

-- Utilizando o INNER JOIN
SELECT * FROM tabelaA A
INNER JOIN tabelaB B
On A.nome = B.nome


-- Usando FULL OUTER JOIN
SELECT * FROM TabelaA A
FULL OUTER JOIN tabelaB B
ON A.nome = B.nome

--Usando o LEFT JOIN
SELECT * FROM TabelaA a
LEFT JOIN tabelaB B
ON A.nome = B.nome
WHERE b.nome is null 

--Usando o LEFT JOIN, pegando os nomes que estao em B mas nao estao em A
SELECT * FROM TabelaA a
LEFT JOIN tabelaB B
ON A.nome = B.nome
WHERE b.nome is null 

--Usando o RIGHT JOIN, pegando os nomes que estao em A mas nao estao em B
SELECT * FROM TabelaA a
RIGHT JOIN tabelaB B
ON A.nome = B.nome
WHERE a.nome is null 



--usando UNION
--Unindo dois SELECT como uma lista só
USE AdventureWorks2012

SELECT ProductID, Name, ProductNumber FROM Production.Product
WHERE NAME like '%CHAI%'
UNION
SELECT ProductID, Name, ProductNumber FROM Production.Product
WHERE NAME like '%DECAL%'


/* DESAFIOS:

PERSON.PERSON / email address
ID, FIrstName, last name, email

*/

SELECT P.BusinessEntityID, P.FirstName, P.LastName, PE.EmailAddress, HR.JobTitle
FROM Person.Person P 
INNER JOIN Person.EmailAddress PE
ON P.BusinessEntityID = PE.BusinessEntityID
INNER JOIN HumanResources.Employee HR
ON p.BusinessEntityID = hr.BusinessEntityID
WHERE Hr.JobTitle LIKE '%DESI%'

SELECT * FROM HumanResources.Employee


--Nome dos Produtos e as informações de subcategoria
--LISTPRICE, NAME, SUBCATEGORIA
--Product/Produt.subcate

SELECT * FROM Production.Product PR
SELECT * FROM Production.ProductSubcategory PC

SELECT PR.ListPrice AS Preço, PR.Name AS Produto, PC.Name AS SubCategoria 
FROM Production.Product AS PR
INNER JOIN Production.ProductSubcategory AS PC
ON PR.ProductSubcategoryID = PC.ProductSubcategoryID




--Trazer o cliente id, tipo de telefone, o numero do telefone
--personphone e phonenumbertype

SELECT * FROM Person.PersonPhone
SELECT * FROM Person.PhoneNumberType

SELECT PP.BusinessEntityID,PN.FirstName AS NOME, PT.Name, PP.PhoneNumberTypeID, PP.PhoneNumber
FROM Person.PersonPhone AS PP
INNER JOIN Person.PhoneNumberType AS PT
ON PP.PhoneNumberTypeID = PT.PhoneNumberTypeID
INNER JOIN Person.Person AS PN
ON PP.BusinessEntityID = PN.BusinessEntityID




--Preciso das pessoas que tem cartao de credito registrado
--ID, nome, email

--Preciso de pessoas que n tem um cartao de credito registrado
--id, nome, email

--Perso.Perso, , emailaddress

SELECT * FROM Person.Person --19972
SELECT * FROM Person.EmailAddress
SELECT * FROM Sales.PersonCreditCard

SELECT pp.BusinessEntityID, pp.FirstName AS Nome, PC.CreditCardID  
FROM  Person.Person AS PP
INNER JOIN Sales.PersonCreditCard AS PC
ON PP.BusinessEntityID = PC.BusinessEntityID

SELECT pp.BusinessEntityID, pp.FirstName AS Nome, PC.CreditCardID  
FROM  Person.Person AS PP
LEFT JOIN Sales.PersonCreditCard AS PC
ON PP.BusinessEntityID = PC.BusinessEntityID
WHERE PC.CreditCardID IS NULL


SELECT * FROM Production.Product ORDER BY ListPrice DESC

SELECT AVG(ListPrice) FROM Production.Product

--438,6662

SELECT ProductID, ListPrice FROM Production.Product
WHERE ListPrice > 438.6662

SELECT ProductID, ListPrice FROM Production.Product
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product)


--Nome dos funcionarios que são design engineer 
SELECT * FROM Person.Person
--BussinesEntityID
SELECT * FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer'

SELECT FirstName FROM Person.Person
WHERE BusinessEntityID IN (5,6,15)

SELECT FirstName 
FROM Person.Person
WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer')

SELECT FirstName FROM Person.Person P
INNER JOIN HumanResources.Employee HE
ON P.BusinessEntityID = He.BusinessEntityID
WHERE HE.JobTitle = 'Design Engineer'
