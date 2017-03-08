# s1

select e1.Name as Employee 
from Employee as e1 
inner join Employee as e2 
on e1.ManagerId=e2.Id 
where e1.Salary>e2.Salary 


# A faster solution

select E1.Name 
from Employee as E1, Employee as E2 
where E1.ManagerId = E2.Id and E1.Salary > E2.Salary
