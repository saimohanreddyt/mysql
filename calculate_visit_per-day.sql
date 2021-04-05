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


