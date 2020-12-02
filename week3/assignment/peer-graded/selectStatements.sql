--1
SELECT  DISTINCT City,State,Zip 
FROM Customer



--2 
SELECT EmpName, Department, Phone, Email
FROM Employee
WHERE Phone LIKE '3-%'

--3---
SELECT * 
FROM ResourceTbl
WHERE Rate BETWEEN 10.0 AND 20.0 
ORDER BY Rate


---4----
SELECT EventNo, DateAuth,Status
FROM EventRequest
WHERE Status IN('Approved','Denied')
AND DateAuth BETWEEN '2018-07-01' AND '2018-07-31'


-------5-----------
SELECT Locno, LocName
from Location ,Facility
WHERE Facility.FacName = 'Basketball arena'



-----------6------
SELECT EventPlan.PlanNo, EventPlanLine.LineNo, ResourceTbl.ResNo
FROM EventPlan INNER JOIN EventPlanLine ON (EventPlan.Planno = EventPlanLine.Planno)
	 INNER JOIN ResourceTbl ON(EventPlanLine.ResNo = ResourceTbl.ResNo)

	 
--- 6-----
SELECT EventPlan.PlanNo,Count (EventPlanLine.LineNo) AS Lines, Sum( EventPlanLine.NumberFld) AS ResourcesNum
FROM EventPlan INNER JOIN EventPlanLine ON (EventPlan.Planno = EventPlanLine.Planno)
	 INNER JOIN ResourceTbl ON(EventPlanLine.ResNo = ResourceTbl.ResNo)
	 
GROUP BY(EventPlan.PlanNo)
HAVING (Count (EventPlanLine.LineNo)) >= 1