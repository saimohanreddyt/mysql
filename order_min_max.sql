MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| saimohan           |
+--------------------+
3 rows in set (0.001 sec)

MariaDB [(none)]> use mysql;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [mysql]> CREATE TABLE shop (
    ->     article INT UNSIGNED  DEFAULT '0000' NOT NULL,
    ->     dealer  CHAR(20)      DEFAULT ''     NOT NULL,
    ->     price   DECIMAL(16,2) DEFAULT '0.00' NOT NULL,
    ->     PRIMARY KEY(article, dealer));
Query OK, 0 rows affected (0.461 sec)

MariaDB [mysql]> INSERT INTO shop VALUES
    ->     (1,'A',3.45),(1,'B',3.99),(2,'A',10.99),(3,'B',1.45),
    ->     (3,'C',1.69),(3,'D',1.25),(4,'D',19.95);
Query OK, 7 rows affected (0.036 sec)
Records: 7  Duplicates: 0  Warnings: 0

MariaDB [mysql]> select * from shop;
+---------+--------+-------+
| article | dealer | price |
+---------+--------+-------+
|       1 | A      |  3.45 |
|       1 | B      |  3.99 |
|       2 | A      | 10.99 |
|       3 | B      |  1.45 |
|       3 | C      |  1.69 |
|       3 | D      |  1.25 |
|       4 | D      | 19.95 |
+---------+--------+-------+
7 rows in set (0.001 sec)

MariaDB [mysql]> SELECT * FROM shop ORDER BY article;
+---------+--------+-------+
| article | dealer | price |
+---------+--------+-------+
|       1 | A      |  3.45 |
|       1 | B      |  3.99 |
|       2 | A      | 10.99 |
|       3 | B      |  1.45 |
|       3 | C      |  1.69 |
|       3 | D      |  1.25 |
|       4 | D      | 19.95 |
+---------+--------+-------+
7 rows in set (0.001 sec)

MariaDB [mysql]> SELECT * FROM shop ORDER BY article DESC;
+---------+--------+-------+
| article | dealer | price |
+---------+--------+-------+
|       4 | D      | 19.95 |
|       3 | D      |  1.25 |
|       3 | C      |  1.69 |
|       3 | B      |  1.45 |
|       2 | A      | 10.99 |
|       1 | B      |  3.99 |
|       1 | A      |  3.45 |
+---------+--------+-------+
7 rows in set (0.001 sec)

MariaDB [mysql]> SELECT MAX(article) AS article FROM shop;
+---------+
| article |
+---------+
|       4 |
+---------+
1 row in set (0.001 sec)

MariaDB [mysql]> SELECT article, dealer, price
    -> FROM   shop
    -> WHERE  price=(SELECT MAX(price) FROM shop);
+---------+--------+-------+
| article | dealer | price |
+---------+--------+-------+
|       4 | D      | 19.95 |
+---------+--------+-------+
1 row in set (0.086 sec)

MariaDB [mysql]> SELECT s1.article, s1.dealer, s1.price
    -> FROM shop s1
    -> LEFT JOIN shop s2 ON s1.price < s2.price
    -> WHERE s2.article IS NULL;
+---------+--------+-------+
| article | dealer | price |
+---------+--------+-------+
|       4 | D      | 19.95 |
+---------+--------+-------+
1 row in set (0.001 sec)

MariaDB [mysql]> SELECT article, dealer, price
    -> FROM shop
    -> ORDER BY price DESC
    -> LIMIT 1;
+---------+--------+-------+
| article | dealer | price |
+---------+--------+-------+
|       4 | D      | 19.95 |
+---------+--------+-------+
1 row in set (0.001 sec)

MariaDB [mysql]> SELECT article, MAX(price) AS price
    -> FROM   shop
    -> GROUP BY article
    -> ORDER BY article;
+---------+-------+
| article | price |
+---------+-------+
|       1 |  3.99 |
|       2 | 10.99 |
|       3 |  1.69 |
|       4 | 19.95 |
+---------+-------+
4 rows in set (0.001 sec)

MariaDB [mysql]> The Rows Holding the Group-wise Maximum of a Certain Column;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'The Rows Holding the Group-wise Maximum of a Certain Column' at line 1
MariaDB [mysql]> The Rows Holding the Group-wise Maximum of a Certain Column;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'The Rows Holding the Group-wise Maximum of a Certain Column' at line 1
MariaDB [mysql]> The Rows Holding the Group-wise Maximum of a Certain Column
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'The Rows Holding the Group-wise Maximum of a Certain Column' at line 1
MariaDB [mysql]> SELECT article, dealer, price
    -> FROM   shop s1
    -> WHERE  price=(SELECT MAX(s2.price)
    ->               FROM shop s2
    ->               WHERE s1.article = s2.article)
    -> ORDER BY article;
+---------+--------+-------+
| article | dealer | price |
+---------+--------+-------+
|       1 | B      |  3.99 |
|       2 | A      | 10.99 |
|       3 | C      |  1.69 |
|       4 | D      | 19.95 |
+---------+--------+-------+
4 rows in set (0.002 sec)

MariaDB [mysql]> SELECT s1.article, dealer, s1.price
    -> FROM shop s1
    -> JOIN (
    ->   SELECT article, MAX(price) AS price
    ->   FROM shop
    ->   GROUP BY article) AS s2
    ->   ON s1.article = s2.article AND s1.price = s2.price
    -> ORDER BY article;
+---------+--------+-------+
| article | dealer | price |
+---------+--------+-------+
|       1 | B      |  3.99 |
|       2 | A      | 10.99 |
|       3 | C      |  1.69 |
|       4 | D      | 19.95 |
+---------+--------+-------+
4 rows in set (0.002 sec)

MariaDB [mysql]> SELECT s1.article, s1.dealer, s1.price
    -> FROM shop s1
    -> LEFT JOIN shop s2 ON s1.article = s2.article AND s1.price < s2.price
    -> WHERE s2.article IS NULL
    -> ORDER BY s1.article;
+---------+--------+-------+
| article | dealer | price |
+---------+--------+-------+
|       1 | B      |  3.99 |
|       2 | A      | 10.99 |
|       3 | C      |  1.69 |
|       4 | D      | 19.95 |
+---------+--------+-------+
4 rows in set (0.001 sec)

MariaDB [mysql]> WITH s1 AS (
    ->    SELECT article, dealer, price,
    ->           RANK() OVER (PARTITION BY article
    ->                            ORDER BY price DESC
    ->                       ) AS `Rank`
    ->      FROM shop
    -> )
    -> SELECT article, dealer, price
    ->   FROM s1
    ->   WHERE `Rank` = 1
    -> ORDER BY article;
+---------+--------+-------+
| article | dealer | price |
+---------+--------+-------+
|       1 | B      |  3.99 |
|       2 | A      | 10.99 |
|       3 | C      |  1.69 |
|       4 | D      | 19.95 |
+---------+--------+-------+
4 rows in set (0.002 sec)

