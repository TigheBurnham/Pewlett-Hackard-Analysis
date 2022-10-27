-- Deliverable 1

--Number of retiring employees by title
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date

--New table retirement titles for employess between January 1, 1952 and December 31, 1955
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

-- New Table Unique Titles 
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

--Retrieve number of employees by their most recent job title who are about to retire
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

-- Deliverable 2

--Retrieve employee id, first/last, and birth date from employees
SELECT DISTINCT ON(e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title

--New table mentorship eligibility
INTO mentorship_eligibilty
FROM employees as e
Left outer Join dept_emp as de
ON (e.emp_no = de.emp_no)
Left outer Join titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;