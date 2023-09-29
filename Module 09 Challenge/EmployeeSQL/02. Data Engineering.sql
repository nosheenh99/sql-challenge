-- Creating the 'titles' table
CREATE TABLE titles (
    title_id VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

-- Creating the 'departments' table
CREATE TABLE departments (
    dept_no VARCHAR(255) PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);

-- Creating the 'employees' table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(255) NOT NULL REFERENCES titles(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex CHAR(1) NOT NULL CHECK (sex IN ('M', 'F')),
    hire_date DATE NOT NULL
);

-- Creating the 'salaries' table
CREATE TABLE salaries (
    emp_no INT NOT NULL REFERENCES employees(emp_no),
    salary DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (emp_no)
);

-- Creating the 'dept_emp' table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL REFERENCES employees(emp_no),
    dept_no VARCHAR(255) NOT NULL REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

-- Creating the 'dept_manager' table
CREATE TABLE dept_manager (
    dept_no VARCHAR(255) NOT NULL REFERENCES departments(dept_no),
    emp_no INT NOT NULL REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no, emp_no)
);
