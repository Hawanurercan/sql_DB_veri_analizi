SELECT * FROM demo;
-- Örnek veri tabanını oluşturma
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);
//–belirli bir tablodaki ilgili sütun için otomatik olarak artan değerler üretir.

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

//COUNT(*) AS total_records: Bu kısım, sorgunun sonucunda döndürülecek olan değeri belirtir. COUNT(*) fonksiyonu, seçilen kayıt sayısını sayar. * sembolü tüm sütunları ifade eder, yani burada tüm satırların sayısını sayacak demektir. AS total_records ifadesi, bu sütunun sonucunda döndürülen değeri total_records olarak adlandırır.

SELECT count(*) as hr_department
from employees
where department='hr' ;


SELECT column1, column2, ...
FROM table_name
[WHERE condition]
[ORDER BY column1, column2, ...]
LIMIT number_of_rows;

SELECT * FROM customers ORDER BY customer_name LIMIT 5;
--Bu sorgu, müşteri tablosunu müşteri adlarına göre sıralar ve ilk 5 müşteriyi getirir

SELECT DISTINCT customer_id FROM orders;
--Bu sorgu, orders tablosundaki customer_id sütunundaki benzersiz müşteri numaralarını döndürecektir..

SELECT * FROM employees WHERE email IS NULL;
--Bu sorgu, email sütunu NULL olan tüm çalışanları getirecektir.

--not: Order BY : SQL'de ORDER BY ifadesi, veri setinin istenilen şekilde sıralanmasını sağlar ve bu da veriyi analiz etmek veya raporlamak için önemli bir araçtır.

SELECT * FROM customers ORDER BY country, customer_name;
--Bu sorgu, müşterileri önce ülkeye göre alfabetik olarak sıralar, ardından aynı ülkede ise müşteri adına göre sıralar. Sonuç şu şekilde olur:

3
Charlie's Cafe
Chicago
USA

2
Bob's Burgers
Los Angeles
USA

1
Alice's Bakery
New York
USA



SELECT
job_location,
j ob_via,
job_postings_fact
WHERE
'Data Analyst'
ORDER BY
salary_year_avg DESC I

--DESC : otomatik verilen sırayı tersine çevirir. (artıyorsa azalır azalıyorsa artar )


SELECT columnl, c01umn2,
FROM table_name 
WHERE condition 
GROUP BY column 
HAVING condition 
ORDER BY column [ASC / DESC] ,
LİMİT number;

--Doğru kod yazım sırası . 


SELECT *
FROM employees
WHERE job_title = 'Data Analyst'
  AND salary > 50000
  AND years_of_experience >= 3
  AND department IN ('IT', 'Finance')
ORDER BY last_name ASC;

--Bu SQL sorgusu, employees tablosundan aşağıdaki işlemleri gerçekleştirir:
job_title'ı 'Data Analyst' olan,
salary'si 50000'den büyük olan,
years_of_experience'ı 3 veya daha fazla olan,
department'ı 'IT' veya 'Finance' olan çalışanları seçer.


SELECT
    job_id,
    job_title,
    salary_year_avg,
    job_via
FROM
    job_postings_fact
WHERE
    job_via <> 'Ai-Jobs.net' ;

--Bu SQL sorgusu, job_postings_fact tablosundan belirli bir koşulu sağlamayan (job_via değeri 'Ai-Jobs.net' olmayan) iş ilanı kayıtlarını seçer.


WHERE
    salary_year_avg > 100000
    AND job_title = 'Data Analyst';

--koşullarda and kullanımı


WHERE
    salary_year_avg > 100000
    OR job_title = 'Data Analyst';

--koşullarda or kullanımı


 WHERE salary_year_avg BETWEEN 60000 AND 90000;

-- koşullarda between kullanımı


WHERE job_title_short IN ('Data Analyst', 'Data Engineer');

--koşullarda IN kullanımı


select
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
from	
	job_postings_fact
where
    job_location in ('boston', 'ma' ,'anywhere') and
    ((job_title_short='data analyst' and salary_year_avg > 10000 ) or
    (job_title_short='business analyst' and salary_year_avg >80000 ))
 
--practice 1


SELECT *
FROM job_title
WHERE last_name LIKE '% analyst %' ;

-- % işareti arasına sağına soluna gelen kelimeyi sayıyı aranılan sütunda aratır
 

select
	name
from	
	company_dim
where
            name like '%tech_'

-- WHERE name LIKE '%tech_': Bu ifade, name sütunu içinde 'tech' kelimesinden hemen sonra bir tek karakter içeren tüm şirket isimlerini filtreler. İşte % ve _ karakterlerinin kullanımı:
--%: Herhangi bir karakter dizisini temsil eder. Yani, '%' işareti öncesinde veya sonrasında herhangi bir karakter dizisi geçebilir. Bu durumda '%' işareti, 'tech' kelimesinden önce veya sonra herhangi bir karakter dizisine izin verir.
--: Tek bir karakteri temsil eder. Yani, '_' işareti sadece bir karakter uzunluğunda bir dizi oluşturur
--( 'ABC techA', 'XYZ tech1', 'TechB' gibi )


select
 job_id
 job_title
 job_posted_date
from
 job_postings_fact
where
 job_title like 'Engineer_'

--job_postings_fact tablosundaki iş ilanları arasında, iş başlığı tam olarak "Engineer" olan ve hemen sonrasında bir karakter bulunan tüm ilanları bulun.
--job_id, job_title ve job_posted_date sütunlarını alın.


SELECT
    column_name AS alias_name
FROM
    table_name;

-- AS = takma ad


SELECT
    job_id,
    job_title_short,
    job_location,
    job_via AS job_posted_site,
    job_posted_date,
    salary_year_avg AS avg_yearly_salary
FROM
    job_postings_fact;
