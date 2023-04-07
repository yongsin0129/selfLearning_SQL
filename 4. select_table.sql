SELECT * FROM bands; -- * 為全部的 column

SELECT * FROM bands LIMIT 2;

SELECT name FROM bands LIMIT 2; -- 指定 column ， 不要一次全拿

SELECT id AS 'ID',name AS 'BAND_NAME' 
FROM bands; -- 使用 AS 給別名

SELECT * FROM bands ORDER BY name ASC;