/* Tạo và xóa db
create database bookstore;
drop database bookstore;
*/

use bookstore;

/* -- Tạo và xóa bảng books
create table books (
		book_id int, 
        title varchar (50), 
        author varchar (50), 
        pages int,
		genres varchar (50), 
        reviews varchar (50), 
        rating float
 	);

drop table books;
*/

/* -- Tạo dữ liệu và cập nhật dữ liệu cho bảng
insert into books (book_id, title, author, pages, genres, reviews, rating)
values 
(1, 'test title 1', 'test author 1', 100, 'test genres 1', 'test reviews 1', 1.5),
(2, 'test title 2', 'test author 2', 200, 'test genres 2', 'test reviews 2', 2.5),
(3, 'test title 3', 'test author 3', 300, 'test genres 3', 'test reviews 3', 3.5);

rename table books to employees;
rename table employees to books;

alter table books add ranks float;
alter table books rename column ranks to popular;
alter table books modify column rating decimal;
alter table books modify column popular int after rating;

update books set rating = 3;

update books set popular = 1
where book_id = 2;
update books set popular = 2
where book_id = 3;

SET SQL_SAFE_UPDATES = 0;

update books set rating = 6.8
where book_id = 2;
update books set rating = 7.8
where book_id = 3;
*/

/*  -- Truy vấn dữ liệu có điều kiện
select * from books where rating = 5;
select * from books where rating > 5;
select * from books where rating < 5;
select * from books where popular is null;

set autocommit = off;
commit;
delete from books;
rollback;

-- current date and current time
alter table books
add date_sold date,
add time_sold time,
add datetime_sold datetime;

insert into books (date_sold, time_sold, datetime_sold)
values (current_date(), current_time(), now());

-- update books 
-- set date_sold = current_date(),
-- 	time_sold = current_time(),
-- 	datetime_sold = now()
-- where book_id = 2;

-- delete from books where book_id is null;
*/

/*  -- Cập nhật nhiều dữ liệu cho bảng
alter table books
add constraint
unique(book_id);
alter table books 
modify title varchar(50) NOT NULL,
modify author varchar(50) NOT NULL;

update books 
set category_id =
	case
		when book_id = 1 then 1
		when book_id = 2 then 1000
		when book_id = 3 then 1002
	end
where book_id in (1, 2, 3);

insert into books (title, author)
values ('End game', 'Gray Jones');

insert into categories (category_name)
values ('reality');
*/

/*  -- Functions in sql 

select count(rating) as the_amount_of_rating
from books;

select sum(rating) as total_rating
from books;

select avg(rating) as avg_rating
from books;
*/

/* -- CONCAT trong MySQL là một hàm được sử dụng để ghép nối các chuỗi (string) trong câu lệnh truy vấn SQL.

select concat(reviews, ' and ', rating, ' point') as reviews_and_rating
from books;
*/

/* -- logical in mysql: and, or, between, not, in 

select * from books
where not title = 'End game';

select * from books
where title = 'End game' or title = 'test title 1';
*/

/* -- wildcards (ký tự đại diện) là các ký tự đặc biệt được sử dụng để tìm kiếm 
-- các giá trị tương đồng trong một cột trong câu lệnh SELECT hoặc WHERE.
-- Có 3 loại: 
-- 	1. % : Đại diện cho bất kỳ chuỗi ký tự nào (bao gồm cả không có ký tự).
--     2. _ : Đại diện cho một ký tự duy nhất bất kỳ. 
--     3. []: Đại diện cho một tập hợp các ký tự được chỉ định. 

select *
from books where title like 'eg%' or title like 't%';

select *
from categories where category_name like '%s' or category_name like '%l';

select *
from categories where category_name like 'v____a_';

select *
from books where title like 'E__ ____';

select *
from categories where category_name like '_e%';

select *
from categories where category_name not like '[vsr]%';
*/

/* cau lenh nay khong thuc hien duoc
select *
from categories where category_name like '_eu%'; 

select *
from categories where category_name like '[vsr]%';

select *
from categories where category_name like '[!vsr]%';

select *
from categories where category_name like '[a-o]%';

select *
from categories where category_name like '%[^a]%';
*/

/* -- order by clause
select *
from books order by rating desc;

select *
from books order by rating asc, book_id desc; -- dung khi trung lap ve gia tri rating

select *
from categories order by category_id desc;
*/

/* -- limit clause
select *
from categories limit 3;

select *
from categories order by category_name desc limit 3;

select *
from categories limit 1, 1; 
-- câu lệnh này sẽ bỏ qua dòng đầu tiên của bảng và trả về dòng thứ hai. 

select *
from categories limit 1, 3; 
-- câu lệnh này sẽ bỏ qua 1 dòng đầu tiên của bảng và trả về 3 dòng tiếp theo.

select *
from categories limit 3, 1;
-- câu lệnh này sẽ bỏ qua 3 dòng đầu tiên của bảng và trả về dòng thứ 4.

select *
from categories limit 3, 2;
-- câu lệnh này sẽ bỏ qua 3 dòng đầu tiên của bảng và trả về 2 dòng tiep theo.
*/

/* -- create new table employees and insert data for it
create table employees (
	employee_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    age int,
    hourly_working datetime
);

insert into employees (first_name, last_name, age, hourly_working)
values 	('Khan', 'Nguyen', 10, now()), 
		('Minh', 'Ta', 10, now()), 
        ('An', 'Nguyen', 10, now()), 
        ('Hung', 'Nguyen', 10, now());
*/

/* -- set up for using union
update customers
set age =
	case 
		when customer_id = 1 then 12
        when customer_id = 2 then 21
        when customer_id = 3 then 33
        when customer_id = 4 then 8
        when customer_id = 5 then 9
        when customer_id = 6 then 40
	end
where customer_id in (1, 2, 3, 4, 5, 6);

update employees
set age =
	case 
		when employee_id = 1 then 52
        when employee_id = 2 then 25
        when employee_id = 3 then 36
	end
where employee_id in (1, 2, 3);
*/

/* -- unions clause: 
-- UNION là một toán tử kết hợp (combining operator) được sử dụng
để kết hợp các kết quả của hai hoặc nhiều câu lệnh SELECT.
-- union avoid duplicated
select age from customers
union
select age from employees;

select age from customers
union all
select age from employees;
*/

/* -- TRIGGERS
ALTER TABLE employees
MODIFY COLUMN salary DECIMAL(10,2) AFTER hourly_working;

ALTER TABLE employees
MODIFY COLUMN hourly_working float AFTER age;

create trigger before_hourly_pay_update
before update on employees
for each row
set new.salary = (new.hourly_working * 10);

update employees
set hourly_working = 26
where employee_id = 4;

update employees
set hourly_working = 5
where employee_id = 3;

update employees
set hourly_working = hourly_working + 1;
*/

select *from customers;

show triggers;

select *from employees;


/* -- Tạo và xóa bảng customers
create table customers (
customer_id int,
customer_name varchar(50), 
customer_age int, 
hire_date date
);

insert into customers (customer_id, customer_name, customer_age, hire_date)
values 	(1, 'test_name_1', 10, current_date()),
		(2, 'test_name_2', 12, '2023-01-10'),
		(3, 'test_name_3', 20, '2023-04-15');
       
drop table customers;
*/

/* -- Thêm dữ liệu và điều kiện trong bảng
alter table customers
add constrai  nt check_customer_age check (customer_age >=10);

insert into customers 
values (4, 'test_name_4', 15, '2023-02-10');
			(4, 'test_name_4', 5, '2023-02-10');
      -- (5, 'test_name_5', 18, '2023-03-15');

alter table customers
-- add hourly_price int;
alter hourly_price set default 0.00; 

insert into customers (customer_id, customer_name, customer_age, hire_date)
values (6, 'test_name_6', 63, current_date());

alter table customers
modify hourly_price decimal(4, 2);

select * from customers;

create table categories (
category_id int primary key,
category_name varchar(50) unique,
amount decimal(5, 2)
);

alter table categories
add constraint primary key(category_id); -- cannot use because set the pk before

insert into categories
values 	(1, 'trending', 10),
		(2, 'virtual', 20);

select * from categories where category_id = 2;
*/

/* -- Vì bảng đã có dữ liệu nên không thể thêm thuộc tính auto_increment trực tiếp vào cột category_id

-- Bước 1: Tạo bảng tạm thời và sao chép dữ liệu từ bảng gốc vào bảng tạm thời. 
create table categories_temp as select * from categories;

-- Bước 2: Xóa bảng gốc
drop table categories;

-- Bước 3: Tạo lại bảng gốc với cấu trúc mới bao gồm thuộc tính
-- auto_increment cho cột primary key
create table categories (
	category_id int not null auto_increment primary key,
    category_name varchar(50) not null,
    category_description text
);

-- Bước 4: Sao chép dữ liệu từ bảng tạm thời vào bảng gốc
insert into categories (category_name)
select category_name from categories_temp;

-- Bước 5: Xóa bảng tạm thời
drop table categories_temp;
 */
 
/* -- Test với id bắt đầu bằng 1000
alter table categories
auto_increment = 1000;

insert into categories (category_name, category_description)
values 	('social', 'no description'),
			('influencer', 'no description'),
			('musical', '');
*/

/* -- Thêm khóa ngoại cho một cột trong bảng đã có dữ liệu.
-- Bước 1: Tạo cột category_id kiểu INT trong bảng books để lưu trữ khóa ngoại.
alter table books add column category_id int;

-- Bước 2: Thêm ràng buộc khóa ngoại vào bảng books để liên kết với bảng categories
alter table books add constraint fk_books_categories
foreign key (category_id) references categories(category_id);
*/

/* -- Liên kết ngược lại trong bảng categories
alter table categories add constraint fk_categories_books
foreign key (category_id) references books(category_id);
 */
 
/* -- Sử dụng joins: inner, left, right, self

-- INNER JOIN trả về tập hợp các bản ghi trong hai bảng có khóa chính được kết hợp với nhau. 
-- Kết quả chỉ chứa các bản ghi có khóa chính giống nhau trong cả hai bảng.
select book_id, title, author, category_name
from books inner join categories
on books.category_id = categories.category_id;

-- LEFT JOIN (còn được gọi là LEFT OUTER JOIN) trả về tất cả các bản ghi từ bảng bên trái 
-- và các bản ghi khớp từ bảng bên phải. Nếu không có khớp từ bảng bên phải, 
-- các giá trị bên phải sẽ bị bỏ trống và trả về NULL.
select *
from books left join categories
on books.category_id = categories.category_id;

-- RIGHT JOIN (còn được gọi là RIGHT OUTER JOIN) trả về tất cả các bản ghi từ bảng bên phải 
-- và các bản ghi khớp từ bảng bên trái. Nếu không có khớp từ bảng bên trái, 
-- các giá trị bên trái sẽ bị bỏ trống và trả về NULL.
select *
from books right join categories
on books.category_id = categories.category_id;

-- SELF JOIN là một loại JOIN trong đó một bảng được kết nối với chính nó thông qua một hoặc nhiều cột. 
-- Thông thường, SELF JOIN được sử dụng để kết nối các hàng trong cùng một bảng khi chúng 
-- có mối quan hệ hierarchy hoặc network.
alter table customers
add referral_id int;

SET SQL_SAFE_UPDATES = 0; -- turn off safe mode for adding data

update customers
set referral_id = 
	case
		when customer_id = 2 then 1
		when customer_id = 3 then 2
		when customer_id = 4 then 3
		when customer_id = 5 then 4
    end
where customer_id in (2, 3, 4, 5);

select * from customers as a
inner join customers as b
on a.referral_id = b.customer_id;

select 	a.customer_id, a.customer_name, 
		b.customer_name as 'referral_by'
from customers as a
left join customers as b
on a.referral_id = b.customer_id;

alter table employees
add role varchar(50);

update employees
set role = 
	case 
		when employee_id = 1 then 'boss'
        when employee_id = 2 then 'manager'
        when employee_id = 3 then 'assit. boss'
        when employee_id = 4 then 'employee'
	end
where employee_id in (1, 2, 3, 4);

alter table employees
add supervisor_id int;

update employees
set supervisor_id = 
	case 
		when employee_id = 1 then 3
        when employee_id = 2 then 3
        when employee_id = 3 then 2
        when employee_id = 4 then 5
	end
where employee_id in (1, 2, 3, 4);

select a.employee_id, a.first_name, a.last_name,
		concat(b.first_name , ' ' , b.last_name) as 'reports to'
from employees as a
left join employees as b
on a.supervisor_id = b.employee_id;
*/

/* -- Sử dụng views trong mysql
-- a virtual tablr based on the result-set of an SQL statement
-- the fields in a view are fields from one or more real table in db
-- They're not real tables, but can be interacted with as if they were

create view employees_attendence as
select first_name, last_name
from employees;

alter table customers 
add column email varchar(50);

update customers
set email = 
	case 
		when customer_id = 1 then 'test1@gmail.com'
		when customer_id = 2 then 'test2@gmail.com'
        when customer_id = 3 then 'test3@gmail.com'
        when customer_id = 4 then 'test4@gmail.com'
	end
where customer_id in (1, 2, 3, 4);

create view customer_emails as
select email from customers;

insert into customers (email)
values ('test_view_customer_emails@gmail.com');
*/
 
/* -- Index (binary tree data structure)
-- Indexes are used to find values with thin a specific column are more quickly
-- Mysql normally searches sequentially through a column
-- The longer the column, the more expensive the operation is 
-- UPDATE takes more time, SELECT takes less time.

-- single column 
create index last_name_idx 
on employees(last_name);

-- multi column
create index last_name_first_name_idx
on employees(last_name, first_name);

-- drop index
alter table employees
drop index last_name_idx;

show indexes from employees;
*/

/* -- More about Index
Index trong MySQL là một cơ chế tối ưu hóa để tăng tốc độ truy vấn của cơ sở dữ liệu. 
Khi một bảng trong MySQL có một index, MySQL có thể sử dụng index để tìm kiếm và 
sắp xếp dữ liệu nhanh hơn, thay vì phải quét toàn bộ bảng để tìm kiếm.

Index trong MySQL được tạo bằng cách chọn một hoặc nhiều cột trong bảng và tạo một bản sao
nhỏ của chúng trong một cấu trúc dữ liệu tối ưu hóa. Khi truy vấn được thực thi và MySQL 
cần tìm kiếm dữ liệu trên các cột được index, nó sẽ truy cập vào cấu trúc dữ liệu này 
thay vì phải duyệt qua toàn bộ bảng.

Tuy nhiên, việc sử dụng index cũng có một số hạn chế và ảnh hưởng đến hiệu suất của cơ sở 
dữ liệu. Việc tạo quá nhiều index hoặc index không cần thiết có thể làm cho hiệu suất truy 
vấn giảm xuống và làm tăng thời gian để cập nhật cơ sở dữ liệu. Do đó, việc tạo index cần 
phải được thực hiện một cách cẩn thận và tùy thuộc vào các yếu tố như kích thước của bảng 
và cách mà dữ liệu được sử dụng.
*/

/* -- subquery: query(subquery)
alter table employees
add column salary float;

update employees
set salary = timestampdiff(hour, hourly_working, now()) * 10;

select first_name, last_name, role, 
(select avg(salary) from employees) as 'avg_pay'
from employees;

select customer_name, referral_id
from customers 
where referral_id in
(
select referral_id 
from customers 
where referral_id is not null
);

select customer_name
from customers 
where referral_id 
not in (
select distinct referral_id 
from customers 
where referral_id is not null
);
*/

/* -- define: GROUP BY
-- GROUP BY trong MySQL là một câu lệnh được sử dụng để nhóm các bản ghi có 
-- cùng giá trị trong một hoặc nhiều cột trong bảng. 
-- Các giá trị được nhóm lại dựa trên các cột được chỉ định trong phần GROUP BY. 
-- Sau khi nhóm các bản ghi, chúng ta có thể áp dụng các hàm tổng hợp 
-- như SUM, COUNT, AVG, MIN, MAX để tính toán giá trị tổng hợp cho mỗi nhóm.

ALTER TABLE customers ADD INDEX (customer_id);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2),
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) 
    REFERENCES customers(customer_id)
);

INSERT INTO transactions
VALUES 	(1000, 4.99, 3, "2023-01-01"),
		(1001, 2.89, 2, "2023-01-01"),
		(1002, 3.38, 3, "2023-01-02"),
		(1003, 4.99, 1, "2023-01-02"),
		(1004, 1.00, NULL, "2023-01-03"),
		(1005, 2.49, 4, "2023-01-03"),
		(1006, 5.48, NULL, "2023-01-03");
        
select sum(amount), order_date
from transactions
group by order_date;

select sum(amount), customer_id
from transactions
group by customer_id;

select count(amount), customer_id
from transactions
group by customer_id
having count(amount) > 1 and customer_id is not null; -- having thay cho where khi sử dụn group by
*/

/* -- define ROLLUP
-- ROLLUP là một câu lệnh trong SQL dùng để tạo ra các báo cáo tổng hợp dữ liệu. 
-- Cụ thể, ROLLUP được sử dụng để tính toán các tổng hợp cấp cao hơn cho một tập 
-- hợp các dữ liệu đã được nhóm. Nó sẽ tạo ra các kết quả tổng hợp theo từng cấp 
-- độ của các trường được chỉ định trong danh sách GROUP BY.

select count(transaction_id), order_date
from transactions
group by order_date with rollup;

select count(transaction_id) as '# of orders', customer_id
from transactions
group by customer_id with rollup;
*/

/* -- define on delete
-- Trong SQL, khi tạo khóa ngoại (foreign key) giữa hai bảng, chúng ta có thể sử dụng 
-- cú pháp "ON DELETE" để xác định hành động sẽ được thực hiện khi có một bản ghi bị 
-- xóa khỏi bảng chứa khóa chính (primary key) được tham chiếu đến từ bảng khóa ngoại.

-- Có 4 tùy chọn hành động mà ta có thể sử dụng với ON DELETE:

-- CASCADE: Xóa tất cả các bản ghi liên quan trong bảng con khi xóa bản ghi trong bảng cha.
-- SET NULL: Đặt giá trị của các cột khóa ngoại là NULL khi bản ghi trong bảng cha bị xóa.
-- SET DEFAULT: Đặt giá trị của các cột khóa ngoại là giá trị mặc định được xác định trước 
-- đó khi bản ghi trong bảng cha bị xóa.
-- RESTRICT: Không cho phép xóa bản ghi trong bảng cha nếu có bản ghi con liên quan đến nó.


alter table transactions 
drop foreign key transactions_ibfk_1;

-- set null: when a fk is deleted, replace fk with null
alter table transactions 
add constraint fk_customer_id
foreign key (customer_id) references customers(customer_id)
on delete set null;

delete from customers
where customer_id = 4;

-- cascade: when a fk is deleted, delete row 
alter table transactions 
drop foreign key fk_customer_id;

update transactions
set customer_id = 4
where transaction_id = 1005;

insert into customers (customer_id, customer_name)
values (4, 'test_cascade_in_delete');

alter table transactions 
add constraint fk_customer_id
foreign key (customer_id) references customers(customer_id)
on delete cascade;

delete from transactions
where customer_id = 4;
*/

/* -- STORED PROCEDURES:
-- Stored procedures là một khối lệnh SQL được lưu trữ trong cơ sở dữ liệu để thực hiện 
-- một tác vụ nhất định. Nó cho phép bạn tạo ra các chương trình riêng biệt trong cơ sở 
-- dữ liệu, tương tự như các chương trình riêng biệt trên máy tính. Stored procedures 
-- thường được sử dụng để giảm thiểu lượng mã lặp lại và tăng tốc độ xử lý của cơ sở dữ liệu.

-- DELIMITER là một câu lệnh trong MySQL để xác định ký tự phân cách câu lệnh mới 
-- thay vì dấu chấm phẩy (;) mặc định. Điều này cho phép bạn viết các stored procedure 
-- hoặc function với nhiều câu lệnh mà không bị xem là nhiều câu lệnh riêng lẻ.

DELIMITER $$
create procedure get_customers()
begin
SELECT * FROM customers;
end $$
DELIMITER ;

call get_customers;

drop procedure get_customers;

DELIMITER $$
create procedure find_customer(in id int)
begin
	select *
    from customers
    where customer_id = id;
end $$
DELIMITER ;
call find_customer(2);

drop procedure find_customer;

DELIMITER $$
create procedure find_customer(
	in c_name varchar(50)
    )
    begin
		select *
        from customers
        where customers_name =c_name;
    end $$
DELIMITER ;

DELIMITER $$
create procedure find_employee(
	in f_name varchar(50),
    in l_name varchar(50)
    )
    begin
		select *
        from employees
        where first_name =f_name and last_name = l_name;
    end $$
DELIMITER ;

call find_employee('An', 'Nguyen');
*/

