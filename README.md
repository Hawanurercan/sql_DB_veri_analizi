-- Örnek veri tabanını oluşturma
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);
--AUTO_INCREMENT :belirli bir tablodaki ilgili sütun için otomatik olarak artan değerler üretir.

-- Örnek veri ekleme
INSERT INTO employees (first_name, last_name, department, salary, hire_date)
VALUES ('John', 'Doe', 'IT', 5000.00, '2020-01-15'),
       ('Jane', 'Smith', 'HR', 4500.00, '2019-05-20'),
       ('Michael', 'Johnson', 'Finance', 6000.00, '2021-03-10'),
       ('Emily', 'Williams', 'IT', 4800.00, '2020-09-02'),
       ('Chris', 'Brown', 'Marketing', 5500.00, '2018-11-30'),
       ('Jessica', 'Davis', 'HR', 4200.00, '2020-07-12'),
       ('David', 'Martinez', 'Finance', 5800.00, '2019-02-25'),
       ('Amy', 'Garcia', 'IT', 5100.00, '2021-06-18'),
       ('Steven', 'Miller', 'Marketing', 5200.00, '2020-04-05'),
       ('Lisa', 'Moore', 'HR', 4300.00, '2018-08-22');

SELECT COUNT(*) AS total_records
FROM employees;

--COUNT(*) AS total_records: Bu kısım, sorgunun sonucunda döndürülecek olan değeri belirtir. 
COUNT(*) fonksiyonu, seçilen kayıt sayısını sayar. * sembolü tüm sütunları ifade eder, yani burada tüm satırların sayısını sayacak demektir.
AS total_records ifadesi, bu sütunun sonucunda döndürülen değeri total_records olarak adlandırır. --

SELECT COUNT(*) AS hr_department_count
FROM employees
WHERE department = 'HR';

--

SELECT SUM(salary) AS total_salary,
       AVG(salary) AS average_salary
FROM employees;

--




