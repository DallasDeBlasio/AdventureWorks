-- creating the view for customers

CREATE VIEW
    [Sales].[vw_Sales_Customer_Dim] AS 
SELECT 
    [c].[CustomerID] AS [CustomerKey], 
    CONCAT ([p].[FirstName], ' ', [p].[LastName]) AS [Customer Name],
    ISNULL([t].[Name], 'None') AS [Territory Name],
    0 AS isbusiness
FROM [Sales].[Customer] AS c 
    INNER JOIN [Person].[Person] AS p
    ON [c].[PersonID] = [p].[BusinessEntityID] 
    LEFT JOIN [Sales].[SalesTerritory] AS t 
    ON [c].[TerritoryID] = [t].[TerritoryID]

UNION ALL
SELECT
    [c].[CustomerID] AS [CustomerKey], 
    [s].[Name] AS [Customer Name],
    ISNULL([t].[Name], 'None') AS [Territory Name],
    1 as isbusiness
FROM [Sales].[Customer] AS c 
    INNER JOIN [Sales].[Store] AS s 
    ON [c].[StoreID] = [s].[BusinessEntityID]
    LEFT JOIN [Sales].[SalesTerritory] AS t 
    ON [c].[TerritoryID] = [t].[TerritoryID]
;