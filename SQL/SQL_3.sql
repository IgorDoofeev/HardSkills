select * from employee_salary es;
select * from employees e;
select * from roles_employee re;
select * from roles r;
select * from salary s;
--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary on employee_salary.salary_id = salary.id;
--2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary from employee_salary
join employees on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2000;
--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select monthly_salary from salary s 
left join employee_salary es on s.id = es.salary_id
where es.employee_id is null;
--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select monthly_salary 
from salary s 
left join employee_salary es 
on s.id = es.salary_id
where es.employee_id is null and s.monthly_salary < 2000;
--5. Найти всех работников кому не начислена ЗП.
select employee_name from employees
left join employee_salary
on employees.id = employee_salary.employee_id
where employee_salary.salary_id is null;
--6. Вывести всех работников с названиями их должности.
select employee_name, role_name from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id;
--7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id
join roles r on re.role_id = r.id
where r.role_name like '%Java%' and r.role_name not like '%JavaScript%';
--8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id 
join roles r on re.role_id = r.id 
where r.role_name like '%Python%';
--9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id 
join roles r on re.role_id = r.id 
where r.role_name like '%QA%';
--10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id 
join roles r on re.role_id = r.id
where r.role_name like '%Manual%';
--11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id
join roles r ON re.role_id = r.id
where r.role_name like '%Automation%';
--12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary from roles_employee re
left join employees e on re.employee_id = e.id 
left join roles r on re.role_id = r.id
left join employee_salary es on e.id = es.id
left join salary s on es.salary_id = s.id 
where r.role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary from employee_salary es
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id
left join roles_employee re on es.employee_id = re.employee_id
left join roles on re.role_id = roles.id
where roles.role_name like '%Middle%'

--14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id
left join roles r on re.role_id = r.id 
where r.role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков
select monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id
left join roles r on re.role_id = r.id 
where r.role_name like '%Java%' and r.role_name not like '%JavaScript%';

--16. Вывести зарплаты Python разработчиков
select monthly_salary from employee_salary es 
left join salary s on es.salary_id = s.id 
left join employees e on es.employee_id = e.id
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id
where r.role_name like '%Python%';

--17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Junior Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Middle JavaScript developer%';

--19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Senior Java%';

--20. Вывести зарплаты Junior QA инженеров
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Junior% %QA%';

--21. Вывести среднюю зарплату всех Junior специалистов
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id
join roles r on re.role_id = r.id
where r.role_name like '%Junior%';

--23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary) from roles_employee re
left join roles r on re.role_id = r.id 
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id 
where role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) from roles_employee re
left join roles r on re.role_id = r.id 
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id 
where role_name like '%QA%';

--25. Вывести количество QA инженеров
select count(monthly_salary) from roles_employee re
left join roles r on re.role_id = r.id 
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id 
where role_name like '%QA%';

--26. Вывести количество Middle специалистов.
select count(employee_name) from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Middle%';

--27. Вывести количество разработчиков
select count(employee_name) from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r on re.role_id = r.id 
where r.role_name like '%developer%';

--28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) from roles_employee re
left join roles r on re.role_id = r.id 
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id 
where role_name like '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r ON re.role_id = r.id
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id
order by employee_name;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r ON re.role_id = r.id
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id
where monthly_salary between 1700 and 2300
order by employee_name;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r ON re.role_id = r.id
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id
where monthly_salary < 2300
order by employee_name;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r ON re.role_id = r.id
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id
where monthly_salary in (1100, 1500, 2000)
order by employee_name;