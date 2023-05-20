USE AdventureWorks2012

SELECT * FROM SYS.tables
SELECT * FROM Person.Person
SELECT FirstName FROM Person.Person

SELECT FirstName AS PrimeiroNome,
		LastName AS UltimoNome 
		FROM Person.Person