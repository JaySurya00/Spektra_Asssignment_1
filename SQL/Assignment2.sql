select EmployeeID, e.DepartmentID, DepartmentName  from Employees e
inner join Departments d
on e.DepartmentID=d.DepartmentID
order by e.EmployeeID
;

select p.ProductID, p.ProductName, p.CategoryID, c.CategoryName from dbo.Products as p
left join dbo.Categories as c
on p.CategoryID= c.CategoryID
order by c.CategoryName;


select * from dbo.Customers as c
right join dbo.Orders as o
on c.CustomerID=o.CustomerID
where c.CustomerName is NULL
;


select
ProductID,
sum(SaleAmount) as [Total Sales Amount], avg(SaleAmount) as [Avg Sales Amount],
count(SaleID) as [Number of Sales], sum(SaleAmount) as [Total Sales],
max(SaleAmount) as [Max Sales Amount],
min(SaleAmount) as [Min Sales Amount]
from dbo.Sales
group by dbo.Sales.ProductID
;

select EmployeeID, sum(SalesAmount) as [Total Sales Amount], (sum(SalesAmount)/12) as [Monthly AVG Sales] from dbo.Performance
group by EmployeeID
having sum(SalesAmount)>6000
;