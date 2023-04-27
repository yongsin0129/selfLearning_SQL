/*
Table: Employees

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| name        | varchar |
+-------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates the name of the employee whose ID is employee_id.
 

Table: Salaries

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| salary      | int     |
+-------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates the salary of the employee whose ID is employee_id.
 

Write an SQL query to report the IDs of all the employees with missing information. The information of an employee is missing if:

The employee's name is missing, or
The employee's salary is missing.
Return the result table ordered by employee_id in ascending order.

The query result format is in the following example.

 

Example 1:

Input: 
Employees table:
+-------------+----------+
| employee_id | name     |
+-------------+----------+
| 2           | Crew     |
| 4           | Haven    |
| 5           | Kristian |
+-------------+----------+
Salaries table:
+-------------+--------+
| employee_id | salary |
+-------------+--------+
| 5           | 76071  |
| 1           | 22517  |
| 4           | 63539  |
+-------------+--------+
Output: 
+-------------+
| employee_id |
+-------------+
| 1           |
| 2           |
+-------------+
Explanation: 
Employees 1, 2, 4, and 5 are working at this company.
The name of employee 1 is missing.
The salary of employee 2 is missing.
*/

# Write your MySQL query statement below
SELECT employee_id
FROM Employees AS E
LEFT JOIN (
     SELECT employee_id AS e_id , salary
     FROM Salaries
) AS S ON S.e_id = E.employee_id
WHERE name IS NULL OR salary is NULL
UNION
SELECT employee_id
FROM Salaries AS S
LEFT JOIN (
     SELECT employee_id AS e_id , name
     FROM Employees
) AS E ON E.e_id = S.employee_id
WHERE name IS NULL OR salary is NULL
ORDER BY employee_id ASC

/*

note : MySQL 沒有 FULL OUTER JOIN 需要用 UNION
ex : 
SELECT * FROM t1
LEFT JOIN t2 ON t1.id = t2.id
UNION
SELECT * FROM t1
RIGHT JOIN t2 ON t1.id = t2.id

skill: UNION 結合 LEFT JOIN , RIGHT JOIN , 另外需注意兩個 table 都有 employee_id field

*/

/*

網路解法
SELECT employee_id
FROM Employees
WHERE employee_id  NOT IN (SELECT employee_id FROM Salaries)
UNION
SELECT employee_id
FROM Salaries
WHERE employee_id  NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id ASC

skill : WHERE NOT IN 的用法 結合 UNION

*/