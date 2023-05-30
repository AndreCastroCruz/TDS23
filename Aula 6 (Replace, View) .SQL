USE AdventureWorks2012

SELECT * FROM Person.Person


--Testando a TAG UPPER e LOWER, mostrando o texto em caixa alta e caixa baixa, respectivamente.
SELECT FirstName, UPPER (FirstName), Lastname, LOWER(LastName) FROM Person.Person

--TAG LEN (LENGHT), que mostra o tamanho dos itens.

SELECT FirstName, LEN(FirstName) FROM Person.Person
WHERE LEN(FirstName) <= 2

--Tratamento de erro gramatical no Brasil (.) 
SELECT FirstName, SUBSTRING(FirstName,2,1) FROM Person.Person
WHERE SUBSTRING(FirstName,2,1) = '.'


SELECT * FROM Production.Product

SELECT ProductNumber, REPLACE(ProductNumber,'-','-2023-') FROM Production.Product


-- CRIANDO UMA VIEW
SELECT FirstName, MiddleName, LastName FROM Person.Person

-- VIEW
CREATE OR ALTER VIEW NOMES AS
SELECT FirstName, MiddleName, LastName
FROM Person.Person
WHERE title = 'Ms.'

SELECT * FROM NOMES
ORDER BY 3 DESC




SELECT * FROM PErson.EmailAddress

CREATE OR ALTER VIEW EMAILS AS
SELECT A.BusinessEntityID AS ID,A.FirstName AS NOME, B.EmailAddress AS EMAILS
FROM Person.Person AS A
INNER JOIN Person.EmailAddress AS B
ON A.BusinessEntityID = B.BusinessEntityID

SELECT * FROM EMAILS


-- Usando um GABI com VIEW
SELECT Person.Person.*, EMAILS.* FROM Person.Person, EMAILS
WHERE Person.BusinessEntityID = EMAILS.ID


SELECT * FROM NOMES

DROP VIEW NOMES












