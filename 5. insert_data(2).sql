INSERT INTO albums (name,release_year,band_id)
VALUE ('The Number of the Beats',1985,1),
	  ('Power Slave',1984,1	),
      ('Nightmare',2018,2),
      ('Nightmare',2010,3),
      ('Test Album',Null,3);

--
SELECT * FROM albums;


--
SELECT DISTINCT name FROM albums;


--
UPDATE albums
SET release_year = 1982
WHERE id = 1;

--
SELECT * FROM albums
WHERE release_year <  2000;

--
SELECT * FROM albums
WHERE name like '%er%'; -- % 表示 any ( 空白也是 any )

--
SELECT * FROM albums
WHERE name like '%er%' OR band_id=2;

SELECT * FROM albums
WHERE release_year = 1984 AND band_id = 1;

SELECT * FROM albums
WHERE release_year BETWEEN 2000 AND 2018;

SELECT * FROM albums
WHERE release_year IS NULL; -- 有多種判斷可用 (IS FALSE , IS TRUE , IS NOT NULL)

-- delete
DELETE from albums
WHERE release_year IS NULL; 

DELETE from albums
WHERE name LIKE 'test album';
/*
Error Code: 1175. 
You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  
To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
以上兩種方式都不行，因為不是指定 KEY column
*/
DELETE from albums
WHERE id = 5; -- id 為這個 table 的 KEY column , 這樣才能在 safe mode 中刪除資料，確保不會有資料被誤刪
