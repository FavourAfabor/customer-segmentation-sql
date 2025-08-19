SELECT
[Sales]. [SalesOrderHeader]. [CustomerID],
CONCAT ([Person] [Person]. [FirstNamel,' ', [Person]. [Person]. [LastName]) AS FULL_NAME,
SUM([Sales]. [SalesOrderHeader].[TotalDue]) AS Total_Purchase,
CASE
WHEN SUM([Sales].SalesOrderHeader].[TotalDue])>= 10000 THEN 'GOLD'
WHEN SUM([Sales].[SalesOrderHeader][TotalDue]) BETWEEN 5000 AND 9999 THEN 'SILVER'
ELSE 'BRONZE'
END AS CustomerTier
FROM [Sales]. [SalesOrderHeader]
JOIN [Sales]. [Customer]
ON [Sales] [SalesOrderHeader]. [CustomerID] = [Sales]. [Customer]. [CustomerID]
JOIN [Person]. [Person]
ON [Sales]. [Customer][PersonID] = [Person]. [Person]. [BusinessEntityID]
GROUP BY
[Sales] [SalesOrderHeader]. [CustomerID],
[Person]. [Person]. [FirstName],
[Person]. [Person]. [LastName]
ORDER BY Total_Purchase DESC;
