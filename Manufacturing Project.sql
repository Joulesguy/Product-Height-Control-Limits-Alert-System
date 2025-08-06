SELECT operator,
	   ROW_NUMBER() OVER(PARTITION BY operator 
	   	ORDER BY item_no) AS row_number,
	   height,
	   avg_height,
	   stddev_height,
	   avg_height + 3 * stddev_height / SQRT(5) AS ucl,
	   avg_height - 3 * stddev_height / SQRT(5) AS lcl,
	   CASE WHEN height >= (avg_height - 3 * stddev_height / SQRT(5))
	   	AND height <= (avg_height + 3 * stddev_height / SQRT(5)) THEN FALSE
	   	ELSE TRUE END AS alert
FROM 
	(SELECT operator,
    item_no,
    height,
	AVG(height) OVER(PARTITION BY operator 
	   	ORDER BY item_no  
	   	ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS avg_height,
	   STDDEV(height) OVER(PARTITION BY operator 
	    ORDER BY item_no  
	   	ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS stddev_height,
	COUNT(*) OVER (PARTITION BY operator 
      ORDER BY item_no 
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS row_count
	FROM parts) AS sub
WHERE row_count = 5

ORDER BY item_no
