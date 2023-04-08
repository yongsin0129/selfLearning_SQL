--SOP 1.資料表做關連 2.規畫用誰做 GROUP 3.最後選擇需要顯示那些col (SELECT)

01 .飲料店每位顧客的平均銷售額是多少？

```
SELECT c.`name`, AVG(o.`quantity` * d.`price`) AS `average_sales`
FROM `customers` AS c
JOIN `orders` AS o ON c.`id` = o.`customer_id`
JOIN `drinks` AS d ON o.`drink_id` = d.`id`
GROUP BY `name`;
```

02. 誰是購買額最高的 Top 3 顧客？

```
SELECT c.`name`,SUM(o.`quantity` * d.`price`) AS `revenue`
FROM `orders` as o
JOIN `customers` as c ON c.`id` = o.`customer_id`
JOIN `drinks` as d ON d.`id` = o.`drink_id`
GROUP BY `customer_id` ORDER BY `revenue` DESC
LIMIT 3;
```

03.這個月生日的顧客有誰？

```
SELECT `name` FROM `customers`
WHERE MONTH(`birthday`) = MONTH(CURDATE());
```

04. 我們目前銷售量最高的飲料是哪一種？

```
SELECT d.`name`, SUM(`quantity`) AS `total`
FROM `orders` AS o
INNER JOIN `drinks` AS d ON o.`drink_id` = d.`id`
GROUP BY d.`name` ORDER BY `total` DESC
```

05. 我們目前最熱門（購買顧客最多）的飲料是哪一種？

```
SELECT drinks.name, COUNT(`customer_id`) as buyers
FROM orders
JOIN drinks ON drinks.id = orders.drink_id
GROUP BY drink_id
ORDER BY buyers DESC
LIMIT 1;
```

06. 哪三種飲料為我們帶來最多營業額？

```
SELECT d.`name`, SUM(o.`quantity` * d.`price`) AS `total`
FROM `orders` AS o
INNER JOIN `drinks` AS d ON o.`drink_id` = d.`id`
GROUP BY o.`drink_id` ORDER BY `total` DESC LIMIT 3;
```

07. 哪三種飲料為我們帶來最多淨收入？

```
SELECT d.`name`, SUM(o.`quantity` * (d.`price` - d.`cost`)) AS `total`
FROM `orders` AS o
INNER JOIN `drinks` AS d ON o.`drink_id` = d.`id`
GROUP BY o.`drink_id`
ORDER BY `total` DESC
LIMIT 3;
```

08.哪種飲料至今沒人買過？

```
SELECT d.`name`, COUNT(o.`id`) AS `order_count`
FROM `drinks` AS d
LEFT JOIN `orders` AS o ON o.`drink_id` = d.`id`
GROUP BY d.`name`
HAVING `order_count` = 0
```

09. 一天中，哪個小時的客人最多？

```
SELECT HOUR(`time`), COUNT(HOUR(`time`))
FROM orders
GROUP BY HOUR(`time`)
ORDER BY COUNT(HOUR(`time`)) DESC
LIMIT 1
```

10. 誰是為我們帶來最多淨收入的十位顧客？

```
SELECT c.`name`, SUM(o.`quantity` * (d.`price` - d.`cost`)) AS `profit`
FROM `customers` AS c
LEFT JOIN `orders` AS o ON c.`id` = o.`customer_id`
LEFT JOIN `drinks` AS d ON d.`id` = o.`drink_id`
GROUP BY c.`name`
ORDER BY `profit` DESC
LIMIT 10;
```