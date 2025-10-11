					Puzzle 1: Finding Distinct Values
CREATE TABLE InputTbl (
    col1 VARCHAR(10),
    col2 VARCHAR(10)
);
    INSERT INTO InputTbl (col1, col2) VALUES 
('a', 'b'),
('a', 'b'),
('b', 'a'),
('c', 'd'),
('c', 'd'),
('m', 'n'),
('n', 'm');

select distinct col1, col2 from InputTbl
1.
SELECT distinct  
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl

2.
select distinct
	iif(col1 < col2 , col1, col2) as col1,
	iif(col1 < col2, col2, col1) as col2
from InputTbl
							Puzzle 2: Removing Rows with All Zeroes
							
CREATE TABLE TestMultipleZero (
    A INT NULL,
    B INT NULL,
    C INT NULL,
    D INT NULL
);

INSERT INTO TestMultipleZero(A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);

delete from TestMultipleZero
where a =0 and b= 0 and c =0 and d = 0

						Puzzle 3: Find those with odd ids
create table section1(id int, name varchar(20))
insert into section1 values (1, 'Been'),
       (2, 'Roma'),
       (3, 'Steven'),
       (4, 'Paulo'),
       (5, 'Genryh'),
       (6, 'Bruno'),
       (7, 'Fred'),
       (8, 'Andro')

select * from section1
where
	case
		when id % 2 = 0 then 0
		else 1
	end = 1
			Puzzle 4: Person with the smallest id (use the table in puzzle 3)
select top(1) * from section1
order by id

			Puzzle 5: Person with the highest id (use the table in puzzle 3)
select top(1) * from section1
order by id desc

			Puzzle 6: People whose name starts with b (use the table in puzzle 3)
select * from section1
where name like 'b%'

			Puzle 7: Write a query to return only the rows where the code contains the literal underscore _ (not as a wildcard).
CREATE TABLE ProductCodes (
    Code VARCHAR(20)
);

INSERT INTO ProductCodes (Code) VALUES
('X-123'),
('X_456'),
('X#789'),
('X-001'),
('X%202'),
('X_ABC'),
('X#DEF'),
('X-999');

select * from ProductCodes
where code like '%-%'
