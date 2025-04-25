-- Task: Fetch sales order info along with customer and salesperson city details

WITH 
Sales_Info AS (
    SELECT 
        SOD.SalesOrderID, 
        SOH.CustomerID, 
        SOH.SalesPersonID 
    FROM 
        Sales.SalesOrderDetail AS SOD
    INNER JOIN 
        Sales.SalesOrderHeader AS SOH
        ON SOD.SalesOrderID = SOH.SalesOrderID
),

Customer_Info AS (
    SELECT 
        SC.CustomerID,
        ISNULL(P.FirstName + ' ' + P.LastName, S.Name) AS CustomerName,
        PA.City AS CustomerCity,
        PA.PostalCode AS CustomerPostalCode
    FROM 
        Sales.Customer SC
    LEFT JOIN 
        Person.Person P ON SC.PersonID = P.BusinessEntityID
    LEFT JOIN 
        Sales.Store S ON SC.StoreID = S.BusinessEntityID
    LEFT JOIN 
        Person.BusinessEntityAddress BEA 
            ON (P.BusinessEntityID = BEA.BusinessEntityID OR S.BusinessEntityID = BEA.BusinessEntityID)
    LEFT JOIN 
        Person.Address PA ON BEA.AddressID = PA.AddressID
),

SalesPerson_Info AS (
    SELECT 
        SP.BusinessEntityID AS SalesPersonID, 
        PA.City AS SalesPersonCity, 
        PA.PostalCode AS SalesPersonPostalCode
    FROM 
        Sales.SalesPerson AS SP
    INNER JOIN 
        Person.BusinessEntityAddress AS BEA 
            ON SP.BusinessEntityID = BEA.BusinessEntityID
    INNER JOIN 
        Person.Address PA ON BEA.AddressID = PA.AddressID
)

SELECT 
    SI.SalesOrderID, 
    SI.SalesPersonID, 
    SI.CustomerID, 
    CI.CustomerName,
    CI.CustomerCity, 
    CI.CustomerPostalCode,
    SP.SalesPersonCity, 
    SP.SalesPersonPostalCode
FROM 
    Sales_Info SI
INNER JOIN 
    Customer_Info CI ON SI.CustomerID = CI.CustomerID
INNER JOIN 
    SalesPerson_Info SP ON SI.SalesPersonID = SP.SalesPersonID;
