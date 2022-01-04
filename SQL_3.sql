select * from employee_salary es;
select * from employees e;
select * from roles_employee re;
select * from roles r;
select * from salary s;
--1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select employee_name, monthly_salary from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary on employee_salary.salary_id = salary.id;
--2. ������� ���� ���������� � ������� �� ������ 2000.
select employee_name, monthly_salary from employee_salary
join employees on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2000;
--3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select monthly_salary from salary s 
left join employee_salary es on s.id = es.salary_id
where es.employee_id is null;
--4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select monthly_salary 
from salary s 
left join employee_salary es 
on s.id = es.salary_id
where es.employee_id is null and s.monthly_salary < 2000;
--5. ����� ���� ���������� ���� �� ��������� ��.
select employee_name from employees
left join employee_salary
on employees.id = employee_salary.employee_id
where employee_salary.salary_id is null;
--6. ������� ���� ���������� � ���������� �� ���������.
select employee_name, role_name from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id;
--7. ������� ����� � ��������� ������ Java �������������.
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id
join roles r on re.role_id = r.id
where r.role_name like '%Java%' and r.role_name not like '%JavaScript%';
--8. ������� ����� � ��������� ������ Python �������������.
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id 
join roles r on re.role_id = r.id 
where r.role_name like '%Python%';
--9. ������� ����� � ��������� ���� QA ���������.
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id 
join roles r on re.role_id = r.id 
where r.role_name like '%QA%';
--10. ������� ����� � ��������� ������ QA ���������.
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id 
join roles r on re.role_id = r.id
where r.role_name like '%Manual%';
--11. ������� ����� � ��������� ��������������� QA
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id
join roles r ON re.role_id = r.id
where r.role_name like '%Automation%';
--12. ������� ����� � �������� Junior ������������
select employee_name, monthly_salary from roles_employee re
left join employees e on re.employee_id = e.id 
left join roles r on re.role_id = r.id
left join employee_salary es on e.id = es.id
left join salary s on es.salary_id = s.id 
where r.role_name like '%Junior%';

--13. ������� ����� � �������� Middle ������������
select employee_name, monthly_salary from employee_salary es
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id
left join roles_employee re on es.employee_id = re.employee_id
left join roles on re.role_id = roles.id
where roles.role_name like '%Middle%'

--14. ������� ����� � �������� Senior ������������
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id
left join roles r on re.role_id = r.id 
where r.role_name like '%Senior%';

--15. ������� �������� Java �������������]
select monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id
left join roles r on re.role_id = r.id 
where r.role_name like '%Java%' and r.role_name not like '%JavaScript%';

--16. ������� �������� Python �������������
select monthly_salary from employee_salary es 
left join salary s on es.salary_id = s.id 
left join employees e on es.employee_id = e.id
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id
where r.role_name like '%Python%';

--17. ������� ����� � �������� Junior Python �������������
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

--18. ������� ����� � �������� Middle JS �������������
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Middle JavaScript developer%';

--19. ������� ����� � �������� Senior Java �������������
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Senior Java%';

--20. ������� �������� Junior QA ���������
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Junior% %QA%';

--21. ������� ������� �������� ���� Junior ������������
select employee_name, monthly_salary from employee_salary es 
left join employees e on es.employee_id = e.id 
left join salary s on es.salary_id = s.id 
left join roles_employee re on es.employee_id = re.employee_id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Junior%';

--22. ������� ����� ������� JS �������������
select employee_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id
join roles r on re.role_id = r.id
where r.role_name like '%Junior%';
--23. ������� ����������� �� QA ���������
select min(monthly_salary) from roles_employee re
left join roles r on re.role_id = r.id 
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id 
where role_name like '%QA%';
--24. ������� ������������ �� QA ���������
select max(monthly_salary) from roles_employee re
left join roles r on re.role_id = r.id 
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id 
where role_name like '%QA%';
--25. ������� ���������� QA ���������
select count(monthly_salary) from roles_employee re
left join roles r on re.role_id = r.id 
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id 
where role_name like '%QA%';
--26. ������� ���������� Middle ������������.
select count(employee_name) from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r on re.role_id = r.id 
where r.role_name like '%Middle%';
--27. ������� ���������� �������������
select count(employee_name) from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r on re.role_id = r.id 
where r.role_name like '%developer%';
--28. ������� ���� (�����) �������� �������������.
select sum(monthly_salary) from roles_employee re
left join roles r on re.role_id = r.id 
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id 
where role_name like '%developer%';
--29. ������� �����, ��������� � �� ���� ������������ �� �����������
select employee_name, role_name, monthly_salary from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r ON re.role_id = r.id
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id
order by employee_name;
--30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select employee_name, role_name, monthly_salary from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r ON re.role_id = r.id
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id
where monthly_salary between 1700 and 2300
order by employee_name;
--31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select employee_name, role_name, monthly_salary from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r ON re.role_id = r.id
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id
where monthly_salary < 2300
order by employee_name;
--32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select employee_name, role_name, monthly_salary from roles_employee re 
left join employees e on re.employee_id = e.id 
left join roles r ON re.role_id = r.id
left join employee_salary es on re.employee_id = es.employee_id 
left join salary s on es.salary_id = s.id
where monthly_salary in (1100, 1500, 2000)
order by employee_name;