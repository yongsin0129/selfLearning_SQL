CREATE TABLE bands (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT, -- UNSIGNED 非負數，則可讓正數範圍多一倍
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE albums (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  release_year INT,
  band_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (band_id) REFERENCES bands(id) -- 指定關聯
);

SHOW TABLES; -- 顯示當前資料庫所有的 tables