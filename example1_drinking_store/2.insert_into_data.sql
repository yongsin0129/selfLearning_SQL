INSERT INTO drinks (drink_name,price,cost)
VALUE ('阿華田', 65 , 20 ),
      ('百香紅茶', 45 , 10 ),
      ('四季春茶', 25 , 5 ),
      ('愛玉冰茶', 50 , 7 ),
      ('冰咖啡', 70 , 30 );

INSERT INTO customers (customer_name,phone,birthdate)
VALUE ('Johny', 0980123123 , '1997-04-22' ),
	    ('Wendy', 0919456456 , '1999-07-07' );

INSERT INTO orders (drinks_id,customers_id,quantity,create_at)
VALUE (1, 2 , 4 ,'2019-07-14 13:55:56'),
      (2, 2 , 3 ,'2019-07-14 14:21:23'),
      (3, 2 , 9 ,'2019-07-14 14:26:12'),
      (3, 1 , 2 ,'2019-07-14 18:51:50');