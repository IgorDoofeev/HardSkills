--Создать таблицу employees
create table employees (
	id serial primary key,
	employee_name varchar(50) not null
)

select * from employees;

--Наполнить таблицу employee 70 строками.
insert into employees (employee_name)
values  ('David Vaughn'),
		('Anthony Rodriguez'),
		('Bobby Neal'),
		('Eric Martinez'),
		('Steve Warren'),
		('Jon Taylor'),
		('Henry Martinez'),
		('Bradley Fletcher'),
		('Albert Burton'),
		('John Rios'),
		('Charles Brown'),
		('Paul Rowe'),
		('Chris Rivera'),
		('Edward Cunningham'),
		('Alvin Vaughn'),
		('Ronald Campbell'),
		('John Roberts'),
		('David Harrison'),
		('Ralph Baldwin'),
		('Michael Watkins'),
		('Glenn Ward'),
		('John Watts'),
		('Derek Colon'),
		('Mark Scott'),
		('Ramon Webster'),
		('Jeffrey Hunter'),
		('John Wilson'),
		('Patrick Burns'),
		('Justin Shelton'),
		('William Dunn'),
		('Arnold Morales'),
		('Clarence Hansen'),
		('Bruce Carter'),
		('David Wells'),
		('Matthew Foster'),
		('Charles Wells'),
		('Bruce Lane'),
		('Antonio Smith'),
		('John Rodriguez'),
		('Peter Smith'),
		('Robert Torres'),
		('Donald Ramsey'),
		('Tony Baker'),
		('Jeffrey Ball'),
		('Leo Barnes'),
		('Arthur Duncan'),
		('Edgar Williamson'),
		('William Wise'),
		('Stanley Brown'),
		('Walter Greene');
	
select * from employees;

--Создать таблицу salary
create table salary (
	id serial primary key,
	monthly_salary int not null
)

select * from salary;

--Наполнить таблицу salary 15 строками:
insert into salary(monthly_salary)
values (1000),
	   (1100),
	   (1200),
	   (1300),
	   (1400),
	   (1500),
	   (1600),
	   (1700),
	   (1800),
	   (1900),
	   (2000),
	   (2100),
	   (2200),
	   (2300),
	   (2400),
	   (2500);
	  
select * from salary;

--Создать таблицу employee_salary
create table employee_salary (
	id serial primary key,
	employeed_id int not null unique,
	salary_id int not null
)

select * from employee_salary;

/*Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id
*/
insert into employee_salary (employeed_id, salary_id)
values (1, 7),
	   (2, 8),
	   (3, 5),
	   (4, 1),
	   (5, 2),
	   (6, 3),
	   (7, 10),
	   (8, 12),
	   (9, 1),
	   (10, 13),
	   (11, 8),
	   (12, 9),
	   (13, 6),
	   (14, 3),
	   (15, 14),
	   (16, 15),
	   (17, 5),
	   (18, 6),
	   (19, 3),
	   (20, 4),
	   (21, 9),
	   (22, 7),
	   (23, 6),
	   (24, 6),
	   (25, 7),
	   (26, 8),
	   (27, 9),
	   (28, 12),
	   (29, 11),
	   (30, 3),
	   (31, 15),
	   (32, 9),
	   (33, 7),
	   (34, 6),
	   (35, 3),
	   (36, 5),
	   (37, 8),
	   (38, 12),
	   (39, 14),
	   (40, 10),
	   (55, 9),
	   (57, 8),
	   (59, 5),
	   (60, 1),
	   (73, 10),
	   (75, 13),
	   (79, 15),
	   (83, 14),
	   (87, 8),
	   (90, 7);
	  
select * from employee_salary;

/*Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
*/
create table roles (
	id serial primary key,
	role_name int not null unique
)

select * from roles;

--Поменять тип столба role_name с int на varchar(30)
alter table roles 
alter column role_name type varchar(30) using role_name::varchar(30);

select * from roles;

--Наполнить таблицу roles 20 строками:
insert into roles(role_name)
values  ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');


select * from roles;

/*Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)*/
create table roles_employee (
	id serial primary key,
	employee_id int not null unique,
		foreign key (employee_id)
			references employees(id),
	role_id int not null,
		foreign key (role_id)
			references roles(id)
)

select * from roles_employee;
--Наполнить таблицу roles_employee 40 строками
insert into roles_employee(employee_id, role_id)
values  (22, 5),
		(30, 19),
		(16, 6),
		(10, 16),
		(39, 11),
		(38, 15),
		(28, 18),
		(33, 13),
		(3, 7),
		(31, 20),
		(7, 9),
		(13, 1),
		(20, 2),
		(4, 17),
		(35, 3),
		(9, 4),
		(5, 12),
		(6, 8),
		(40, 14),
		(12, 10),
		(27, 12),
		(37, 6),
		(21, 8),
		(32, 14),
		(19, 5),
		(23, 9),
		(8, 7),
		(1, 11),
		(25, 13),
		(15, 19),
		(2, 20),
		(17, 10),
		(36, 18),
		(18, 13),
		(11, 8),
		(26, 11),
		(24, 12),
		(34, 15),
		(29, 7),
		(14, 9);