MariaDB [mysql]> CREATE TABLE person (
    ->     id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    ->     name CHAR(60) NOT NULL,
    ->     PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (0.869 sec)

MariaDB [mysql]> CREATE TABLE shirt (
    ->     id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    ->     style ENUM('t-shirt', 'polo', 'dress') NOT NULL,
    ->     color ENUM('red', 'blue', 'orange', 'white', 'black') NOT NULL,
    ->     owner SMALLINT UNSIGNED NOT NULL REFERENCES person(id),
    ->     PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (0.653 sec)

MariaDB [mysql]> INSERT INTO person VALUES (NULL, 'Antonio Paz');
Query OK, 1 row affected (0.051 sec)

MariaDB [mysql]> SELECT @last := LAST_INSERT_ID();
+---------------------------+
| @last := LAST_INSERT_ID() |
+---------------------------+
|                         1 |
+---------------------------+
1 row in set (0.001 sec)

MariaDB [mysql]> INSERT INTO shirt VALUES
    -> (NULL, 'polo', 'blue', @last),
    -> (NULL, 'dress', 'white', @last),
    -> (NULL, 't-shirt', 'blue', @last);
Query OK, 3 rows affected (0.124 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [mysql]> INSERT INTO person VALUES (NULL, 'Lilliana Angelovska');
Query OK, 1 row affected (0.050 sec)

MariaDB [mysql]> SELECT @last := LAST_INSERT_ID();
+---------------------------+
| @last := LAST_INSERT_ID() |
+---------------------------+
|                         2 |
+---------------------------+
1 row in set (0.000 sec)

MariaDB [mysql]> INSERT INTO shirt VALUES
    -> (NULL, 'dress', 'orange', @last),
    -> (NULL, 'polo', 'red', @last),
    -> (NULL, 'dress', 'blue', @last),
    -> (NULL, 't-shirt', 'white', @last);
Query OK, 4 rows affected (0.126 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [mysql]> SELECT * FROM person;
+----+---------------------+
| id | name                |
+----+---------------------+
|  1 | Antonio Paz         |
|  2 | Lilliana Angelovska |
+----+---------------------+
2 rows in set (0.001 sec)

MariaDB [mysql]> SELECT * FROM shirt;
+----+---------+--------+-------+
| id | style   | color  | owner |
+----+---------+--------+-------+
|  1 | polo    | blue   |     1 |
|  2 | dress   | white  |     1 |
|  3 | t-shirt | blue   |     1 |
|  4 | dress   | orange |     2 |
|  5 | polo    | red    |     2 |
|  6 | dress   | blue   |     2 |
|  7 | t-shirt | white  |     2 |
+----+---------+--------+-------+
7 rows in set (0.001 sec)

MariaDB [mysql]> SELECT s.* FROM person p INNER JOIN shirt s
    ->    ON s.owner = p.id
    ->  WHERE p.name LIKE 'Lilliana%'
    ->    AND s.color <> 'white';
+----+-------+--------+-------+
| id | style | color  | owner |
+----+-------+--------+-------+
|  4 | dress | orange |     2 |
|  5 | polo  | red    |     2 |
|  6 | dress | blue   |     2 |
+----+-------+--------+-------+
3 rows in set (0.001 sec)

MariaDB [mysql]> SELECT s.* FROM person p INNER JOIN shirt s    ON s.owner = p.id  WHERE p.name LIKE '%ska'    AND
 s.color <> 'white';
+----+-------+--------+-------+
| id | style | color  | owner |
+----+-------+--------+-------+
|  4 | dress | orange |     2 |
|  5 | polo  | red    |     2 |
|  6 | dress | blue   |     2 |
+----+-------+--------+-------+
3 rows in set (0.001 sec)

MariaDB [mysql]> SHOW CREATE TABLE shirt\G
*************************** 1. row ***************************
       Table: shirt
Create Table: CREATE TABLE `shirt` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `style` enum('t-shirt','polo','dress') NOT NULL,
  `color` enum('red','blue','orange','white','black') NOT NULL,
  `owner` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  CONSTRAINT `shirt_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4
1 row in set (0.001 sec)

MariaDB [mysql]> SHOW CREATE TABLE person\G
*************************** 1. row ***************************
       Table: person
Create Table: CREATE TABLE `person` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4
1 row in set (0.001 sec)

