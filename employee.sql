	create database p;
	use p;
	CREATE TABLE Employee (
		empno INT PRIMARY KEY,
		ename VARCHAR(25),
		mgr_no INT,
		hire_date DATE,
		sal FLOAT,
		deptno INT,
		FOREIGN KEY (deptno) REFERENCES Dept(deptno)
	);

	CREATE TABLE Dept (
		deptno INT PRIMARY KEY,gi
		dname VARCHAR(25),
		loc VARCHAR(100)
	);
	alter table dept  rename column loc to dloc;

	CREATE TABLE Incentives (
		empno INT,
		incentive_date DATE,
		incentive_amount FLOAT,
		PRIMARY KEY (empno, incentive_date),
		FOREIGN KEY (empno) REFERENCES Employee(empno)
	);
  SELECT a.empno, a.incentive_amount
FROM Incentives a
WHERE 1 = (
    SELECT COUNT(DISTINCT b.incentive_amount)
    FROM Incentives b
    WHERE b.incentive_amount > a.incentive_amount and incentive_date between '2019-01-01' and '2019-01-31'
) and  incentive_date between '2019-01-01' and '2019-01-31';
	CREATE TABLE Project (
		pno INT PRIMARY KEY,
		pname VARCHAR(25),
		ploc VARCHAR(50)
	);

	CREATE TABLE assigned_to (
		empno INT,
		pro INT,
		job_role VARCHAR(25),
		PRIMARY KEY (empno, pro),
		FOREIGN KEY (empno) REFERENCES Employee(empno),
		FOREIGN KEY (pro) REFERENCES Project(pno)
	);
	alter table assigned_to rename column pro to pno;
	INSERT INTO dept (deptno, dname, dloc)
	VALUES
	(1, 'Sales', 'Bengaluru'),
	(2, 'Marketing', 'Hyderabad'),
	(3, 'IT', 'Mysore'),
	(4, 'Finance', 'Chennai'),
	(5, 'HR', 'Delhi');
	INSERT INTO employee (empno, ename, mgr_no, hire_date, sal, deptno)
	VALUES
	(101, 'John', NULL, '2021-01-01', 50000, 1),
	(102, 'Mohan', 101, '2020-05-15', 60000, 2),
	(103, 'Max', 102, '2019-08-25', 70000, 3),
	(104, 'Tim', NULL, '2022-09-10', 55000, 4),
	(105, 'Eve', 103, '2021-11-28', 58000, 5);

	INSERT INTO project (pno, ploc, pname)
	VALUES
	(201, 'Bengaluru', 'Project A'),
	(202, 'Hyderabad', 'Project B'),
	(203, 'Mysore', 'Project C'),
	(204, 'Chennai', 'Project D'),
	(205, 'Delhi', 'Project E');

	INSERT INTO assigned_to (empno, pno, job_role)
	VALUES
	(101, 201, 'Manager'),
	(102, 202, 'Developer'),
	(103, 203, 'Tester'),
	(104, 204, 'Analyst'),
	(105, 205, 'Designer');

	SELECT e.empno
	FROM Employee e
	JOIN assigned_to a
	ON e.empno = a.empno
	JOIN Project p
	ON p.pno = a.pno
	WHERE p.ploc IN ('Bengaluru', 'Hyderabad', 'Mysore');
    INSERT INTO Employee (empno, ename, mgr_no, hire_date, sal, deptno)
VALUES
(106, 'Alice', 101, '2018-03-20', 62000, 1),
(107, 'Bob', 101, '2017-07-15', 58000, 1),
(108, 'Charlie', 102, '2019-04-10', 50000, 2),
(109, 'David', 103, '2021-02-17', 55000, 3),
(110, 'Emma', 104, '2020-06-21', 53000, 4);
INSERT INTO Incentives (empno, incentive_date, incentive_amount)
VALUES
(101, '2019-01-10', 2000),
(102, '2019-01-15', 2500),
(103, '2019-01-20', 3000),
(104, '2019-01-25', 1800),
(105, '2019-01-28', 2200),
(106, '2019-01-18', 2600),  -- Adding extra entries to create variation in incentives
(107, '2019-01-22', 2700),
(108, '2019-01-23', 2900),
(109, '2019-01-24', 3100),
(110, '2019-01-27', 2800);
INSERT INTO Project (pno, pname, ploc)
VALUES
(206, 'Project F', 'Delhi'),
(207, 'Project G', 'Bengaluru'),
(208, 'Project H', 'Hyderabad');

INSERT INTO assigned_to (empno, pno, job_role)
VALUES
(106, 206, 'Manager'),
(107, 207, 'Developer'),
(108, 208, 'Tester'),
(109, 202, 'Analyst'),
(110, 201, 'Designer');


	SELECT e.empno, e.ename, e.deptno,a.job_role, d.dloc, p.ploc
	FROM Employee e
	JOIN dept d
	ON e.deptno = d.deptno
	JOIN assigned_to a
	ON e.empno = a.empno
	JOIN Project p
	ON p.pno = a.pno
	WHERE p.ploc = d.dloc;
	select e.empno from employee e where e.empno not in
	(select t.empno from incentives t);
    
    