SELECT CustomerKey,
	FirstName,
	LastName,
	g.City,
	g.StateProvinceCode as StateAbbrev,
	g.StateProvinceName as Province,
	s.SalesTerritoryCountry as Country,
	s.SalesTerritoryGroup as Continent
FROM DimCustomer as c
INNER JOIN DimGeography as g
on c.GeographyKey = g.GeographyKey
INNER JOIN DimSalesTerritory as s
on g.SalesTerritoryKey = s.SalesTerritoryKey