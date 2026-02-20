SELECT * FROM employees;

-- Part 1 Question 1 --
-- How many employees are in the employee table --
SELECT count(*) as total_employees FROM employees;

--Question 2 --
-- How many employees report to other employees --
SELECT count(*) as total_employees_who_report_to_employees FROM employees WHERE ReportsTo is not NULL;

--Question 3 --
-- Find what are the distinct job titles in the employees table --
SELECT distinct(Title) as distinct_title FROM employees;

--Question 4 --
-- Find how many number distinct job titles are in the employees table --
SELECT count(distinct Title) as numbered_distinct_title FROM employees;

--Question 5 --
-- Find which employees have the title of "IT Staff"
SELECT * FROM employees WHERE Title = 'IT Staff';

--Question 6 --
--Find which employees have the title of "IT Staff", lives in thge city LethBridge and has the postal code T1H
SELECT * FROM employees WHERE Title like 'IT Staff' AND City like "Lethbridge" AND PostalCode like "%T1H%";

--Question 7--
--Find how many employees where hired on or after 2003-10-17 --
SELECT count(*) as hired_employees_on_or_after_2003_10_17 FROM employees WHERE HireDate >= date ('2003-10-17');

--Question 8--
--Find how many employees 
SELECT count(*) as hired_employees_between_2002_01__10_and_2003_01_01 FROM employees WHERE HireDate > date ('2002-01-10') AND HireDate < date ('2003-01-01');

--Question 9--
SELECT max(BirthDate), firstname|| '' || lastname as youngest_employee FROM employees;

--Question 10--
SELECT min(HireDate), firstname|| '' || lastname as longest_working_employee FROM employees;

--Question 11--
SELECT firstname|| '' || lastname as Name FROM employees WHERE substr(FirstName,1,1) = substr(LastName,1,1);

--Question 12--
SELECT firstname|| '' || lastname as Name FROM employees WHERE City = 'Calgary' AND State = 'AB';

--Question 13--
SELECT count(*) as number_of_403_area_code FROM employees WHERE Phone like '%(403)%';

--Question 14--
SELECT Phone, count(*) count FROM employees GROUP BY Phone HAVING count>1;

--Question 15--
SELECT firstname|| '' || lastname as Names FROM employees WHERE ReportsTo in(SELECT EmployeeId FROM employees WHERE firstname = 'Michael' and lastname = 'Mitchell');

--Question 16--
SELECT lastname, Length(LastName) FROM employees;

--Question 17--
SELECT Length(LastName), FirstName FROM employees ORDER BY FirstName DESC;

--Question 18--
SELECT firstname, lastname FROM employees WHERE City = 'Edmonton' OR City = 'Lethbridge';

--Question 19--
SELECT avg(Date() - BirthDate) as average_age FROM employees;

--Question 20--
SELECT firstname, lastname FROM employees WHERE Title = 'Sales Support Agent' limit 2;

--PART 2 --
SELECT * FROM artists;
SELECT * FROM albums;
SELECT * FROM employees;
--Question 1 --
SELECT Title, Name FROM albums INNER JOIN artists ON artists.ArtistId = albums.ArtistId ORDER BY Name;

--Question 2 --
SELECT Name, Title FROM artists LEFT JOIN albums USING (ArtistId) ORDER BY Name;

--Question 3 --
SELECT Name, Title FROM artists LEFT JOIN albums ON artists.ArtistId = albums.ArtistId WHERE Title is NULL ORDER BY Name;

--Question 4 --
SELECT distinct e1.city, e1.firstName|| '' || e1.lastname AS fullname 
FROM employees e1 INNER JOIN employees e2 ON e2.city = e1.city AND (e1.firstname<>e2.firstname AND e1.lastname<>e2.lastname) ORDER BY e1.city;

--PART 3
SELECT * FROM customers;
--Question 1--
SELECT customerid, firstname, lastname, CASE country WHEN 'USA' THEN 'Domestic' ELSE 'Foreign' END CustomerGroup FROM customers ORDER BY LastName, FirstName;

--Question 2--
SELECT trackid, name, CASE WHEN milliseconds<60000 THEN 'short' WHEN milliseconds>60000 AND milliseconds<300000 THEN 'medium' ELSE 'long' END category FROM tracks;