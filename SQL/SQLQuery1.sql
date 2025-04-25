
select * from Production.ProductCategory
where ProductCategoryID in (1,2,3);


select ProductID, p.Name, pc.ProductCategoryID, p.ListPrice as Price from Production.Product p
inner join Production.ProductSubcategory psc
on p.ProductSubcategoryID=psc.ProductSubcategoryID
inner join Production.ProductCategory pc
on psc.ProductCategoryID=pc.ProductCategoryID
where pc.ProductCategoryID=1 or p.ListPrice>100
order by pc.ProductCategoryID
;

select * from Sales.SalesOrderDetail od
inner join Sales.SalesOrderHeader oh
on od.SalesOrderID=oh.SalesOrderID
where oh.OrderDate between '2012-01-01' and '2014-01-01'
;
 
select * from Sales.SalesOrderDetail od
inner join Sales.SalesOrderHeader oh
on od.SalesOrderID=oh.SalesOrderID
inner join Sales.Customer sc
on oh.CustomerID= sc.CustomerID
;

select ProductID, Name, ListPrice from Production.Product
order by ListPrice desc
;

select * from person.Person
where FirstName Like 'Jo%'
;

select * from person.Person
where LastName Like '%son'
;

select distinct jobTitle from HumanResources.Employee;
