-- will be used as a view for the shipping location

CREATE VIEW 
    [Sales].[vw_Sales_Location_Dim] AS 
SELECT 
    [p].[BusinessEntityID],
    [a].[City],
    [a].[PostalCode],
    [a].[AddressLine1]

FROM [Person].[Person] AS p
    INNER JOIN [Person].[BusinessEntityAddress] AS bea 
    ON [p].[BusinessEntityID] = [bea].[BusinessEntityID]
    INNER JOIN [Person].[Address] AS a 
    ON [bea].[AddressID] = [a].[AddressID]
;