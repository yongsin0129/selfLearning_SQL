/*
Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.
 

Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

The query result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+
*/

// 解法1 
SELECT MAX(CASE WHEN rank_num=2 THEN salary ELSE NULL END) AS SecondHighestSalary
FROM (
    SELECT salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank_num
    FROM Employee
) temp

or 

SELECT SUM(IF( rank_num = 2 , salary , NULL)) AS SecondHighestSalary
FROM (
    SELECT id, salary,
           ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank_num
    FROM Employee
) temp
WHERE rank_num = 2;

/*
解法 1 都需要對空白值用函數取值，才會在空白時 return NULL

ex : MAX , MIN , AVG , SUM 都行
*/

// 解法2 leetcode 解答
 SELECT
     (SELECT DISTINCT
             Salary
         FROM
             Employee
         ORDER BY Salary DESC
         LIMIT 1 OFFSET 1) AS SecondHighestSalary

/*
解法 2 子查詢如果找到空白會 return NULL
如果没用子查询，会有一样的问题：当没有薪水第二高的人的时候，返回的不是null值。

skill : 子查詢 , NULL

*/

// 解法3 網友
SELECT MAX(Salary) AS SecondHighestSalary FROM Employee
WHERE Salary NOT IN (SELECT MAX(Salary) FROM Employee);

/*
解法 3 用 WHERE + MAX 過濾最高

再使用 MAX 一次就是次高

skill : 子查詢 , NULL

*/
