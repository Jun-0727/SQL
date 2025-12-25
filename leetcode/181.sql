/* Employees Earning More Than Their Managers */

WITH EmployeeDetail AS (
    SELECT E.id, E.name, E.salary, M.salary as managerSalary
    FROM EMPLOYEE E
        JOIN EMPLOYEE M
        ON E.managerId = M.id
)

SELECT name as Employee
FROM EmployeeDetail
WHERE salary > managerSalary