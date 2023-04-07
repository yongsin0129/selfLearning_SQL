--
SELECT * FROM bands
JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands
INNER JOIN albums ON bands.id = albums.band_id;

/*
| id | name              | id | name                    | release_year | band_id |
|----|-------------------|----|-------------------------|--------------|---------|
| 1  | Iron Maiden       | 1  | The Number of the Beats | 1982         | 1       |
| 1  | Iron Maiden       | 2  | Power Slave             | 1984         | 1       |
| 2  | Deuce             | 3  | Nightmare               | 2018         | 2       |
| 3  | Avenged Sevenfold | 4  | Nightmare               | 2010         | 3       |
| 3  | Avenged Sevenfold | 5  | Test Album              | NULL         | 3       |
*/

SELECT * FROM bands
LEFT JOIN albums ON bands.id = albums.band_id;
/*
| id | name              | id   | name                    | release_year | band_id |
|----|-------------------|------|-------------------------|--------------|---------|
| 1  | Iron Maiden       | 1    | The Number of the Beats | 1982         | 1       |
| 1  | Iron Maiden       | 2    | Power Slave             | 1984         | 1       |
| 2  | Deuce             | 3    | Nightmare               | 2018         | 2       |
| 3  | Avenged Sevenfold | 4    | Nightmare               | 2010         | 3       |
| 3  | Avenged Sevenfold | 6    | Test Album              | NULL         | 3       |
| 4  | Ankor             | NULL | NULL                    | NULL         | NULL    |  <-- 不一樣
*/

SELECT * FROM albums
RIGHT JOIN bands ON bands.id = albums.band_id;
/*
| id   | name                    | release_year | band_id | id | name              |
|------|-------------------------|--------------|---------|----|-------------------|
| 1    | The Number of the Beats | 1982         | 1       | 1  | Iron Maiden       |
| 2    | Power Slave             | 1984         | 1       | 1  | Iron Maiden       |
| 3    | Nightmare               | 2018         | 2       | 2  | Deuce             |
| 4    | Nightmare               | 2010         | 3       | 3  | Avenged Sevenfold |
| 6    | Test Album              | NULL         | 3       | 3  | Avenged Sevenfold |
| NULL | NULL                    | NULL         | NULL    | 4  | Ankor             |  <-- 不一樣
*/