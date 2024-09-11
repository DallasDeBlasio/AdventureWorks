--Fact table with product key

CREATE VIEW 
    [Sales].[vw_Sales_fact] AS 
SELECT
    [s].[SpecialOfferID] AS [SpecialOfferKey],
    [s].[ProductID] AS [ProductKey],
    [s].[UnitPrice],
    [s].[OrderQty],
    [so].[DiscountPct]
FROM [Sales].[SalesOrderDetail] AS s 
    INNER JOIN [Sales].[SpecialOffer] AS so 
    ON [s].[SpecialOfferID] = [so].[SpecialOfferID] 
;