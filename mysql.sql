linuxuser@kali:~$ sudo mysql -u saimohan -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 48
Server version: 10.5.8-MariaDB-3 Debian buildd-unstable

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> SELECT VERSION(), CURRENT_DATE;
+------------------+--------------+
| VERSION()        | CURRENT_DATE |
+------------------+--------------+
| 10.5.8-MariaDB-3 | 2021-04-05   |
+------------------+--------------+
1 row in set (0.001 sec)

MariaDB [(none)]> SELECT SIN(PI()/4), (4+1)*5;
+--------------------+---------+
| SIN(PI()/4)        | (4+1)*5 |
+--------------------+---------+
| 0.7071067811865475 |      25 |
+--------------------+---------+
1 row in set (0.001 sec)

MariaDB [(none)]> SELECT VERSION(); SELECT NOW();
+------------------+
| VERSION()        |
+------------------+
| 10.5.8-MariaDB-3 |
+------------------+
1 row in set (0.001 sec)

+---------------------+
| NOW()               |
+---------------------+
| 2021-04-05 10:28:01 |
+---------------------+
1 row in set (0.000 sec)

MariaDB [(none)]> SELECT USER(), CURRENT_DATE;
+--------------------+--------------+
| USER()             | CURRENT_DATE |
+--------------------+--------------+
| saimohan@localhost | 2021-04-05   |
+--------------------+--------------+
1 row in set (0.001 sec)

MariaDB [(none)]> SELECT USER()\c
MariaDB [(none)]> SELECT USER()
 -> ;
+--------------------+
| USER()             |
+--------------------+
| saimohan@localhost |
+--------------------+
1 row in set (0.000 sec)

MariaDB [(none)]> SHOW DATABASES:
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ':' at line 1
MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| saimohan           |
+--------------------+
2 rows in set (0.001 sec)

MariaDB [(none)]> create database mysql;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> use mysql
Database changed
MariaDB [mysql]> use mysql;
Database changed
MariaDB [mysql]> SHOW TABLES;
Empty set (0.001 sec)

MariaDB [mysql]> CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),
    ->        species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);
Query OK, 0 rows affected (0.312 sec)

MariaDB [mysql]> describe pet;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(20) | YES  |     | NULL    |       |
| owner   | varchar(20) | YES  |     | NULL    |       |
| species | varchar(20) | YES  |     | NULL    |       |
| sex     | char(1)     | YES  |     | NULL    |       |
| birth   | date        | YES  |     | NULL    |       |
| death   | date        | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
6 rows in set (0.001 sec)

MariaDB [mysql]> select * from pet;
Empty set (0.000 sec)

MariaDB [mysql]> show tables;
+-----------------+
| Tables_in_mysql |
+-----------------+
| pet             |
+-----------------+
1 row in set (0.001 sec)

MariaDB [mysql]> INSERT INTO pet
    ->        VALUES ('Puffball','Diane','hamster','f','1999-03-30',NULL);
Query OK, 1 row affected (0.121 sec)

MariaDB [mysql]> select * from pet;
+----------+-------+---------+------+------------+-------+
| name     | owner | species | sex  | birth      | death |
+----------+-------+---------+------+------------+-------+
| Puffball | Diane | hamster | f    | 1999-03-30 | NULL  |
+----------+-------+---------+------+------------+-------+
1 row in set (0.001 sec)


inuxuser@kali:~$ sudo mysql -u saimohan -p
[sudo] password for linuxuser: 
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 49
Server version: 10.5.8-MariaDB-3 Debian buildd-unstable

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use saimohan;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [saimohan]> show tables;
+--------------------+
| Tables_in_saimohan |
+--------------------+
| Employee           |
| product            |
| user               |
+--------------------+
3 rows in set (0.001 sec)

MariaDB [saimohan]> select * from user;
+----+-------+------+------------+--------+---------+
| id | fname | city | phone      | height | married |
+----+-------+------+------------+--------+---------+
|  1 | Steve | LA   | 1234567890 |      6 | True    |
+----+-------+------+------------+--------+---------+
1 row in set (0.001 sec)

MariaDB [saimohan]> use mysql;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [mysql]> show tables;
+-----------------+
| Tables_in_mysql |
+-----------------+
| pet             |
+-----------------+
1 row in set (0.001 sec)

MariaDB [mysql]> select * from pet;
+----------+-------+---------+------+------------+-------+
| name     | owner | species | sex  | birth      | death |
+----------+-------+---------+------+------------+-------+
| Puffball | Diane | hamster | f    | 1999-03-30 | NULL  |
+----------+-------+---------+------+------------+-------+
1 row in set (0.001 sec)

MariaDB [mysql]> INSERT INTO pet        VALUES ('labrodor','ias','hamster','fm','2021-01-10',NULL);
ERROR 1406 (22001): Data too long for column 'sex' at row 1
MariaDB [mysql]> INSERT INTO pet        VALUES ('labrodor','ias','hamster','f','2021-01-10',NULL);
Query OK, 1 row affected (0.134 sec)

MariaDB [mysql]> select * from pet;
+----------+-------+---------+------+------------+-------+
| name     | owner | species | sex  | birth      | death |
+----------+-------+---------+------+------------+-------+
| Puffball | Diane | hamster | f    | 1999-03-30 | NULL  |
| labrodor | ias   | hamster | f    | 2021-01-10 | NULL  |
+----------+-------+---------+------+------------+-------+
2 rows in set (0.001 sec)



MariaDB [mysql]> SELECT what_to_select
    -> FROM which_table
    -> WHERE conditions_to_satisfy;
ERROR 1146 (42S02): Table 'mysql.which_table' doesn't exist



MariaDB [mysql]> select owner from pet where name = 'labrodor';
+-------+
| owner |
+-------+
| ias   |
+-------+
1 row in set (0.001 sec)

MariaDB [mysql]> 

MariaDB [mysql]> select owner,birth from pet where name = 'labrodor';
+-------+------------+
| owner | birth      |
+-------+------------+
| ias   | 2021-01-10 |
+-------+------------+
1 row in set (0.000 sec)

MariaDB [mysql]> 



DELETE ;
=======
MariaDB [mysql]> delete from pet;
Query OK, 2 rows affected (0.130 sec)

MariaDB [mysql]> select * from pet;
Empty set (0.000 sec)

MariaDB [mysql]> INSERT INTO pet        VALUES ('labrodor','ias','hamster','f','2021-01-10',NULL);
Query OK, 1 row affected (0.119 sec)

MariaDB [mysql]> INSERT INTO pet        VALUES ('Puffball','Diane','hamster','f','1999-03-30',NULL);
Query OK, 1 row affected (0.116 sec)

MariaDB [mysql]> select * from pet;
+----------+-------+---------+------+------------+-------+
| name     | owner | species | sex  | birth      | death |
+----------+-------+---------+------+------------+-------+
| labrodor | ias   | hamster | f    | 2021-01-10 | NULL  |
| Puffball | Diane | hamster | f    | 1999-03-30 | NULL  |
+----------+-------+---------+------+------------+-------+
2 rows in set (0.001 sec)

UPDATE;
======

ariaDB [mysql]> select * from pet;
+----------+-------+---------+------+------------+-------+
| name     | owner | species | sex  | birth      | death |
+----------+-------+---------+------+------------+-------+
| labrodor | ias   | hamster | f    | 2021-01-10 | NULL  |
| Puffball | Diane | hamster | f    | 1999-03-30 | NULL  |
+----------+-------+---------+------+------------+-------+
2 rows in set (0.001 sec)

MariaDB [mysql]> UPDATE pet SET birth = '2012-01-11' WHERE name = 'Puffball';
Query OK, 1 row affected (0.127 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [mysql]> select * from pet;
+----------+-------+---------+------+------------+-------+
| name     | owner | species | sex  | birth      | death |
+----------+-------+---------+------+------------+-------+
| labrodor | ias   | hamster | f    | 2021-01-10 | NULL  |
| Puffball | Diane | hamster | f    | 2012-01-11 | NULL  |
+----------+-------+---------+------+------------+-------+
2 rows in set (0.001 sec)


Database changed
MariaDB [mysql]> SELECT * FROM pet WHERE name = 'labroder';
Empty set (0.001 sec)

MariaDB [mysql]> SELECT * FROM pet WHERE name = 'labrodor';
+----------+-------+---------+------+------------+-------+
| name     | owner | species | sex  | birth      | death |
+----------+-------+---------+------+------------+-------+
| labrodor | ias   | hamster | f    | 2021-01-10 | NULL  |
+----------+-------+---------+------+------------+-------+
1 row in set (0.001 sec)

MariaDB [mysql]> SELECT * FROM pet WHERE birth >= '1998-1-1';
+----------+-------+---------+------+------------+-------+
| name     | owner | species | sex  | birth      | death |
+----------+-------+---------+------+------------+-------+
| labrodor | ias   | hamster | f    | 2021-01-10 | NULL  |
| Puffball | Diane | hamster | f    | 2012-01-11 | NULL  |
+----------+-------+---------+------+------------+-------+
2 rows in set (0.001 sec)

MariaDB [mysql]> SELECT * FROM pet WHERE species = 'dog' AND sex = 'f'
    -> ;
Empty set (0.001 sec)

MariaDB [mysql]> SELECT * FROM pet WHERE species = 'hamster' AND sex = 'f'
    -> ;
+----------+-------+---------+------+------------+-------+
| name     | owner | species | sex  | birth      | death |
+----------+-------+---------+------+------------+-------+
| labrodor | ias   | hamster | f    | 2021-01-10 | NULL  |
| Puffball | Diane | hamster | f    | 2012-01-11 | NULL  |
+----------+-------+---------+------+------------+-------+
2 rows in set (0.001 sec)



MariaDB [mysql]> SELECT name, birth FROM pet;
+----------+------------+
| name     | birth      |
+----------+------------+
| labrodor | 2021-01-10 |
| Puffball | 2012-01-11 |
+----------+------------+
2 rows in set (0.000 sec)

MariaDB [mysql]> SELECT owner FROM pet;
+-------+
| owner |
+-------+
| ias   |
| Diane |
+-------+
2 rows in set (0.001 sec)

MariaDB [mysql]> SELECT DISTINCT owner FROM pet;
+-------+
| owner |
+-------+
| ias   |
| Diane |
+-------+
2 rows in set (0.001 sec)

MariaDB [mysql]> INSERT INTO pet        VALUES ('fluffy','Harold','cat','m','2021-01-11',NULL);
Query OK, 1 row affected (0.120 sec)

MariaDB [mysql]> INSERT INTO pet        VALUES ();
Query OK, 1 row affected (0.030 sec)

MariaDB [mysql]> INSERT INTO pet        VALUES ('Claws','Gwen','cat','m','1994-03-17',NULL );
Query OK, 1 row affected (0.128 sec)

MariaDB [mysql]> INSERT INTO pet        VALUES ('Buffy','Harold','dog','f','1989-05-13',NULL );
Query OK, 1 row affected (0.128 sec)

MariaDB [mysql]> INSERT INTO pet        VALUES ('Fang','Benny','dog','m','1990-08-27',NULL);
Query OK, 1 row affected (0.127 sec)
MariaDB [mysql]> INSERT INTO pet        VALUES ('Bowser','Diane','dog','m','1979-08-31','1995-07-29');
Query OK, 1 row affected (0.122 sec)

MariaDB [mysql]> INSERT INTO pet        VALUES ('Chirpy','Gwen','bird','f','1998-09-11',NULL );
Query OK, 1 row affected (0.122 sec)


MariaDB [mysql]> select * from pet;
+----------+--------+---------+------+------------+------------+
| name     | owner  | species | sex  | birth      | death      |
+----------+--------+---------+------+------------+------------+
| labrodor | ias    | hamster | f    | 2021-01-10 | NULL       |
| Puffball | Diane  | hamster | f    | 2012-01-11 | NULL       |
| fluffy   | Harold | cat     | m    | 2021-01-11 | NULL       |
| NULL     | NULL   | NULL    | NULL | NULL       | NULL       |
| Claws    | Gwen   | cat     | m    | 1994-03-17 | NULL       |
| Buffy    | Harold | dog     | f    | 1989-05-13 | NULL       |
| Fang     | Benny  | dog     | m    | 1990-08-27 | NULL       |
| Bowser   | Diane  | dog     | m    | 1979-08-31 | 1995-07-29 |
| Chirpy   | Gwen   | bird    | f    | 1998-09-11 | NULL       |
| Slim     | Benny  | snake   | m    | 1996-04-29 | NULL       |
+----------+--------+---------+------+------------+------------+
10 rows in set (0.001 sec)


MariaDB [mysql]> SELECT name, birth FROM pet;
+----------+------------+
| name     | birth      |
+----------+------------+
| labrodor | 2021-01-10 |
| Puffball | 2012-01-11 |
| fluffy   | 2021-01-11 |
| NULL     | NULL       |
| Claws    | 1994-03-17 |
| Buffy    | 1989-05-13 |
| Fang     | 1990-08-27 |
| Bowser   | 1979-08-31 |
| Chirpy   | 1998-09-11 |
| Slim     | 1996-04-29 |
+----------+------------+
10 rows in set (0.000 sec)

MariaDB [mysql]> SELECT name, species, birth FROM pet
    ->        WHERE species = 'dog' OR species = 'cat';
+--------+---------+------------+
| name   | species | birth      |
+--------+---------+------------+
| fluffy | cat     | 2021-01-11 |
| Claws  | cat     | 1994-03-17 |
| Buffy  | dog     | 1989-05-13 |
| Fang   | dog     | 1990-08-27 |
| Bowser | dog     | 1979-08-31 |
+--------+---------+------------+
5 rows in set (0.000 sec)

MariaDB [mysql]> 


SORTING ROWS:
============
MariaDB [mysql]> SELECT name, birth FROM pet ORDER BY birth;
+----------+------------+
| name     | birth      |
+----------+------------+
| NULL     | NULL       |
| Bowser   | 1979-08-31 |
| Buffy    | 1989-05-13 |
| Fang     | 1990-08-27 |
| Claws    | 1994-03-17 |
| Slim     | 1996-04-29 |
| Chirpy   | 1998-09-11 |
| Puffball | 2012-01-11 |
| labrodor | 2021-01-10 |
| fluffy   | 2021-01-11 |
+----------+------------+
10 rows in set (0.001 sec)

MariaDB [mysql]> SELECT name, birth FROM pet ORDER BY birth DESC;
+----------+------------+
| name     | birth      |
+----------+------------+
| fluffy   | 2021-01-11 |
| labrodor | 2021-01-10 |
| Puffball | 2012-01-11 |
| Chirpy   | 1998-09-11 |
| Slim     | 1996-04-29 |
| Claws    | 1994-03-17 |
| Fang     | 1990-08-27 |
| Buffy    | 1989-05-13 |
| Bowser   | 1979-08-31 |
| NULL     | NULL       |
+----------+------------+
10 rows in set (0.001 sec)

MariaDB [mysql]> SELECT name, species, birth FROM pet
    ->        ORDER BY species, birth DESC;
+----------+---------+------------+
| name     | species | birth      |
+----------+---------+------------+
| NULL     | NULL    | NULL       |
| Chirpy   | bird    | 1998-09-11 |
| fluffy   | cat     | 2021-01-11 |
| Claws    | cat     | 1994-03-17 |
| Fang     | dog     | 1990-08-27 |
| Buffy    | dog     | 1989-05-13 |
| Bowser   | dog     | 1979-08-31 |
| labrodor | hamster | 2021-01-10 |
| Puffball | hamster | 2012-01-11 |
| Slim     | snake   | 1996-04-29 |
+----------+---------+------------+
10 rows in set (0.001 sec)




DATE CALCULATION:
================
MariaDB [mysql]> SELECT name, birth, CURDATE(),
    ->        TIMESTAMPDIFF(YEAR,birth,CURDATE()) AS age
    ->        FROM pet;
+----------+------------+------------+------+
| name     | birth      | CURDATE()  | age  |
+----------+------------+------------+------+
| labrodor | 2021-01-10 | 2021-04-05 |    0 |
| Puffball | 2012-01-11 | 2021-04-05 |    9 |
| fluffy   | 2021-01-11 | 2021-04-05 |    0 |
| NULL     | NULL       | 2021-04-05 | NULL |
| Claws    | 1994-03-17 | 2021-04-05 |   27 |
| Buffy    | 1989-05-13 | 2021-04-05 |   31 |
| Fang     | 1990-08-27 | 2021-04-05 |   30 |
| Bowser   | 1979-08-31 | 2021-04-05 |   41 |
| Chirpy   | 1998-09-11 | 2021-04-05 |   22 |
| Slim     | 1996-04-29 | 2021-04-05 |   24 |
+----------+------------+------------+------+
10 rows in set (0.000 sec)


MariaDB [mysql]> SELECT name, birth, CURDATE(),
    ->        TIMESTAMPDIFF(YEAR,birth,CURDATE()) AS age
    ->        FROM pet ORDER BY name;
+----------+------------+------------+------+
| name     | birth      | CURDATE()  | age  |
+----------+------------+------------+------+
| NULL     | NULL       | 2021-04-05 | NULL |
| Bowser   | 1979-08-31 | 2021-04-05 |   41 |
| Buffy    | 1989-05-13 | 2021-04-05 |   31 |
| Chirpy   | 1998-09-11 | 2021-04-05 |   22 |
| Claws    | 1994-03-17 | 2021-04-05 |   27 |
| Fang     | 1990-08-27 | 2021-04-05 |   30 |
| fluffy   | 2021-01-11 | 2021-04-05 |    0 |
| labrodor | 2021-01-10 | 2021-04-05 |    0 |
| Puffball | 2012-01-11 | 2021-04-05 |    9 |
| Slim     | 1996-04-29 | 2021-04-05 |   24 |
+----------+------------+------------+------+
10 rows in set (0.001 sec)

MariaDB [mysql]> SELECT name, birth, CURDATE(), TIMESTAMPDIFF(YEAR, birth,CURDATE()) AS age FROM pet ORDER BY name;
+----------+------------+------------+------+
| name     | birth      | CURDATE()  | age  |
+----------+------------+------------+------+
| NULL     | NULL       | 2021-04-05 | NULL |
| Bowser   | 1979-08-31 | 2021-04-05 |   41 |
| Buffy    | 1989-05-13 | 2021-04-05 |   31 |
| Chirpy   | 1998-09-11 | 2021-04-05 |   22 |
| Claws    | 1994-03-17 | 2021-04-05 |   27 |
| Fang     | 1990-08-27 | 2021-04-05 |   30 |
| fluffy   | 2021-01-11 | 2021-04-05 |    0 |
| labrodor | 2021-01-10 | 2021-04-05 |    0 |
| Puffball | 2012-01-11 | 2021-04-05 |    9 |
| Slim     | 1996-04-29 | 2021-04-05 |   24 |
+----------+------------+------------+------+
10 rows in set (0.001 sec)

MariaDB [mysql]> SELECT name, birth, CURDATE(), TIMESTAMPDIFF(YEAR, birth,CURDATE()) AS age FROM pet ORDER BY name DESC;
+----------+------------+------------+------+
| name     | birth      | CURDATE()  | age  |
+----------+------------+------------+------+
| Slim     | 1996-04-29 | 2021-04-05 |   24 |
| Puffball | 2012-01-11 | 2021-04-05 |    9 |
| labrodor | 2021-01-10 | 2021-04-05 |    0 |
| fluffy   | 2021-01-11 | 2021-04-05 |    0 |
| Fang     | 1990-08-27 | 2021-04-05 |   30 |
| Claws    | 1994-03-17 | 2021-04-05 |   27 |
| Chirpy   | 1998-09-11 | 2021-04-05 |   22 |
| Buffy    | 1989-05-13 | 2021-04-05 |   31 |
| Bowser   | 1979-08-31 | 2021-04-05 |   41 |
| NULL     | NULL       | 2021-04-05 | NULL |
+----------+------------+------------+------+
10 rows in set (0.001 sec)


MariaDB [mysql]>  SELECT name, birth, CURDATE(),
    ->        TIMESTAMPDIFF(YEAR,birth,CURDATE()) AS age
    ->        FROM pet ORDER BY age;
+----------+------------+------------+------+
| name     | birth      | CURDATE()  | age  |
+----------+------------+------------+------+
| NULL     | NULL       | 2021-04-05 | NULL |
| labrodor | 2021-01-10 | 2021-04-05 |    0 |
| fluffy   | 2021-01-11 | 2021-04-05 |    0 |
| Puffball | 2012-01-11 | 2021-04-05 |    9 |
| Chirpy   | 1998-09-11 | 2021-04-05 |   22 |
| Slim     | 1996-04-29 | 2021-04-05 |   24 |
| Claws    | 1994-03-17 | 2021-04-05 |   27 |
| Fang     | 1990-08-27 | 2021-04-05 |   30 |
| Buffy    | 1989-05-13 | 2021-04-05 |   31 |
| Bowser   | 1979-08-31 | 2021-04-05 |   41 |
+----------+------------+------------+------+
10 rows in set (0.001 sec)

MariaDB [mysql]> SELECT name, birth, death,
    ->        TIMESTAMPDIFF(YEAR,birth,death) AS age
    ->        FROM pet WHERE death IS NOT NULL ORDER BY age;
+--------+------------+------------+------+
| name   | birth      | death      | age  |
+--------+------------+------------+------+
| Bowser | 1979-08-31 | 1995-07-29 |   15 |
+--------+------------+------------+------+
1 row in set (0.001 sec)


MariaDB [mysql]> SELECT name, birth, MONTH(birth) FROM pet;
+----------+------------+--------------+
| name     | birth      | MONTH(birth) |
+----------+------------+--------------+
| labrodor | 2021-01-10 |            1 |
| Puffball | 2012-01-11 |            1 |
| fluffy   | 2021-01-11 |            1 |
| NULL     | NULL       |         NULL |
| Claws    | 1994-03-17 |            3 |
| Buffy    | 1989-05-13 |            5 |
| Fang     | 1990-08-27 |            8 |
| Bowser   | 1979-08-31 |            8 |
| Chirpy   | 1998-09-11 |            9 |
| Slim     | 1996-04-29 |            4 |
+----------+------------+--------------+
10 rows in set (0.001 sec)

MariaDB [mysql]> SELECT name, birth FROM pet WHERE MONTH(birth) = 5;
+-------+------------+
| name  | birth      |
+-------+------------+
| Buffy | 1989-05-13 |
+-------+------------+
1 row in set (0.001 sec)



MariaDB [mysql]> SELECT name, birth FROM pet
    ->        WHERE MONTH(birth) = MONTH(DATE_ADD(CURDATE(),INTERVAL 1 MONTH));
+-------+------------+
| name  | birth      |
+-------+------------+
| Buffy | 1989-05-13 |
+-------+------------+
1 row in set (0.001 sec)

MariaDB [mysql]> SELECT name, birth FROM pet
    ->        WHERE MONTH(birth) = MOD(MONTH(CURDATE()), 12) + 1;
+-------+------------+
| name  | birth      |
+-------+------------+
| Buffy | 1989-05-13 |
+-------+------------+
1 row in set (0.001 sec)

MariaDB [mysql]> SELECT '2018-10-31' + INTERVAL 1 DAY;
+-------------------------------+
| '2018-10-31' + INTERVAL 1 DAY |
+-------------------------------+
| 2018-11-01                    |
+-------------------------------+
1 row in set (0.000 sec)

MariaDB [mysql]> SELECT '2018-10-32' + INTERVAL 1 DAY;
+-------------------------------+
| '2018-10-32' + INTERVAL 1 DAY |
+-------------------------------+
| NULL                          |
+-------------------------------+
1 row in set, 1 warning (0.000 sec)

MariaDB [mysql]> SHOW WARNINGS;
+---------+------+----------------------------------------+
| Level   | Code | Message                                |
+---------+------+----------------------------------------+
| Warning | 1292 | Incorrect datetime value: '2018-10-32' |
+---------+------+----------------------------------------+
1 row in set (0.000 sec)



WORKING ON NULL VALUES:
======================
MariaDB [mysql]> SELECT 1 IS NULL, 1 IS NOT NULL;
+-----------+---------------+
| 1 IS NULL | 1 IS NOT NULL |
+-----------+---------------+
|         0 |             1 |
+-----------+---------------+
1 row in set (0.001 sec)

MariaDB [mysql]> SELECT 1 = NULL, 1 <> NULL, 1 < NULL, 1 > NULL;
+----------+-----------+----------+----------+
| 1 = NULL | 1 <> NULL | 1 < NULL | 1 > NULL |
+----------+-----------+----------+----------+
|     NULL |      NULL |     NULL |     NULL |
+----------+-----------+----------+----------+
1 row in set (0.001 sec)

MariaDB [mysql]> SELECT 0 IS NULL, 0 IS NOT NULL, '' IS NULL, '' IS NOT NULL;
+-----------+---------------+------------+----------------+
| 0 IS NULL | 0 IS NOT NULL | '' IS NULL | '' IS NOT NULL |
+-----------+---------------+------------+----------------+
|         0 |             1 |          0 |              1 |
+-----------+---------------+------------+----------------+
1 row in set (0.000 sec)

MariaDB [mysql]> 





PATTERN MATCHING:
================
MariaDB [mysql]> SELECT * FROM pet WHERE name LIKE 'b%';
+--------+--------+---------+------+------------+------------+
| name   | owner  | species | sex  | birth      | death      |
+--------+--------+---------+------+------------+------------+
| Buffy  | Harold | dog     | f    | 1989-05-13 | NULL       |
| Bowser | Diane  | dog     | m    | 1979-08-31 | 1995-07-29 |
+--------+--------+---------+------+------------+------------+
2 rows in set (0.001 sec)

MariaDB [mysql]> SELECT * FROM pet WHERE name LIKE '%fy';
+--------+--------+---------+------+------------+-------+
| name   | owner  | species | sex  | birth      | death |
+--------+--------+---------+------+------------+-------+
| fluffy | Harold | cat     | m    | 2021-01-11 | NULL  |
| Buffy  | Harold | dog     | f    | 1989-05-13 | NULL  |
+--------+--------+---------+------+------------+-------+
2 rows in set (0.001 sec)

MariaDB [mysql]> SELECT * FROM pet WHERE name LIKE '%w%';
+--------+-------+---------+------+------------+------------+
| name   | owner | species | sex  | birth      | death      |
+--------+-------+---------+------+------------+------------+
| Claws  | Gwen  | cat     | m    | 1994-03-17 | NULL       |
| Bowser | Diane | dog     | m    | 1979-08-31 | 1995-07-29 |
+--------+-------+---------+------+------------+------------+
2 rows in set (0.000 sec)

MariaDB [mysql]> SELECT * FROM pet WHERE name LIKE '_____';
+-------+--------+---------+------+------------+-------+
| name  | owner  | species | sex  | birth      | death |
+-------+--------+---------+------+------------+-------+
| Claws | Gwen   | cat     | m    | 1994-03-17 | NULL  |
| Buffy | Harold | dog     | f    | 1989-05-13 | NULL  |
+-------+--------+---------+------+------------+-------+
2 rows in set (0.000 sec)



COUNTING ROWS:
=============

MariaDB [mysql]>  SELECT COUNT(*) FROM pet;
+----------+
| COUNT(*) |
+----------+
|       10 |
+----------+
1 row in set (0.000 sec)

MariaDB [mysql]> SELECT owner, COUNT(*) FROM pet GROUP BY owner;
+--------+----------+
| owner  | COUNT(*) |
+--------+----------+
| NULL   |        1 |
| Benny  |        2 |
| Diane  |        2 |
| Gwen   |        2 |
| Harold |        2 |
| ias    |        1 |
+--------+----------+
6 rows in set (0.000 sec)

MariaDB [mysql]> SELECT species, COUNT(*) FROM pet GROUP BY species;
+---------+----------+
| species | COUNT(*) |
+---------+----------+
| NULL    |        1 |
| bird    |        1 |
| cat     |        2 |
| dog     |        3 |
| hamster |        2 |
| snake   |        1 |
+---------+----------+
6 rows in set (0.001 sec)

MariaDB [mysql]> SELECT sex, COUNT(*) FROM pet GROUP BY sex;
+------+----------+
| sex  | COUNT(*) |
+------+----------+
| NULL |        1 |
| f    |        4 |
| m    |        5 |
+------+----------+
3 rows in set (0.001 sec)
MariaDB [mysql]> SELECT species, sex, COUNT(*) FROM pet GROUP BY species, sex;
+---------+------+----------+
| species | sex  | COUNT(*) |
+---------+------+----------+
| NULL    | NULL |        1 |
| bird    | f    |        1 |
| cat     | m    |        2 |
| dog     | f    |        1 |
| dog     | m    |        2 |
| hamster | f    |        2 |
| snake   | m    |        1 |
+---------+------+----------+
7 rows in set (0.001 sec)

MariaDB [mysql]>  SELECT species, sex, COUNT(*) FROM pet
    ->        WHERE species = 'dog' OR species = 'cat'
    ->        GROUP BY species, sex;
+---------+------+----------+
| species | sex  | COUNT(*) |
+---------+------+----------+
| cat     | m    |        2 |
| dog     | f    |        1 |
| dog     | m    |        2 |
+---------+------+----------+
3 rows in set (0.001 sec)

MariaDB [mysql]> SELECT species, sex, COUNT(*) FROM pet
    ->        WHERE sex IS NOT NULL
    ->        GROUP BY species, sex;
+---------+------+----------+
| species | sex  | COUNT(*) |
+---------+------+----------+
| bird    | f    |        1 |
| cat     | m    |        2 |
| dog     | f    |        1 |
| dog     | m    |        2 |
| hamster | f    |        2 |
| snake   | m    |        1 |
+---------+------+----------+
6 rows in set (0.001 sec)

MariaDB [mysql]> SET sql_mode = '';
Query OK, 0 rows affected (0.000 sec)

MariaDB [mysql]> SELECT owner, COUNT(*) FROM pet;
+-------+----------+
| owner | COUNT(*) |
+-------+----------+
| ias   |       10 |
+-------+----------+
1 row in set (0.001 sec)


