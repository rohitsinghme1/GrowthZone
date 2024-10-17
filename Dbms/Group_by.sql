Last login: Sun Oct  6 20:44:48 on console
rohitsingh@Rohits-MacBook-Air ~ % mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 9.0.1 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.


mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| my_db              |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.23 sec)

mysql> use my_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A



mysql> select * from route_header where cat_code = (select cat_code from category_header where cat_desc ='dulex');
Empty set (0.02 sec)

mysql> show tables;
+-----------------+
| Tables_in_my_db |
+-----------------+
| category_header |
| fleet_header    |
| place_header    |
| route_detail    |
| route_header    |
| ticket_detail   |
| ticket_header   |
+-----------------+
7 rows in set (0.01 sec)

mysql> select *
    -> from route_header rh
    -> inner join category_header ch
    -> on rh.cat_code = ch.cat_code
    -> where ch.cat_desc = 'dulex';
Empty set (0.01 sec)

mysql> select * from category_header;
+----------+-------------+
| cat_code | cat_desc    |
+----------+-------------+
|        1 | super delux |
|        2 | delux       |
|        3 | super fast  |
|        4 | normal      |
|        5 | fast        |
+----------+-------------+
5 rows in set (0.00 sec)

mysql> select * from route_header;
+----------+----------+----------+-----------+-------------+-------+----------+----------+
| route_id | route_no | cat_code | origin    | destination | fare  | distance | capacity |
+----------+----------+----------+-----------+-------------+-------+----------+----------+
|      101 |       33 |        1 | Madurai   | Madras      | 35.00 |      205 |       50 |
|      102 |       25 |        2 | Trichy    | Madurai     | 40.00 |      159 |       50 |
|      103 |       15 |        3 | Thanjavur | Madurai     | 59.00 |      140 |       50 |
|      104 |       36 |        4 | Madras    | Banglore    | 79.00 |      375 |       50 |
|      105 |       40 |        1 | Banglore  | Madras      | 80.00 |      375 |       50 |
|      106 |       38 |        2 | Madras    | Madurai     | 39.00 |      250 |       50 |
|      107 |       39 |        3 | Hydrabad  | Madras      | 50.00 |      430 |       50 |
|      108 |       41 |        4 | Madras    | Cochin      | 47.00 |      576 |       50 |
+----------+----------+----------+-----------+-------------+-------+----------+----------+
8 rows in set (0.01 sec)

mysql> select *
    -> from route_header rh
    -> inner join category_header ch
    -> on rh.cat_code = ch.cat_code
    -> where ch.cat_desc = 'delux';
+----------+----------+----------+--------+-------------+-------+----------+----------+----------+----------+
| route_id | route_no | cat_code | origin | destination | fare  | distance | capacity | cat_code | cat_desc |
+----------+----------+----------+--------+-------------+-------+----------+----------+----------+----------+
|      102 |       25 |        2 | Trichy | Madurai     | 40.00 |      159 |       50 |        2 | delux    |
|      106 |       38 |        2 | Madras | Madurai     | 39.00 |      250 |       50 |        2 | delux    |
+----------+----------+----------+--------+-------------+-------+----------+----------+----------+----------+
2 rows in set (0.01 sec)

mysql> select * from ticket_header where ticket_no =(select ticket_no from ticket_detail where name ='charu');
+----------+-----------+------------+------------+-------------+-------------+--------+-------------+-------+----------+------------+----------+
| fleet_id | ticket_no | doi        | dot        | time_travel | board_place | origin | destination | adult | children | total_fare | route_id |
+----------+-----------+------------+------------+-------------+-------------+--------+-------------+-------+----------+------------+----------+
|        1 |         1 | 1996-04-10 | 1996-05-10 | 15:00:00    | Parrys      | Madras | Madurai     |     1 |        1 |      60.00 |      101 |
+----------+-----------+------------+------------+-------------+-------------+--------+-------------+-------+----------+------------+----------+
1 row in set (0.03 sec)

mysql> select *
    -> from ticket_header th
    -> inner join ticket_detail td
    -> on th.ticket_no = td.ticket_no
    -> where td.name = 'charu';
+----------+-----------+------------+------------+-------------+-------------+--------+-------------+-------+----------+------------+----------+-----------+-------+------+------+-------+
| fleet_id | ticket_no | doi        | dot        | time_travel | board_place | origin | destination | adult | children | total_fare | route_id | ticket_no | name  | sex  | age  | fare  |
+----------+-----------+------------+------------+-------------+-------------+--------+-------------+-------+----------+------------+----------+-----------+-------+------+------+-------+
|        1 |         1 | 1996-04-10 | 1996-05-10 | 15:00:00    | Parrys      | Madras | Madurai     |     1 |        1 |      60.00 |      101 |         1 | Charu | F    |   24 | 14.06 |
+----------+-----------+------------+------------+-------------+-------------+--------+-------------+-------+----------+------------+----------+-----------+-------+------+------+-------+
1 row in set (0.00 sec)

mysql> select * from place_header;
+----------+------------+----------------------+-------------+
| place_id | place_name | place_address        | bus_station |
+----------+------------+----------------------+-------------+
|        1 | Madras     | 10, ptc road         | Parrys      |
|        2 | Madurai    | 21, canal bank road  | Kknagar     |
|        3 | Trichy     | 11, first cross road | Bheltown    |
|        4 | Banglore   | 15, first main road  | Cubbon park |
|        5 | Hydrabad   | 115, lake view road  | Charminar   |
|        6 | Thanjavur  | 12, temple road      | Railway jn  |
+----------+------------+----------------------+-------------+
6 rows in set (0.12 sec)


mysql> select *
    -> from route_detail rd
    -> ;
+----------+----------+---------+
| route_id | place_id | nonstop |
+----------+----------+---------+
|      105 |        1 | N       |
|       12 |        2 | S       |
|      106 |        1 | S       |
|      108 |        5 | N       |
|      106 |        2 | N       |
+----------+----------+---------+
5 rows in set (0.01 sec)


mysql> select * from route_detail rd inner join route_header rh on rd.route_id = rh.route_id where nonstop = 'n';
+----------+----------+---------+----------+----------+----------+----------+-------------+-------+----------+----------+
| route_id | place_id | nonstop | route_id | route_no | cat_code | origin   | destination | fare  | distance | capacity |
+----------+----------+---------+----------+----------+----------+----------+-------------+-------+----------+----------+
|      105 |        1 | N       |      105 |       40 |        1 | Banglore | Madras      | 80.00 |      375 |       50 |
|      108 |        5 | N       |      108 |       41 |        4 | Madras   | Cochin      | 47.00 |      576 |       50 |
|      106 |        2 | N       |      106 |       38 |        2 | Madras   | Madurai     | 39.00 |      250 |       50 |
+----------+----------+---------+----------+----------+----------+----------+-------------+-------+----------+----------+
3 rows in set (0.04 sec)

mysql> select * from route_header where route_id = (select route_id from route_detail where nonstop ='N');
ERROR 1242 (21000): Subquery returns more than 1 row
mysql> select * from route_header where route_id in (select route_id from route_detail where nonstop ='N');
+----------+----------+----------+----------+-------------+-------+----------+----------+
| route_id | route_no | cat_code | origin   | destination | fare  | distance | capacity |
+----------+----------+----------+----------+-------------+-------+----------+----------+
|      105 |       40 |        1 | Banglore | Madras      | 80.00 |      375 |       50 |
|      108 |       41 |        4 | Madras   | Cochin      | 47.00 |      576 |       50 |
|      106 |       38 |        2 | Madras   | Madurai     | 39.00 |      250 |       50 |
+----------+----------+----------+----------+-------------+-------+----------+----------+
3 rows in set (0.03 sec)

mysql> select *
    -> from route_header rh
    -> left join route_detail rd
    -> on rh.route_id = rd route_id
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'route_id' at line 4
mysql> select *
    -> from route_header rh
    -> left join route_detail rd
    -> on rh.route_id = rd route_id
    -> left join route_detail rd;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'route_id
left join route_detail rd' at line 4
mysql> select *
    -> from route_header rh
    -> left join route_detail rd
    -> on rh.route_id = rd.route_id;
+----------+----------+----------+-----------+-------------+-------+----------+----------+----------+----------+---------+
| route_id | route_no | cat_code | origin    | destination | fare  | distance | capacity | route_id | place_id | nonstop |
+----------+----------+----------+-----------+-------------+-------+----------+----------+----------+----------+---------+
|      101 |       33 |        1 | Madurai   | Madras      | 35.00 |      205 |       50 |     NULL |     NULL | NULL    |
|      102 |       25 |        2 | Trichy    | Madurai     | 40.00 |      159 |       50 |     NULL |     NULL | NULL    |
|      103 |       15 |        3 | Thanjavur | Madurai     | 59.00 |      140 |       50 |     NULL |     NULL | NULL    |
|      104 |       36 |        4 | Madras    | Banglore    | 79.00 |      375 |       50 |     NULL |     NULL | NULL    |
|      105 |       40 |        1 | Banglore  | Madras      | 80.00 |      375 |       50 |      105 |        1 | N       |
|      106 |       38 |        2 | Madras    | Madurai     | 39.00 |      250 |       50 |      106 |        1 | S       |
|      106 |       38 |        2 | Madras    | Madurai     | 39.00 |      250 |       50 |      106 |        2 | N       |
|      107 |       39 |        3 | Hydrabad  | Madras      | 50.00 |      430 |       50 |     NULL |     NULL | NULL    |
|      108 |       41 |        4 | Madras    | Cochin      | 47.00 |      576 |       50 |      108 |        5 | N       |
+----------+----------+----------+-----------+-------------+-------+----------+----------+----------+----------+---------+
9 rows in set (0.00 sec)

mysql> select rh.*
    -> from route_header rh
    -> left join route_detail rd
    -> on rh.route_id = rd.route_id;
+----------+----------+----------+-----------+-------------+-------+----------+----------+
| route_id | route_no | cat_code | origin    | destination | fare  | distance | capacity |
+----------+----------+----------+-----------+-------------+-------+----------+----------+
|      101 |       33 |        1 | Madurai   | Madras      | 35.00 |      205 |       50 |
|      102 |       25 |        2 | Trichy    | Madurai     | 40.00 |      159 |       50 |
|      103 |       15 |        3 | Thanjavur | Madurai     | 59.00 |      140 |       50 |
|      104 |       36 |        4 | Madras    | Banglore    | 79.00 |      375 |       50 |
|      105 |       40 |        1 | Banglore  | Madras      | 80.00 |      375 |       50 |
|      106 |       38 |        2 | Madras    | Madurai     | 39.00 |      250 |       50 |
|      106 |       38 |        2 | Madras    | Madurai     | 39.00 |      250 |       50 |
|      107 |       39 |        3 | Hydrabad  | Madras      | 50.00 |      430 |       50 |
|      108 |       41 |        4 | Madras    | Cochin      | 47.00 |      576 |       50 |
+----------+----------+----------+-----------+-------------+-------+----------+----------+
9 rows in set (0.04 sec)

mysql> select * form ticket_header;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'form ticket_header' at line 1
mysql> select * from ticket_header;
+----------+-----------+------------+------------+-------------+-------------+-----------+-------------+-------+----------+------------+----------+
| fleet_id | ticket_no | doi        | dot        | time_travel | board_place | origin    | destination | adult | children | total_fare | route_id |
+----------+-----------+------------+------------+-------------+-------------+-----------+-------------+-------+----------+------------+----------+
|        1 |         1 | 1996-04-10 | 1996-05-10 | 15:00:00    | Parrys      | Madras    | Madurai     |     1 |        1 |      60.00 |      101 |
|        2 |         2 | 1996-04-12 | 1996-05-05 | 09:00:00    | Kknagar     | Madurai   | Madras      |     2 |        1 |      60.00 |      102 |
|        3 |         3 | 1996-04-21 | 1996-05-15 | 21:00:00    | Cubbon park | Bangalore | Madras      |     4 |        2 |     400.00 |      101 |
+----------+-----------+------------+------------+-------------+-------------+-----------+-------------+-------+----------+------------+----------+
3 rows in set (0.00 sec)

mysql> select td.name from ticket_detail td inner join ticket_header th on td.ticket_no = th.ticket_no where origin ='madurai' and destination='madras';
+---------+
| name    |
+---------+
| Anand   |
| Guatham |
| Bala    |
+---------+
3 rows in set (0.02 sec)

mysql> select * from route_detail;
+----------+----------+---------+
| route_id | place_id | nonstop |
+----------+----------+---------+
|      105 |        1 | N       |
|       12 |        2 | S       |
|      106 |        1 | S       |
|      108 |        5 | N       |
|      106 |        2 | N       |
+----------+----------+---------+
5 rows in set (0.00 sec)

mysql> select fh.* from fleet_header 
    -> inner join route_detail rd
    -> on fh.route_id = rd.route_id
    -> where rd.nonstop ='n';
ERROR 1051 (42S02): Unknown table 'fh'
mysql> select fh.* from fleet_header fh
    -> inner join route_detail rd
    -> on fh.route_id = rd.route_id
    -> where rd.nonstop ='n';
Empty set (0.02 sec)

mysql> select avg(total_fare) from ticket_header;
+-----------------+
| avg(total_fare) |
+-----------------+
|      173.333333 |
+-----------------+
1 row in set (0.04 sec)

mysql> select sum(fare) from route_header;
+-----------+
| sum(fare) |
+-----------+
|    429.00 |
+-----------+
1 row in set (0.00 sec)

mysql> select sum(total_fare) from ticket_header;
+-----------------+
| sum(total_fare) |
+-----------------+
|          520.00 |
+-----------------+
1 row in set (0.00 sec)

mysql> select min(distrance) from route_header;
ERROR 1054 (42S22): Unknown column 'distrance' in 'field list'
mysql> select min(distance) from route_header;
+---------------+
| min(distance) |
+---------------+
|           140 |
+---------------+
1 row in set (0.01 sec)

mysql> select ticket_no, sum(adult + children)
    -> from ticket_header
    -> group by ticket_no;
+-----------+-----------------------+
| ticket_no | sum(adult + children) |
+-----------+-----------------------+
|         1 |                     2 |
|         2 |                     3 |
|         3 |                     6 |
+-----------+-----------------------+
3 rows in set (0.02 sec)

mysql> select origin,sun(fare) from route_header group by origin;
ERROR 1305 (42000): FUNCTION my_db.sun does not exist
mysql> select origin,sun(fare) from route_header group by origin;
ERROR 1305 (42000): FUNCTION my_db.sun does not exist
mysql> select origin,sun(fare) from ticket_header group by origin;
ERROR 1305 (42000): FUNCTION my_db.sun does not exist
mysql> select origin,sum(fare) from ticket_header group by origin;
ERROR 1054 (42S22): Unknown column 'fare' in 'field list'
mysql> select origin,sum(total_fare) from ticket_header group by origin;
+-----------+-----------------+
| origin    | sum(total_fare) |
+-----------+-----------------+
| Madras    |           60.00 |
| Madurai   |           60.00 |
| Bangalore |          400.00 |
+-----------+-----------------+
3 rows in set (0.01 sec)

mysql> select origin,sum(fare)
    -> from route;
ERROR 1146 (42S02): Table 'my_db.route' doesn't exist
mysql> select origin,sum(total_fare)
    -> from ticket header
    -> group by origin 
    -> having origin = 'madras';
ERROR 1146 (42S02): Table 'my_db.ticket' doesn't exist
mysql> select origin,sum(total_fare)
    -> from ticket_header
    -> group by origin
    -> having origin = 'madras';
+--------+-----------------+
| origin | sum(total_fare) |
+--------+-----------------+
| Madras |           60.00 |
+--------+-----------------+
1 row in set (0.00 sec)

mysql> select ticket_no, avg(total_fare) from ticket_header group by ticket_no;
+-----------+-----------------+
| ticket_no | avg(total_fare) |
+-----------+-----------------+
|         1 |       60.000000 |
|         2 |       60.000000 |
|         3 |      400.000000 |
+-----------+-----------------+
3 rows in set (0.01 sec)

mysql> select * fleet header;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'fleet header' at line 1
mysql> select * from fleet_header;
+----------+------------+----------+----------+
| fleet_id | day        | route_id | cat_code |
+----------+------------+----------+----------+
|        1 | 1996-04-10 |      101 |        1 |
|        2 | 1996-04-10 |      101 |        1 |
|        3 | 1996-04-10 |      101 |        1 |
|        4 | 1996-04-10 |      102 |        2 |
|        5 | 1996-04-10 |      102 |        3 |
|        6 | 1996-04-10 |      103 |        4 |
+----------+------------+----------+----------+
6 rows in set (0.00 sec)

mysql> select* from route_header;
+----------+----------+----------+-----------+-------------+-------+----------+----------+
| route_id | route_no | cat_code | origin    | destination | fare  | distance | capacity |
+----------+----------+----------+-----------+-------------+-------+----------+----------+
|      101 |       33 |        1 | Madurai   | Madras      | 35.00 |      205 |       50 |
|      102 |       25 |        2 | Trichy    | Madurai     | 40.00 |      159 |       50 |
|      103 |       15 |        3 | Thanjavur | Madurai     | 59.00 |      140 |       50 |
|      104 |       36 |        4 | Madras    | Banglore    | 79.00 |      375 |       50 |
|      105 |       40 |        1 | Banglore  | Madras      | 80.00 |      375 |       50 |
|      106 |       38 |        2 | Madras    | Madurai     | 39.00 |      250 |       50 |
|      107 |       39 |        3 | Hydrabad  | Madras      | 50.00 |      430 |       50 |
|      108 |       41 |        4 | Madras    | Cochin      | 47.00 |      576 |       50 |
+----------+----------+----------+-----------+-------------+-------+----------+----------+
8 rows in set (0.00 sec)
mysql> ;
ERROR: select fh.* from fleet_header fh inner join route_header rh on fh.route_id - 
No query specified

mysql> select ticket_no, avg(total_fare) from ticket_header group by ticket_no;
+-----------+-----------------+
| ticket_no | avg(total_fare) |
+-----------+-----------------+
|         1 |       60.000000 |
|         2 |       60.000000 |
|         3 |      400.000000 |
+-----------+-----------------+
3 rows in set (0.00 sec)
mysql> ;
ERROR: select fh.* from fleet_header fh inner join route_header rh on fh.route_id = rh.route_id where routeno 
No query specified

mysql> select fh.* from fleet_header fh inner join route_header rh on fh.route_id = route_id where route_no in (33,25); 
ERROR 1052 (23000): Column 'route_id' in on clause is ambiguous
mysql> select fh.* from fleet_header fh inner join route_header rh on fh.route_id = rd.route_id where route_no in (33,25);
ERROR 1054 (42S22): Unknown column 'rd.route_id' in 'on clause'
mysql> select fh.* from fleet_header fh inner join route_header rh on fh.route_id = rh.route_id where route_no in (33,25);
+----------+------------+----------+----------+
| fleet_id | day        | route_id | cat_code |
+----------+------------+----------+----------+
|        1 | 1996-04-10 |      101 |        1 |
|        2 | 1996-04-10 |      101 |        1 |
|        3 | 1996-04-10 |      101 |        1 |
|        4 | 1996-04-10 |      102 |        2 |
|        5 | 1996-04-10 |      102 |        3 |
+----------+------------+----------+----------+
5 rows in set (0.00 sec)

mysql> select sex, count(*)
    -> from ticket_detail
    -> group by sex;
+------+----------+
| sex  | count(*) |
+------+----------+
| F    |        2 |
| M    |        4 |
+------+----------+
2 rows in set (0.01 sec)

mysql> select fh.* from fleet_header fh inner join route_header rh on fh.route_id = rh.route_id where route_no in (33,25);;
+----------+------------+----------+----------+
| fleet_id | day        | route_id | cat_code |
+----------+------------+----------+----------+
|        1 | 1996-04-10 |      101 |        1 |
|        2 | 1996-04-10 |      101 |        1 |
|        3 | 1996-04-10 |      101 |        1 |
|        4 | 1996-04-10 |      102 |        2 |
|        5 | 1996-04-10 |      102 |        3 |
+----------+------------+----------+----------+
5 rows in set (0.00 sec)

ERROR: 
No query specified

mysql> select sex, count(f) from ticket_detail group by sex;
ERROR 1054 (42S22): Unknown column 'f' in 'field list'
mysql> select sex, count("f") from ticket_detail group by sex;
+------+------------+
| sex  | count("f") |
+------+------------+
| F    |          2 |
| M    |          4 |
+------+------------+
2 rows in set (0.00 sec)

mysql> select sex, count("F") from ticket_detail group by sex;
+------+------------+
| sex  | count("F") |
+------+------------+
| F    |          2 |
| M    |          4 |
+------+------------+
2 rows in set (0.00 sec)

mysql> select sex, count(sex) from ticket_detail group by sex;
+------+------------+
| sex  | count(sex) |
+------+------------+
| F    |          2 |
| M    |          4 |
+------+------------+
2 rows in set (0.00 sec)

mysql> select sex, count(sex) from ticket_detail group by sex having sex = 'F';
+------+------------+
| sex  | count(sex) |
+------+------------+
| F    |          2 |
+------+------------+
1 row in set (0.01 sec)

mysql> select cat_code,count(*)
    -> from route_header 
    -> group by cat_code not in (02);
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'my_db.route_header.cat_code' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select cat_code,count(*) from route_header group by cat_code having cat_code not in (02);
+----------+----------+
| cat_code | count(*) |
+----------+----------+
|        1 |        2 |
|        3 |        2 |
|        4 |        2 |
+----------+----------+
3 rows in set (0.01 sec)

mysql> select * from place_header;
+----------+------------+----------------------+-------------+
| place_id | place_name | place_address        | bus_station |
+----------+------------+----------------------+-------------+
|        1 | Madras     | 10, ptc road         | Parrys      |
|        2 | Madurai    | 21, canal bank road  | Kknagar     |
|        3 | Trichy     | 11, first cross road | Bheltown    |
|        4 | Banglore   | 15, first main road  | Cubbon park |
|        5 | Hydrabad   | 115, lake view road  | Charminar   |
|        6 | Thanjavur  | 12, temple road      | Railway jn  |
+----------+------------+----------------------+-------------+
6 rows in set (0.01 sec)


+------------+
| place_name |
+------------+
| Madras     |
| Hydrabad   |
| Madurai    |
+------------+
3 rows in set (0.01 sec)

mysql> select * from ticket_header where (adutl + childern)>1;
ERROR 1054 (42S22): Unknown column 'adutl' in 'where clause'
mysql> select * from ticket_header where (adult + childern)>1;
ERROR 1054 (42S22): Unknown column 'childern' in 'where clause'
mysql> select * from ticket_header where (adult + children)>1;
+----------+-----------+------------+------------+-------------+-------------+-----------+-------------+-------+----------+------------+----------+
| fleet_id | ticket_no | doi        | dot        | time_travel | board_place | origin    | destination | adult | children | total_fare | route_id |
+----------+-----------+------------+------------+-------------+-------------+-----------+-------------+-------+----------+------------+----------+
|        1 |         1 | 1996-04-10 | 1996-05-10 | 15:00:00    | Parrys      | Madras    | Madurai     |     1 |        1 |      60.00 |      101 |
|        2 |         2 | 1996-04-12 | 1996-05-05 | 09:00:00    | Kknagar     | Madurai   | Madras      |     2 |        1 |      60.00 |      102 |
|        3 |         3 | 1996-04-21 | 1996-05-15 | 21:00:00    | Cubbon park | Bangalore | Madras      |     4 |        2 |     400.00 |      101 |
+----------+-----------+------------+------------+-------------+-------------+-----------+-------------+-------+----------+------------+----------+
3 rows in set (0.00 sec)

mysql> select 
