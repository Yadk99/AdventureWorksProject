SELECT ProductKey,
	EnglishProductName as ProductName,
	ModelName,
	sub.EnglishProductSubcategoryName as Subcategory,
	cat.EnglishProductCategoryName as Category,
	ListPrice,
	StandardCost as Cost,
	Round(ListPrice - StandardCost, 2) as ProfitMargin,
	RANK () OVER(ORDER BY 
		Round(ListPrice - StandardCost, 2) DESC)
	ProfitRank
FROM DimProduct as p
INNER JOIN DimProductSubcategory as sub
on p.ProductSubcategoryKey = sub.ProductSubcategoryKey
LEFT JOIN DimProductCategory as cat
on sub.ProductCategoryKey = cat.ProductCategoryKey
ORDER BY ProductKey ASC