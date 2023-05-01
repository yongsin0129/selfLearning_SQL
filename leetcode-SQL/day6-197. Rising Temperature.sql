/*
Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the primary key for this table.
This table contains information about the temperature on a certain day.
 

Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).
*/

# Write your MySQL query statement below

// 解法 1 
// 先做出一個 column 可以表示前一日的 temperature
// 再篩選出今日t 大於昨日t 的 row

WITH cte AS(
    SELECT W.id , W.recordDate , W.temperature  , W1.temperature AS previousTemp
    FROM Weather AS W
    LEFT JOIN Weather AS W1 ON (DATEDIFF(W.recordDate ,W1.recordDate) = 1)
)

SELECT id
FROM cte
WHERE temperature - previousTemp > 0


// 網友解法
// 直接用 ON 接出日期大於一天的 table , 且溫度也大於昨日的
SELECT a.id AS Id
FROM Weather AS a JOIN Weather AS b
ON a.temperature>b.temperature and DATEDIFF(a.recordDate,b.recordDate)=1;



