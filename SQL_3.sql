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
--8. Г‚Г»ГўГҐГ±ГІГЁ ГЁГ¬ГҐГ­Г  ГЁ Г¤Г®Г«Г¦Г­Г®Г±ГІГј ГІГ®Г«ГјГЄГ® Python Г°Г Г§Г°Г ГЎГ®ГІГ·ГЁГЄГ®Гў.
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id 
join roles r on re.role_id = r.id 
where r.role_name like '%Python%';
--9. Г‚Г»ГўГҐГ±ГІГЁ ГЁГ¬ГҐГ­Г  ГЁ Г¤Г®Г«Г¦Г­Г®Г±ГІГј ГўГ±ГҐГµ QA ГЁГ­Г¦ГҐГ­ГҐГ°Г®Гў.
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id 
join roles r on re.role_id = r.id 
where r.role_name like '%QA%';
--10. Г‚Г»ГўГҐГ±ГІГЁ ГЁГ¬ГҐГ­Г  ГЁ Г¤Г®Г«Г¦Г­Г®Г±ГІГј Г°ГіГ·Г­Г»Гµ QA ГЁГ­Г¦ГҐГ­ГҐГ°Г®Гў.
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id 
join roles r on re.role_id = r.id
where r.role_name like '%Manual%';
--11. Г‚Г»ГўГҐГ±ГІГЁ ГЁГ¬ГҐГ­Г  ГЁ Г¤Г®Г«Г¦Г­Г®Г±ГІГј Г ГўГІГ®Г¬Г ГІГЁГ§Г ГІГ®Г°Г®Гў QA
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id
join roles r ON re.role_id = r.id
where r.role_name like '%Automation%';
--12. Г‚Г»ГўГҐГ±ГІГЁ ГЁГ¬ГҐГ­Г  ГЁ Г§Г Г°ГЇГ«Г ГІГ» Junior Г±ГЇГҐГ¶ГЁГ Г«ГЁГ±ГІГ®Гў
select employee_name, monthly_salary from roles_employee re
left join employees e on re.employee_id = e.id 
left join roles r on re.role_id = r.id
left join employee_salary es on e.id = es.id
left join salary s on es.salary_id = s.id 
where r.role_name like '%Junior%';

--13. Г‚Г»ГўГҐГ±ГІГЁ ГЁГ¬ГҐГ­Г  ГЁ Г§Г Г°ГЇГ«Г ГІГ» Middle Г±ГЇГҐГ¶ГЁГ Г«ГЁГ±ГІГ®Гў
select employee_name, monthly_salary from employee_salary es
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id
left join roles_employee re on es.employee_id = re.employee_id
left join roles on re.role_id = roles.id
where roles.role_name like '%Middle%'

--14. Г‚Г»ГўГҐГ±ГІГЁ ГЁГ¬ГҐГ­Г  ГЁ Г§Г Г°ГЇГ«Г ГІГ» Senior Г±ГЇГҐГ¶ГЁГ Г«ГЁГ±ГІГ®Гў
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id
left join roles r on re.role_id = r.id 
where r.role_name like '%Senior%';

--15. Г‚Г»ГўГҐГ±ГІГЁ Г§Г Г°ГЇГ«Г ГІГ» Java Г°Г Г§Г°Г ГЎГ®ГІГ·ГЁГЄГ®Гў]
select monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id
left join roles r on re.role_id = r.id 
where r.role_name like '%Java%' and r.role_name not like '%JavaScript%';

--16. Г‚Г»ГўГҐГ±ГІГЁ Г§Г Г°ГЇГ«Г ГІГ» Python Г°Г Г§Г°Г ГЎГ®ГІГ·ГЁГЄГ®Гў
select monthly_salary from employee_salary es 
left join salary s on es.salary_id = s.id 
left join employees e on es.employee_id = e.id
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id
where r.role_name like '%Python%';

--17. Г‚Г»ГўГҐГ±ГІГЁ ГЁГ¬ГҐГ­Г  ГЁ Г§Г Г°ГЇГ«Г ГІГ» Junior Python Г°Г Г§Г°Г ГЎГ®ГІГ·ГЁГЄГ®Гў
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id
join roles r on re.role_id = r.id
where r.role_name like '%Junior Python%';

select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Junior Python%';

--18. Г‚Г»ГўГҐГ±ГІГЁ ГЁГ¬ГҐГ­Г  ГЁ Г§Г Г°ГЇГ«Г ГІГ» Middle JS Г°Г Г§Г°Г ГЎГ®ГІГ·ГЁГЄГ®Гў
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Middle JavaScript developer%';

--19. Г‚Г»ГўГҐГ±ГІГЁ ГЁГ¬ГҐГ­Г  ГЁ Г§Г Г°ГЇГ«Г ГІГ» Senior Java Г°Г Г§Г°Г ГЎГ®ГІГ·ГЁГЄГ®Гў
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Senior Java%';

--20. Г‚Г»ГўГҐГ±ГІГЁ Г§Г Г°ГЇГ«Г ГІГ» Junior QA ГЁГ­Г¦ГҐГ­ГҐГ°Г®Гў
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Junior% %QA%';

--21. Г‚Г»ГўГҐГ±ГІГЁ Г±Г°ГҐГ¤Г­ГѕГѕ Г§Г Г°ГЇГ«Г ГІГі ГўГ±ГҐГµ Junior Г±ГЇГҐГ¶ГЁГ Г«ГЁГ±ГІГ®Гў
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Junior%';

--22. Г‚Г»ГўГҐГ±ГІГЁ Г±ГіГ¬Г¬Гі Г§Г Г°ГЇГ«Г ГІ JS Г°Г Г§Г°Г ГЎГ®ГІГ·ГЁГЄГ®Гў
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id
join roles r on re.role_id = r.id
where r.role_name like '%Junior%';
--23. Г‚Г»ГўГҐГ±ГІГЁ Г¬ГЁГ­ГЁГ¬Г Г«ГјГ­ГіГѕ Г‡ГЏ QA ГЁГ­Г¦ГҐГ­ГҐГ°Г®Гў
select min(monthly_salary) from roles_employee re
left join roles r on re.role_id = r.id 
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id 
where role_name like '%QA%';
--24. Г‚Г»ГўГҐГ±ГІГЁ Г¬Г ГЄГ±ГЁГ¬Г Г«ГјГ­ГіГѕ Г‡ГЏ QA ГЁГ­Г¦ГҐГ­ГҐГ°Г®Гў
select max(monthly_salary) from roles_employee re
left join roles r on re.role_id = r.id 
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id 
where role_name like '%QA%';
--25. Г‚Г»ГўГҐГ±ГІГЁ ГЄГ®Г«ГЁГ·ГҐГ±ГІГўГ® QA ГЁГ­Г¦ГҐГ­ГҐГ°Г®Гў
select count(monthly_salary) from roles_employee re
left join roles r on re.role_id = r.id 
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id 
where role_name like '%QA%';
--26. Г‚Г»ГўГҐГ±ГІГЁ ГЄГ®Г«ГЁГ·ГҐГ±ГІГўГ® Middle Г±ГЇГҐГ¶ГЁГ Г«ГЁГ±ГІГ®Гў.
select count(employee_name) from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Middle%';
--27. Г‚Г»ГўГҐГ±ГІГЁ ГЄГ®Г«ГЁГ·ГҐГ±ГІГўГ® Г°Г Г§Г°Г ГЎГ®ГІГ·ГЁГЄГ®Гў
select count(employee_name) from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r on re.role_id = r.id 
where r.role_name like '%developer%';
--28. Г‚Г»ГўГҐГ±ГІГЁ ГґГ®Г­Г¤ (Г±ГіГ¬Г¬Гі) Г§Г Г°ГЇГ«Г ГІГ» Г°Г Г§Г°Г ГЎГ®ГІГ·ГЁГЄГ®Гў.
select sum(monthly_salary) from roles_employee re
left join roles r on re.role_id = r.id 
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id 
where role_name like '%developer%';
--29. Г‚Г»ГўГҐГ±ГІГЁ ГЁГ¬ГҐГ­Г , Г¤Г®Г«Г¦Г­Г®Г±ГІГЁ ГЁ Г‡ГЏ ГўГ±ГҐГµ Г±ГЇГҐГ¶ГЁГ Г«ГЁГ±ГІГ®Гў ГЇГ® ГўГ®Г§Г°Г Г±ГІГ Г­ГЁГѕ
select employee_name, role_name, monthly_salary from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r ON re.role_id = r.id
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id
order by employee_name;
--30. Г‚Г»ГўГҐГ±ГІГЁ ГЁГ¬ГҐГ­Г , Г¤Г®Г«Г¦Г­Г®Г±ГІГЁ ГЁ Г‡ГЏ ГўГ±ГҐГµ Г±ГЇГҐГ¶ГЁГ Г«ГЁГ±ГІГ®Гў ГЇГ® ГўГ®Г§Г°Г Г±ГІГ Г­ГЁГѕ Гі Г±ГЇГҐГ¶ГЁГ Г«ГЁГ±ГІГ®Гў Гі ГЄГ®ГІГ®Г°Г»Гµ Г‡ГЏ Г®ГІ 1700 Г¤Г® 2300
select employee_name, role_name, monthly_salary from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r ON re.role_id = r.id
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id
where monthly_salary between 1700 and 2300
order by employee_name;
--31. Г‚Г»ГўГҐГ±ГІГЁ ГЁГ¬ГҐГ­Г , Г¤Г®Г«Г¦Г­Г®Г±ГІГЁ ГЁ Г‡ГЏ ГўГ±ГҐГµ Г±ГЇГҐГ¶ГЁГ Г«ГЁГ±ГІГ®Гў ГЇГ® ГўГ®Г§Г°Г Г±ГІГ Г­ГЁГѕ Гі Г±ГЇГҐГ¶ГЁГ Г«ГЁГ±ГІГ®Гў Гі ГЄГ®ГІГ®Г°Г»Гµ Г‡ГЏ Г¬ГҐГ­ГјГёГҐ 2300
select employee_name, role_name, monthly_salary from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r ON re.role_id = r.id
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id
where monthly_salary < 2300
order by employee_name;
--32. Г‚Г»ГўГҐГ±ГІГЁ ГЁГ¬ГҐГ­Г , Г¤Г®Г«Г¦Г­Г®Г±ГІГЁ ГЁ Г‡ГЏ ГўГ±ГҐГµ Г±ГЇГҐГ¶ГЁГ Г«ГЁГ±ГІГ®Гў ГЇГ® ГўГ®Г§Г°Г Г±ГІГ Г­ГЁГѕ Гі Г±ГЇГҐГ¶ГЁГ Г«ГЁГ±ГІГ®Гў Гі ГЄГ®ГІГ®Г°Г»Гµ Г‡ГЏ Г°Г ГўГ­Г  1100, 1500, 2000
select employee_name, role_name, monthly_salary from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r ON re.role_id = r.id
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id
where monthly_salary in (1100, 1500, 2000)
order by employee_name;