
MariaDB [(none)]> use mysql
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [mysql]> CREATE TABLE t1 (year YEAR, month INT UNSIGNED,
    ->              day INT UNSIGNED);
Query OK, 0 rows affected (0.383 sec)

MariaDB [mysql]> INSERT INTO t1 VALUES(2000,1,1),(2000,1,20),(2000,1,30),(2000,2,2),
    ->             (2000,2,23),(2000,2,23);
Query OK, 6 rows affected (0.120 sec)
Records: 6  Duplicates: 0  Warnings: 0

MariaDB [mysql]> select * from t1;
+------+-------+------+
| year | month | day  |
+------+-------+------+
| 2000 |     1 |    1 |
| 2000 |     1 |   20 |
| 2000 |     1 |   30 |
| 2000 |     2 |    2 |
| 2000 |     2 |   23 |
| 2000 |     2 |   23 |
+------+-------+------+
6 rows in set (0.001 sec)

MariaDB [mysql]> SELECT year,month,BIT_COUNT(BIT_OR(1<<day)) AS days FROM t1
    ->        GROUP BY year,month;
+------+-------+------+
| year | month | days |
+------+-------+------+
| 2000 |     1 |    3 |
| 2000 |     2 |    2 |
+------+-------+------+
2 rows in set (0.001 sec)

MariaDB [mysql]> 
MariaDB [mysql]> 
MariaDB [mysql]> 
MariaDB [mysql]> 
MariaDB [mysql]> 
MariaDB [mysql]> CREATE TABLE animals (
    ->      id MEDIUMINT NOT NULL AUTO_INCREMENT,
    ->      name CHAR(30) NOT NULL,
    ->      PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (0.719 sec)

MariaDB [mysql]> INSERT INTO animals (name) VALUES
    ->     ('dog'),('cat'),('penguin'),
    ->     ('lax'),('whale'),('ostrich');
Query OK, 6 rows affected (0.026 sec)
Records: 6  Duplicates: 0  Warnings: 0

MariaDB [mysql]> SELECT * FROM animals;
+----+---------+
| id | name    |
+----+---------+
|  1 | dog     |
|  2 | cat     |
|  3 | penguin |
|  4 | lax     |
|  5 | whale   |
|  6 | ostrich |
+----+---------+
6 rows in set (0.001 sec)

MariaDB [mysql]> INSERT INTO animals (id,name) VALUES(0,'groundhog');
Query OK, 1 row affected (0.066 sec)

MariaDB [mysql]> INSERT INTO animals (id,name) VALUES(NULL,'squirrel');
Query OK, 1 row affected (0.127 sec)

MariaDB [mysql]> INSERT INTO animals (id,name) VALUES(100,'rabbit');
Query OK, 1 row affected (0.063 sec)

MariaDB [mysql]> INSERT INTO animals (id,name) VALUES(NULL,'mouse');
Query OK, 1 row affected (0.105 sec)

MariaDB [mysql]> SELECT * FROM animals;
+-----+-----------+
| id  | name      |
+-----+-----------+
|   1 | dog       |
|   2 | cat       |
|   3 | penguin   |
|   4 | lax       |
|   5 | whale     |
|   6 | ostrich   |
|   7 | groundhog |
|   8 | squirrel  |
| 100 | rabbit    |
| 101 | mouse     |
+-----+-----------+
10 rows in set (0.001 sec)

MariaDB [mysql]> ALTER TABLE tbl AUTO_INCREMENT = 100;
ERROR 1146 (42S02): Table 'mysql.tbl' doesn't exist
MariaDB [mysql]> ALTER TABLE t1 AUTO_INCREMENT = 100;
Query OK, 0 rows affected (0.886 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [mysql]> SELECT * FROM animals;
+-----+-----------+
| id  | name      |
+-----+-----------+
|   1 | dog       |
|   2 | cat       |
|   3 | penguin   |
|   4 | lax       |
|   5 | whale     |
|   6 | ostrich   |
|   7 | groundhog |
|   8 | squirrel  |
| 100 | rabbit    |
| 101 | mouse     |
+-----+-----------+
10 rows in set (0.001 sec)


