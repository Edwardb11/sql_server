-- Window Functions --
SELECT
	City,
	COUNT(DISTINCT City) AS Cantidad
FROM
	Orders
GROUP BY
	City
;

SELECT
	*,
	COUNT(order_amount) OVER(PARTITION BY City, MONTH(order_date)) AS cantidad
FROM
	Orders
;


SELECT
	*,
	RANK() OVER(ORDER BY order_amount DESC) AS [rank],
	DENSE_RANK() OVER(PARTITION BY city ORDER BY order_amount DESC) AS [dense_rank],
	ROW_NUMBER() OVER(PARTITION BY city ORDER BY order_amount DESC) AS [row_number],
	NTILE(11) OVER(ORDER BY city DESC) AS [ntile]
FROM
	Orders
;

-- 10/2=5