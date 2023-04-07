--
SELECT b.name AS band_name, COUNT(a.band_id) AS num_albums 
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
WHERE num_albums = 1
GROUP BY b.id;
/*
Error Code: 1054. Unknown column 'num_albums' in 'where clause'
原因 : WHERE 會在 GROUP BY 之前執行 , 而 aggregate 會在 GROUP BY 之後才執行
WHERE -> GROUP BY -> aggregate
*/

--
SELECT b.name AS band_name, COUNT(a.band_id) AS num_albums 
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id
HAVING num_albums = 2;
/*
記得 HAVING 語法的位置 要放在 GROUP BY 的後面
| band_name         | num_albums |
|-------------------|------------|
| Iron Maiden       | 2          |
| Avenged Sevenfold | 2          |
*/

--
SELECT b.name AS band_name, COUNT(a.band_id) AS num_albums 
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
WHERE b.name LIKE '%Iron%'
GROUP BY b.id
HAVING num_albums = 2;
/*
記得 WHERE 要放在 GROUP BY 的前面 ,  HAVING 要放在 GROUP BY 的後面 , 
| band_name         | num_albums |
|-------------------|------------|
| Iron Maiden       | 2          |
*/