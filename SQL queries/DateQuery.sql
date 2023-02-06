SELECT DateKey,
	EnglishDayNameOfWeek as DayOfWeek,
	EnglishMonthName as Month,
	CalendarQuarter as Quarter,
	CalendarYear as Year
FROM DimDate
WHERE DateKey >= (SELECT MIN(OrderDateKey) FROM FactResellerSales)