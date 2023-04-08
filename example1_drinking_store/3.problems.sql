/*
drinks
|id |drink_name|price|cost|
|---|----------|-----|----|
|1  |阿華田    |65   |20  |
|2  |百香紅茶  |45   |10  |
|3  |四季春茶  |25   |5   |
|4  |愛玉冰茶  |50   |7   |
|5  |冰咖啡    |70   |30  |

customers
|id |customer_name|   phone   |    birthdate  |
|---|-------------|-----------|--------------|
|1  |Johny        |0980123123 |1997/4/22 00:00|
|2  |Wendy        |0919456456 |1999/7/7 00:00|

orders
|id |drinks_id|customers_id|quantity|create_at      |
|---|---------|------------|--------|---------------|
|1  |1        |2           |4       |2019/7/14 13:55|
|2  |2        |2           |3       |2019/7/14 14:21|
|3  |3        |2           |9       |2019/7/14 14:26|
|4  |3        |1           |2       |2019/7/14 18:51|

01 .飲料店每位顧客的總共來店幾次，銷售額平均是多少？

02. 誰是購買額最高的 Top 3 顧客？

03. 這個月生日的顧客有誰？

04. 我們目前「銷售量」最高的飲料是哪一種？

05. 我們目前最熱門 「購買顧客最多」 的飲料是哪一種？

06. 哪三種飲料為我們帶來最多營業額？

07. 哪三種飲料為我們帶來最多淨收入？

08.哪種飲料至今沒人買過？

09. 一天中，哪個小時的客人最多？

10. 誰是為我們帶來最多淨收入的十位顧客？
*/

--1 飲料店每位顧客的總共來店幾次，銷售額平均是多少？
SELECT c.customer_name , 
COUNT(o.id) AS times_purchase ,
AVG(d.price*o.quantity) AS average_cost
FROM customers AS c
LEFT JOIN orders AS o ON o.customers_id = c.id
LEFT JOIN drinks AS d ON d.id = o.drinks_id
GROUP BY c.id;

/*
|customer_name|times_purchase|average_cost|
|-------------|--------------|-----------|
|Wendy        |3             |206.6667   |
|Johny        |1             |50         |
*/

--2 誰是購買額最高的 Top 3 顧客？
SELECT c.customer_name , SUM(o.quantity*d.price) AS total_cost
FROM customers AS c
LEFT JOIN orders AS o ON o.customers_id = c.id
LEFT JOIN drinks AS d ON d.id = o.drinks_id
GROUP BY c.id
ORDER BY total_cost DESC
LIMIT 3;
/*
|customer_name|total_cost    |
|-------------|--------------|
|Wendy        |620           |
|Johny        |50            |
*/

--3 這個月 or (4月) 生日的顧客有誰？
SELECT c.customer_name
FROM customers AS c
WHERE MONTH(c.birthdate) = MONTH('0000/4/00');

SELECT c.customer_name
FROM customers AS c
WHERE MONTH(c.birthdate) = MONTH(CURDATE());

SELECT c.customer_name
FROM customers AS c
WHERE YEAR(c.birthdate) = YEAR('1997/0/00'); -- 1997 出生的

--4 我們目前銷售量最高的飲料是哪一種？
SELECT * , d.drink_name ,SUM(o.quantity) AS total_sales
FROM drinks AS d
LEFT JOIN orders AS o ON d.id = o.drinks_id
GROUP BY d.drink_name
ORDER BY o.quantity DESC

--5 我們目前最熱門 「購買顧客最多」 的飲料是哪一種？ (類似4,練習aggregate)
SELECT * , d.drink_name ,COUNT(o.id) AS total_sales
FROM drinks AS d
LEFT JOIN orders AS o ON d.id = o.drinks_id
GROUP BY d.drink_name
ORDER BY o.quantity DESC
LIMIT 1;

--6 哪三種飲料為我們帶來最多營業額？ (類似4,練習aggregate)
SELECT * , d.drink_name ,SUM(o.quantity * d.price) AS total_sales
FROM drinks AS d
LEFT JOIN orders AS o ON d.id = o.drinks_id
GROUP BY d.drink_name
ORDER BY o.quantity DESC
LIMIT 3;

--7 哪三種飲料為我們帶來最多淨收入？ (類似4,練習aggregate)
SELECT * , d.drink_name ,SUM(o.quantity * (d.price-d.cost)) AS total_profits
FROM drinks AS d
LEFT JOIN orders AS o ON d.id = o.drinks_id
GROUP BY d.drink_name
ORDER BY o.quantity DESC
LIMIT 3;

--8 哪種飲料至今沒人買過？
SELECT * , d.drink_name , SUM(o.quantity) AS total_profits
FROM drinks AS d
LEFT JOIN orders AS o ON d.id = o.drinks_id
GROUP BY d.drink_name
HAVING total_profits IS NULL
------ 第二種解法
SELECT * , d.drink_name , COUNT(o.id) AS total_profits
FROM drinks AS d
LEFT JOIN orders AS o ON d.id = o.drinks_id
GROUP BY d.drink_name
HAVING total_profits = 0

--9 一天中，哪個小時的客人最多？
SELECT * , HOUR(o.create_at) AS hours , COUNT(o.id) AS numbers_order
FROM orders AS o
GROUP BY hours
ORDER BY numbers_order DESC;

--10 誰是為我們帶來最多淨收入的十位顧客？
SELECT * , c.customer_name, SUM(o.quantity*(d.price-d.cost)) AS total_profits
FROM customers AS c
LEFT JOIN orders AS o ON o.customers_id = c.id
JOIN drinks AS d ON o.drinks_id = d.id
GROUP BY c.id
ORDER BY total_profits DESC
LIMIT 10;