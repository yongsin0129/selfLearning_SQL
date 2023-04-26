/*
Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
 

Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. Note that you are supposed to write a DELETE statement and not a SELECT one.

After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.

The query result format is in the following example.

 

Example 1:

Input: 
Person table:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Output: 
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Explanation: john@example.com is repeated two times. We keep the row with the smallest Id = 1.
*/
# Please write a DELETE statement and DO NOT write a SELECT statement.
# Write your MySQL query statement below
DELETE p1
FROM Person p1, Person p2
WHERE p1.email = p2.email AND p1.id > p2.id;

-- 第二種
WITH cte AS (
    SELECT 
        id, 
        email, 
        ROW_NUMBER() OVER (
            PARTITION BY email
            ORDER BY id
        ) row_num
    FROM 
        Person
)
DELETE FROM Person
WHERE id IN (
    SELECT id
    FROM cte
    WHERE row_num > 1
);

/*
skill:

1. 同一個表 FROM 兩次
2. cte - common table expression 通用資料表運算式 (暫存具名結果集)
   ROW_NUMBER() OVER - 排序函數
分組排序 PARTITION BY
參考資料 : SQL Server 實用的排序函數 ROW_NUMBER() https://ithelp.ithome.com.tw/articles/10225653


*/




/*
首先，使用以下 SQL 語句找出重複的電子郵件：

WITH cte AS (
    SELECT 
        id, 
        email, 
        ROW_NUMBER() OVER (
            PARTITION BY email
            ORDER BY id
        ) row_num
    FROM 
        Person
)
SELECT 
    id, 
    email
FROM 
    cte
WHERE 
    row_num > 1;

這個 SQL 語句會為每個重複的電子郵件建立一個新的行，並使用 ROW_NUMBER() 函數來為每個行編號，以便我們可以保留每個重複組的第一個行。這個查詢會返回所有重複的電子郵件以及它們的 id。

接下來，我們可以將上面的 SQL 查詢巢狀到 DELETE 語句中，以便刪除所有重複的行，但保留每個重複組的第一個行：

WITH cte AS (
    SELECT 
        id, 
        email, 
        ROW_NUMBER() OVER (
            PARTITION BY email
            ORDER BY id
        ) row_num
    FROM 
        Person
)
DELETE FROM Person
WHERE id IN (
    SELECT id
    FROM cte
    WHERE row_num > 1
);

這個 SQL 語句會從 Person 表格中刪除所有重複行，但保留每個重複組的第一行。

這是一個比較通用且靈活的方法，可以處理更複雜的刪除重複資料的需求。
*/
/*
-- 參考資料 : https://www.sqlservertutorial.net/sql-server-basics/delete-duplicates-sql-server/
WITH cte AS (
    SELECT 
        contact_id, 
        first_name, 
        last_name, 
        email, 
        ROW_NUMBER() OVER (
            PARTITION BY 
                first_name, 
                last_name, 
                email
            ORDER BY 
                first_name, 
                last_name, 
                email
        ) row_num
     FROM 
        contacts
)
SELECT * FROM CTE;

| contact_id | first_name | last_name   | email                        | row_num |
|------------|------------|-------------|------------------------------|---------|
| 2          | Catherine  | Abel        | catherine.abel@example.com   | 1       |
| 6          | Hazem      | Abolrous    | hazem.abolrous@example.com   | 1       |
| 7          | Hazem      | Abolrous    | hazem.abolrous@example.com   | 2       |
| 8          | Humberto   | Acevedo     | humberto.acevedo@example.com | 1       |
| 9          | Humberto   | Acevedo     | humberto.acevedo@example.com | 2       |
| 3          | Kim        | Abercrombie | kim.abercrombie@example.com  | 1       |
| 4          | Kim        | Abercrombie | kim.abercrombie@example.com  | 2       |
| 5          | Kim        | Abercrombie | kim.abercrombie@example.com  | 3       |
| 10         | Pilar      | Ackerman    | pilar.ackerman@example.com   | 1       |
| 1          | Syed       | Abbas       | syed.abbas@example.com       | 1       |

*/