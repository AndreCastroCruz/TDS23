use AdventureWorks2012

SELECT * FROM PERSON.PERSON
WHERE BusinessEntityID = '5'
OR BusinessEntityID = '111'
OR BusinessEntityID = '23'


SELECT Production.Product.Weight FROM Production.Product
WHERE Weight > '500'
AND weight <= '700'


SELECT * FROM HumanResources.Employee
WHERE MaritalStatus = 'M'
and SalariedFlag = '1'


SELECT * FROM HumanResources.Employee
WHERE MaritalStatus = 'M'
and SalariedFlag = '1'
and BirthDate < '1983/01/01'



SELECT * FROM Person.Person
WHERE FirstName = 'Peter'
and LastName = 'Krebs'

SELECT * FROM Person.EmailAddress
WHERE BusinessEntityID = 26

-- Pegando o nome, last name e o email da peson, informação de várias tabelas em um único select
SELECT Person.Person.FirstName, Person.Person.LastName, Person.EmailAddress.EmailAddress
FROM Person.Person, Person.EmailAddress
WHERE Person.BusinessEntityID = EmailAddress.BusinessEntityID 
and Person.BusinessEntityID = 26


SELECT COUNT(*) as qnt_produtos from Production.Product

SELECT * FROM Production.Product
SELECT distinct name FROM Production.Product
SELECT distinct title FROM Person.Person



-- usando o comando BETWEEN (Usado mais com NUMEROS)
SELECT listPrice FROM Production.Product
WHERE ListPrice >= 1000
AND ListPrice <= 1500

ou

SELECT listPrice FROM Production.Product
WHERE ListPrice Between 1000 and 1500 
--
SELECT * FROM HumanResources.Employee
WHERE HireDate Between '2009/01/01' and '2010/01/01'



--Jeito sem usar o IN para fazer
SELECT * FROM PERSON.PERSON
WHERE BusinessEntityID = '5'
OR BusinessEntityID = '111'
OR BusinessEntityID = '23'

--usando o comando IN
SELECT * FROM Person.Person
WHERE BusinessEntityID IN (5,111,23)



--Usando a tag LIKE para pesquisa
SELECT * FROM Person.Person
WHERE FirstName LIKE 'Ro%'

--Usando a tag LIKE com underline(_) para saber quantas caracteres voce precisa na pesquisa
SELECT * FROM Person.Person
WHERE FirstName LIKE 'R__'




-- QUANTOS PRODUTOS TEMOS NO BD ACIMA DE 1500 DOLARES
SELECT * FROM Production.Product
WHERE ListPrice > 1500


-- QUANTAS PESSOAS TEM O SOBRENOME QUE COMEÇA COM A LETRA P
SELECT * FROM Person.Person
WHERE LastName LIKE 'p%'


-- EM QUANTAS CIDADES UNICAS ESTAO AS PESSOAS/CLIENTES
SELECT COUNT(distinct City) FROM Person.Address
  





SELECT * FROM Production.Product
WHERE Production.Product. in (''

SELECT * FROM Person.Person
WHERE FirstName like '%essa%'






/*

AND - E
OR - OU
NOT - Acompanhado

= - igual
> - Maior
< - Menor
<> - Diferente
>= - 
<= - 

*/




