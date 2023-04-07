-- KEY WORD 請通一使用大寫，做區分

CREATE DATABASE record_company;

USE record_company;
/*
使用 USE 時，SQL 會將當前的工作階段設置為選擇的數據庫，並且在接下來的所有 SQL 查詢中都會將該數據庫作為默認的操作對象。
*/

DROP DATABASE record_company;

CREATE TABLE test (
	test_column INT -- type 記得通一用大寫做區分
);

ALTER TABLE test
ADD another_column 
VARCHAR(255); 
-- VARCHAR 為可變長度的字串數據類型，與 CHAR 或 CHARACTER 不同的是，VARCHAR 在存儲數據時只會佔用實際需要的存儲空間，因此可以節省存儲空間。

DROP TABLE test;