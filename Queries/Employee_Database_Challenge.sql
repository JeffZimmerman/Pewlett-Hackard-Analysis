-- Employee_Database_challenge

-- Deliverable 1
-- Create Retirement Titles table
SELECT e.emp_no,
    e.first_name, 
    e.last_name,
    t.title,
	t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title,
    rt.to_date
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, to_date DESC;

-- Create Retiring Titles table
SELECT COUNT(ut.title), 
	ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT (title) DESC;

-- Deliverable 2
-- Create Mentorship Eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO membership_eligibility
FROM employees as e
Left outer join dept_emp as de
ON (e.emp_no = de.emp_no)
Left outer join titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '01-01-1965' AND '12-31-1965')
ORDER BY e.emp_no;
