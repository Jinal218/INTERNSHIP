CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

SELECT * FROM Worker;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATE,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

SELECT * FROM Bonus

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

 SELECT * FROM Title

QUERIES:~
1.
SELECT FIRST_NAME AS WORKER_NAME FROM Worker;

2.
SELECT upper(FIRST_NAME) FROM Worker;

3.
SELECT distinct DEPARTMENT FROM WORKER;

4.
SELECT SUBSTRING(FIRST_NAME,1,3) FROM WORKER ;

5.
SELECT INSTR(FIRST_NAME, BINARY'a') FROM WORKER WHERE FIRST_NAME = 'Amitabh';

6.
SELECT RTRIM(FIRST_NAME) FROM WORKER;

7.
SELECT LTRIM(DEPARTMENT) FROM WORKER;

8.
SELECT distinct length(DEPARTMENT) FROM WORKER; 

9.
SELECT REPLACE(FIRST_NAME,'a','A') FROM WORKER;

10.
SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) AS 'COMPLETE_NAME' FROM WORKER;

11.
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC;

12.
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

13.
SELECT * FROM WORKER WHERE FIRST_NAME='Vipul' or FIRST_NAME='Satish';

14.
SELECT * FROM WORKER WHERE FIRST_NAME NOT IN('Vipul', 'Satish');

15.
SELECT * FROM WORKER WHERE DEPARTMENT='Admin';

16.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%a%';

17.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%a';

18.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '_____h';

19.
SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;

20.
SELECT * FROM WORKER WHERE YEAR(JOINING_DATE)=2014 AND MONTH(JOINING_DATE)=2;

21.
SELECT COUNT(*) FROM WORKER WHERE DEPARTMENT='Admin';

22.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As WORKER_NAME, SALARY 
FROM WORKER 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM WORKER 
WHERE SALARY BETWEEN 50000 AND 100000);

23.
SELECT DEPARTMENT, COUNT(WORKER_ID) NO_OF_WORKERS FROM WORKER 
GROUP BY DEPARTMENT 
ORDER BY NO_OF_WORKERS DESC;

24.
SELECT distinct W.FIRST_NAME, T.WORKER_TITLE 
FROM WORKER W INNER JOIN TITLE T 
ON W.WORKER_ID = T.WORKER_REF_ID 
AND T.WORKER_TITLE='Manager';

25.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM TITLE
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

26.
SELECT * FROM WORKER WHERE MOD (WORKER_ID, 2) <> 0;

27.
SELECT * FROM WORKER WHERE MOD (WORKER_ID, 2) = 0;

28.
SELECT * INTO WORKERCLONE FROM WORKER;

29.
(SELECT * FROM WORKER) INTERSECT(SELECT * FROM WORKERCLONE);

30.
SELECT * FROM WORKER MINUS SELECT * FROM TITLE;

31.
SELECT CURDATE();

32.
SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 10;

33.
SELECT Salary FROM Worker ORDER BY Salary DESC LIMIT 4,1;

34.
SELECT SALARY FROM WORKER W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.SALARY ) )
 FROM WORKER W2
 WHERE W2.SALARY >= W1.SALARY
 );

35.
SELECT distinct W.WORKER_ID, W.FIRST_NAME, W.SALARY 
FROM WORKER W, WORKER W1 
WHERE W.SALARY = W1.SALARY 
and W.WORKER_ID != W1.WORKER_ID;

36.
SELECT MAX(SALARY) FROM WORKER 
WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM WORKER);

37.
SELECT FIRST_NAME, DEPARTMENT FROM WORKER W WHERE W.DEPARTMENT='HR' 
union all 
SELECT FIRST_NAME, DEPARTMENT FROM WORKER W1 WHERE W1.DEPARTMENT='HR';

38.
(SELECT * FROM WORKER) INTERSECT (SELECT * FROM WORKERCLONE);

39.
SELECT * FROM WORKER
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);

40.
SELECT DEPARTMENT, COUNT(WORKER_ID) AS 'Number of Workers' 
FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;

41.
SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' 
FROM WORKER GROUP BY DEPARTMENT;

42.
SELECT * FROM WORKER WHERE WORKER_ID = (SELECT max(WORKER_ID) FROM WORKER);

43.
SELECT * FROM WORKER WHERE WORKER_ID = (SELECT min(WORKER_ID) FROM WORKER);

44.
SELECT * FROM WORKER WHERE WORKER_ID <=5
UNION
SELECT * FROM (SELECT * FROM WORKER W order by W.WORKER_ID DESC) 
AS W1 WHERE W1.WORKER_ID <=5;

45.
SELECT t.DEPARTMENT,t.FIRST_NAME,t.SALARY FROM (SELECT max(SALARY) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew 
Inner Join WORKER t on TempNew.DEPARTMENT=t.DEPARTMENT 
AND TempNew.TotalSalary=t.Salary;

46.
SELECT DISTINCT SALARY FROM WORKER A WHERE 3 >= 
(SELECT COUNT(DISTINCT SALARY) FROM WORKER B WHERE A.SALARY <= B.SALARY) 
ORDER BY A.SALARY DESC;

47.
SELECT DISTINCT SALARY FROM WORKER A WHERE 3 >= 
(SELECT COUNT(DISTINCT SALARY) FROM WORKER B WHERE A.SALARY >= B.SALARY) 
ORDER BY A.SALARY ASC;

48.
SELECT DISTINCT SALARY FROM WORKER A WHERE 8 >= 
(SELECT COUNT(DISTINCT SALARY) FROM WORKER B WHERE A.SALARY <= B.SALARY) 
ORDER BY A.SALARY DESC;

49.
SELECT DEPARTMENT, SUM(SALARY) FROM WORKER GROUP BY DEPARTMENT;

50.
SELECT FIRST_NAME, SALARY FROM WORKER WHERE SALARY=(SELECT MAX(SALARY) FROM WORKER);
