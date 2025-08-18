CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2),
    dept_id INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL,
    budget DECIMAL(12,2),
    start_date DATE,
    end_date DATE
);

CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    hours_worked INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO departments (dept_id, dept_name, location) VALUES
(1, 'Human Resources', 'New York'),
(2, 'Engineering', 'San Francisco'),
(3, 'Marketing', 'Chicago'),
(4, 'Finance', 'Boston'),
(5, 'Research', 'Seattle');

INSERT INTO employees (emp_id, emp_name, salary, dept_id, hire_date) VALUES
(101, 'John Smith', 75000.00, 1, '2023-01-15'),
(102, 'Jane Doe', 85000.00, 2, '2022-03-20'),
(103, 'Mike Johnson', 72000.00, 2, '2023-05-10'),
(104, 'Sarah Wilson', 68000.00, 3, '2022-11-05'),
(105, 'David Brown', 92000.00, 4, '2021-08-12'),
(106, 'Lisa Garcia', 78000.00, 1, '2023-02-28'),
(107, 'Tom Anderson', 81000.00, NULL, '2023-07-01'),
(108, 'Emma Davis', 69000.00, NULL, '2023-04-15'),
(109, 'Chris Lee', 88000.00, 2, '2022-12-03');

INSERT INTO projects (project_id, project_name, budget, start_date, end_date) VALUES
(201, 'Website Redesign', 150000.00, '2024-01-01', '2024-06-30'),
(202, 'Mobile App Development', 200000.00, '2024-02-15', '2024-12-31'),
(203, 'Data Analytics Platform', 300000.00, '2024-03-01', '2025-02-28'),
(204, 'Marketing Campaign', 75000.00, '2024-04-01', '2024-08-31'),
(205, 'Security Audit', 50000.00, '2024-05-01', '2024-07-31');

INSERT INTO employee_projects (emp_id, project_id, hours_worked) VALUES
(102, 201, 120),
(103, 201, 80),
(102, 202, 150),
(103, 202, 140),
(104, 204, 95),
(105, 203, 110),
(106, 204, 85),
(101, 201, 60);

SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    e.hire_date,
    d.dept_name,
    d.location
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
ORDER BY e.emp_id;

SELECT 
    d.dept_id,
    d.dept_name,
    d.location,
    e.emp_id,
    e.emp_name,
    e.salary
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
ORDER BY d.dept_id, e.emp_id;

SELECT 
    emp_id,
    emp_name,
    salary,
    hire_date
FROM employees
WHERE dept_id IS NULL;

SELECT 
    p.project_id,
    p.project_name,
    p.budget,
    p.start_date,
    p.end_date,
    e.emp_id,
    e.emp_name,
    ep.hours_worked
FROM projects p
LEFT JOIN employee_projects ep ON p.project_id = ep.project_id
LEFT JOIN employees e ON ep.emp_id = e.emp_id
ORDER BY p.project_id, e.emp_id;

SELECT 
    d.dept_id,
    d.dept_name,
    COALESCE(SUM(ep.hours_worked), 0) AS total_hours
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
LEFT JOIN employee_projects ep ON e.emp_id = ep.emp_id
GROUP BY d.dept_id, d.dept_name
ORDER BY d.dept_id;

SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    e.dept_id
FROM employees e
LEFT JOIN employee_projects ep ON e.emp_id = ep.emp_id
WHERE ep.emp_id IS NULL;
