

MariaDB [mysql]> CREATE TABLE event (name VARCHAR(20), date DATE,
    ->        type VARCHAR(15), remark VARCHAR(255));
Query OK, 0 rows affected (0.193 sec)

MariaDB [mysql]> INSERT INTO event VALUES('fluffy', '1995-05-15','litter','4 kittens, 3females, l male');
Query OK, 1 row affected (0.124 sec)

MariaDB [mysql]> INSERT INTO event VALUES('Buffy','1993-06-23','litter','5 puppies, 2 female, 3 male');
Query OK, 1 row affected (0.151 sec)

MariaDB [mysql]> INSERT INTO event VALUES();
Query OK, 1 row affected (0.123 sec)

MariaDB [mysql]> INSERT INTO event VALUES('Buffy','1994-06-19','litter','3 puppies, 3 female');
Query OK, 1 row affected (0.043 sec)

MariaDB [mysql]> INSERT INTO event VALUES('Chirpy','1999-03-21','vet','needed beak straightened');
Query OK, 1 row affected (0.121 sec)

MariaDB [mysql]> INSERT INTO event VALUES('Slim','1997-08-03','vet','broken rib');
Query OK, 1 row affected (0.113 sec)

MariaDB [mysql]> INSERT INTO event VALUES('Bowser','1991-10-12','kennel',);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')' at line 1
MariaDB [mysql]> INSERT INTO event VALUES('Bowser','1991-10-12','kennel',NOT NULL);
Query OK, 1 row affected (0.129 sec)

MariaDB [mysql]> INSERT INTO event VALUES('Fang','1991-10-12','kennel',NOT NULL);
Query OK, 1 row affected (0.033 sec)

MariaDB [mysql]> INSERT INTO event VALUES('Fang','1998-08-28','birthday','Gave him a new chew toy');
Query OK, 1 row affected (0.104 sec)

MariaDB [mysql]> INSERT INTO event VALUES('Claws','1998-03-17','birthday','Gave him a new flea collar');
Query OK, 1 row affected (0.102 sec)

MariaDB [mysql]> INSERT INTO event VALUES('Whistler','1998-12-09','birthday','First birthday');
Query OK, 1 row affected (0.105 sec)

MariaDB [mysql]> select * from event;
+----------+------------+----------+-----------------------------+
| name     | date       | type     | remark                      |
+----------+------------+----------+-----------------------------+
| fluffy   | 1995-05-15 | litter   | 4 kittens, 3females, l male |
| Buffy    | 1993-06-23 | litter   | 5 puppies, 2 female, 3 male |
| NULL     | NULL       | NULL     | NULL                        |
| Buffy    | 1994-06-19 | litter   | 3 puppies, 3 female         |
| Chirpy   | 1999-03-21 | vet      | needed beak straightened    |
| Slim     | 1997-08-03 | vet      | broken rib                  |
| Bowser   | 1991-10-12 | kennel   | NULL                        |
| Fang     | 1991-10-12 | kennel   | NULL                        |
| Fang     | 1998-08-28 | birthday | Gave him a new chew toy     |
| Claws    | 1998-03-17 | birthday | Gave him a new flea collar  |
| Whistler | 1998-12-09 | birthday | First birthday              |
+----------+------------+----------+-----------------------------+
11 rows in set (0.001 sec)

MariaDB [mysql]> select * from event;
+----------+------------+----------+-----------------------------+
| name     | date       | type     | remark                      |
+----------+------------+----------+-----------------------------+
| fluffy   | 1995-05-15 | litter   | 4 kittens, 3females, l male |
| Buffy    | 1993-06-23 | litter   | 5 puppies, 2 female, 3 male |
| NULL     | NULL       | NULL     | NULL                        |
| Buffy    | 1994-06-19 | litter   | 3 puppies, 3 female         |
| Chirpy   | 1999-03-21 | vet      | needed beak straightened    |
| Slim     | 1997-08-03 | vet      | broken rib                  |
| Bowser   | 1991-10-12 | kennel   | NULL                        |
| Fang     | 1991-10-12 | kennel   | NULL                        |
| Fang     | 1998-08-28 | birthday | Gave him a new chew toy     |
| Claws    | 1998-03-17 | birthday | Gave him a new flea collar  |
| Whistler | 1998-12-09 | birthday | First birthday              |
+----------+------------+----------+-----------------------------+
11 rows in set (0.001 sec)

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



MariaDB [mysql]> SELECT pet.name, remark
    -> FROM pet INNER JOIN event
    -> ON pet.name = event.name
    -> WHERE event.type = 'litter';
+--------+-----------------------------+
| name   | remark                      |
+--------+-----------------------------+
| fluffy | 4 kittens, 3females, l male |
| Buffy  | 5 puppies, 2 female, 3 male |
| Buffy  | 3 puppies, 3 female         |
+--------+-----------------------------+
3 rows in set (0.001 sec)

MariaDB [mysql]> SELECT pet.name,
    ->        TIMESTAMPDIFF(YEAR,birth,date) AS age,
    ->        remark
    ->        FROM pet INNER JOIN event
    ->          ON pet.name = event.name
    ->        WHERE event.type = 'litter';
+--------+------+-----------------------------+
| name   | age  | remark                      |
+--------+------+-----------------------------+
| fluffy |  -25 | 4 kittens, 3females, l male |
| Buffy  |    4 | 5 puppies, 2 female, 3 male |
| Buffy  |    5 | 3 puppies, 3 female         |
+--------+------+-----------------------------+
3 rows in set (0.003 sec)



MariaDB [mysql]> SELECT p1.name, p1.sex, p2.name, p2.sex, p1.species
    ->        FROM pet AS p1 INNER JOIN pet AS p2
    ->          ON p1.species = p2.species
    ->          AND p1.sex = 'f' AND p1.death IS NULL
    ->          AND p2.sex = 'm' AND p2.death IS NULL;
+-------+------+------+------+---------+
| name  | sex  | name | sex  | species |
+-------+------+------+------+---------+
| Buffy | f    | Fang | m    | dog     |
+-------+------+------+------+---------+


