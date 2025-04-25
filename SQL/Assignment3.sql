--Task1

WITH 
Sales_Info AS
(
SELECT SOD.SalesOrderID, SOH.CustomerID, SOH.SalesPersonID, SOH.TotalDue FROM Sales.SalesOrderDetail AS SOD
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID=SOH.SalesOrderID
),

Customer_Info AS
(
SELECT SC.CustomerID, COALESCE(P.FirstName + ' ' + P.LastName, S.Name) AS CustomerName, PA.City AS CustomerCity, PA.PostalCode AS CustomerPostalCode FROM Sales.Customer SC
INNER JOIN Person.Person P
ON SC.PersonID=P.BusinessEntityID
LEFT JOIN Person.BusinessEntityAddress AS PBES
ON P.BusinessEntityID=PBES.BusinessEntityID
LEFT JOIN Sales.Store S
ON SC.StoreID=S.BusinessEntityID
LEFT JOIN Person.BusinessEntityAddress AS BEA
ON (P.BusinessEntityID=BEA.BusinessEntityID OR S.BusinessEntityID=BEA.BusinessEntityID)
LEFT JOIN Person.Address AS PA
ON PA.AddressID=BEA.AddressID
),

SalesPerson_Info AS
(
SELECT SP.BusinessEntityID as SalesPersonID, CommissionPct , PA.City AS SalesPersonCity, PA.PostalCode AS SalesPersonPostalCode FROM Sales.SalesPerson as SP
INNER JOIN Person.BusinessEntityAddress AS BES
ON SP.BusinessEntityID=BES.BusinessEntityID
INNER JOIN Person.Address PA
ON BES.AddressID=PA.AddressID
),

Order_Info AS
(
SELECT 
    CI.CustomerID,
    CI.CustomerName,
	SI.SalesPersonID,
    SI.SalesOrderID,
    SI.TotalDue
FROM Customer_Info CI
LEFT JOIN Sales_Info SI
ON CI.CustomerID = SI.CustomerID
WHERE 
    SI.SalesOrderID IS NULL 
    OR EXISTS (
	SELECT 1 FROM Sales_Info SI
	WHERE SI.CustomerID=CI.CustomerID AND SI.SalesPersonID IS NOT NULL
	)
),

Employee_Details AS
(
SELECT E.BusinessEntityID AS EmployeeID, (P.FirstName + ' ' + P.LastName) AS [EmployeeName], D.DepartmentID, D.Name AS DepartmentName, Rate AS Salary  FROM HumanResources.Employee E
LEFT JOIN Person.Person P
ON E.BusinessEntityID=P.BusinessEntityID
LEFT JOIN HumanResources.EmployeeDepartmentHistory EDH
ON E.BusinessEntityID=EDH.BusinessEntityID
LEFT JOIN HumanResources.Department D
ON EDH.DepartmentID=D.DepartmentID
LEFT JOIN HumanResources.EmployeePayHistory EPH
ON E.BusinessEntityID=EPH.BusinessEntityID
)

/*
SELECT  
    SI.SalesPersonID, 
    SI.CustomerID, 
    CI.CustomerName,
    CI.CustomerCity, 
    CI.CustomerPostalCode,
    SP.SalesPersonCity, 
    SP.SalesPersonPostalCode,
	SP.CommissionPct
FROM 
    Sales_Info SI
INNER JOIN 
    Customer_Info CI ON SI.CustomerID = CI.CustomerID
INNER JOIN 
    SalesPerson_Info SP ON SI.SalesPersonID = SP.SalesPersonID
WHERE 
    CI.CustomerCity != SP.SalesPersonCity
)


SELECT SP.SalesPersonID, COUNT(DISTINCT SI.SalesOrderID) AS OrderCount FROM SalesPerson_Info SP
LEFT JOIN Sales_Info SI
ON SP.SalesPersonID=SI.SalesPersonID
GROUP BY SP.SalesPersonID
;



select * from Order_Info
order by CustomerID
;

SELECT ED.*, (SELECT MAX(Salary) FROM Employee_Details) - ED.Salary AS SalaryDifference
FROM  Employee_Details ED;
;
*/



