--products view for start schema

CREATE VIEW 
    [Sales].[vw_Sales_Product_Dim] AS 
SELECT 
    [p].[ProductID] AS [ProductKey],
    [p].[Name] AS [Product Name],
    [p].[ProductNumber],
    [p].[Color],
    [p].[MakeFlag],
    ISNULL([pm].[ProductModelID], 0) AS [ProductModelID],
    ISNULL([pm].[Name], 'None') AS [ModelName],
    ISNULL([pc].[Name], 'None') AS [Category Name],
    ISNULL([psc].[Name], 'None') AS [Subcategory Name]
FROM [Production].[Product] AS p
    LEFT JOIN [Production].[ProductModel] AS pm 
    ON [p].[ProductModelID] = [pm].[ProductModelID]
    LEFT JOIN [Production].[ProductSubcategory] AS psc
    ON [p].[ProductSubcategoryID] = [psc].[ProductSubcategoryID]
    LEFT JOIN [Production].ProductCategory AS pc 
    ON [psc].[ProductCategoryID] = [pc].[ProductCategoryID]
;

    