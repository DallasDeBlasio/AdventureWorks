-- view for all of the dates I could find

SELECT
    [p].[OrderDate],
    [p].[ShipDate]
FROM [Purchasing].[PurchaseOrderHeader] AS p
--sad query