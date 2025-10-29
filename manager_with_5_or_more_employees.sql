SELECT e1.name
FROM Employee e1
JOIN Employee e2
    ON e1.id = e2.managerId
GROUP BY e1.id
HAVING COUNT(e2.id) >= 5;

/*
------------------------------------------------------------
Query: Find Managers with Five or More Employees
------------------------------------------------------------
Description:
This SQL query retrieves the names of managers who supervise
five or more employees. It achieves this without using any JOINs.

Logic:
1. The subquery groups employees by their managerId.
2. The HAVING clause filters only those managers who have
   five or more employees.
3. The outer query retrieves the names of those managers
   whose IDs match the filtered managerIds.

Table Used:
- Employee (contains columns like id, name, and managerId)

------------------------------------------------------------
Code:
------------------------------------------------------------
SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId
    FROM Employee e1
    GROUP BY managerId
    HAVING COUNT(id) >= 5
);
------------------------------------------------------------
*/
