select * from employee;

select * from department;

select * from workerOfDepartment;

select lastname, firstname, departmentName from employee 
inner join workerOfDepartment on employeeNumber=departmentNumber
inner join department on departmentNumber=departmentId;