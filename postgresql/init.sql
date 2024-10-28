
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    salary INT
);

-- GRANT

INSERT INTO users (name, age, salary) VALUES
('Alice', 30, 70000),
('Bob', 25, 50000),
('Charlie', 35, 100000),
('David', 40, 120000),
('Eve', 28, 60000),
('Frank', 50, 150000);
