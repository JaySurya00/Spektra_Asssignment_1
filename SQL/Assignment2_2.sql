WITH
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

SELECT ED.*, (SELECT MAX(Salary) FROM Employee_Details) - ED.Salary AS SalaryDifference
FROM  Employee_Details ED;