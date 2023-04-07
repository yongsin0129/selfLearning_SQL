--
SELECT AVG(release_year) FROM albums;


--
SELECT SUM(release_year) FROM albums;


--
SELECT band_id , COUNT(band_id) FROM albums
GROUP BY band_id;

--
SELECT b.name AS band_name, COUNT(a.band_id) AS num_albums 
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id;
/*
| band_name         | num_albums |
|-------------------|------------|
| Iron Maiden       | 2          |
| Deuce             | 1          |
| Avenged Sevenfold | 2          |
| Ankor             | 0          |
*/



-- 練習一 : 顯示每個 band 的 albums 
SELECT * , COUNT(band_id) AS albums_numbers FROM bands
LEFT JOIN albums ON albums.band_id = bands.id
GROUP BY bands.id;

/*
| id | name              | id   | name                    | release_year | band_id | numbers_albums |
|----|-------------------|------|-------------------------|--------------|---------|----------------|
| 1  | Iron Maiden       | 1    | The Number of the Beats | 1982         | 1       | 2              |
| 2  | Deuce             | 3    | Nightmare               | 2018         | 2       | 1              |
| 3  | Avenged Sevenfold | 4    | Nightmare               | 2010         | 3       | 2              |
| 4  | Ankor             | NULL | NULL                    | NULL         | NULL    | 0              |
*/