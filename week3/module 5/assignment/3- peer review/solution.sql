--- part 1 --
-- p1
SELECT eventrequest.eventno, dateheld , count(*) As NumberofPlans
FROM eventrequest, eventplan
WHERE eventrequest.eventno = eventplan.eventno 
AND workdate BETWEEN '2018-12-01' AND '2018-12-31'
group by eventrequest.eventno
having count(*)  > 1



-- p2 
-- 
SELECT  planno, eventrequest.eventno, workdate , activity
FROM eventrequest, eventplan,facility
WHERE eventrequest.eventno = eventplan.eventno 
AND   eventrequest.facno  = Facility.facno
AND workdate BETWEEN '2018-12-01' AND '2018-12-31'
AND facname ='Basketball arena'

---
---- p3
---
SELECT   eventrequest.eventno, dateheld , status, estcost
FROM eventrequest, eventplan,facility,employee
WHERE eventrequest.eventno = eventplan.eventno 
AND   eventrequest.facno  = Facility.facno
AND	  eventplan.empno = employee.empno
AND dateheld BETWEEN '2018-10-01' AND '2018-12-31'
AND facname ='Basketball arena'
AND empname = 'Mary Manager'

---
--- p4
SELECT   eventplan.planno, eventplanline.lineno, resname, numberfld as resources_number ,
		 locname,timestart, timeend 
		 
FROM eventplanline, eventplan,facility,location,resourcetbl
WHERE eventplanline.planno = eventplan.planno 
AND   eventplanline.resno  = resourcetbl.resno
AND	  eventplanline.locno = location.locno
AND   location.facno = facility.facno

AND workdate BETWEEN '2018-10-01' AND '2018-12-31'
AND facname ='Basketball arena'
AND activity = 'Operation'


----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
---- part 2 ----
-- p1

INSERT INTO facility
			(Facno, Facname)
	Values( 'F104', 'Swimming Pool')
	
	
	
--- p2

INSERT INTO Location
			(Locno, Facno, locname)
	Values( 'L107','F104', 'Door')
	
	
--p3

INSERT INTO Location
			(Locno, Facno, locname)
	Values( 'L108','F104', 'Locker Room')
	
	
	
	
--- p4
UPDATE Location 
SET locname = 'Gate'
WHERE locaname='Door' AND Facno = 'F104'



----p5
DELETE FROM Location 
WHERE locname='Locker Room' AND Locno = 'L108'


----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
---- part 3 ----

----p1
SELECT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE estaudience > 5000

  AND eventrequest.eventno = eventplan.eventno

  AND eventplan.empno = employee.empno 
  AND eventrequest.facno = facility.facno
  AND facname = 'Football stadium' 
  AND empname = 'Mary Manager'

	--- semantic error - missing join 

---p2

SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, eventplan
WHERE estaudience > 4000
  AND eventplan.eventno = eventrequest.eventno 




--- redundancy   group by clause -   GROUP BY eventrequest.eventno, dateheld, status, estcost--



---p3

SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, facility, eventplan
WHERE estaudience > 5000
  AND eventrequest.facno = facility.facno
  AND eventplan.eventno = eventrequest.eventno 
  AND facname = 'Football stadium' 



----redundancy    --- employee table and condition 



----p4
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, eventplan
WHERE estaudience BETWEEN 5000 AND 10000
  AND eventplan.empno = employee.empno 
  AND eventrequest.eventno = eventplan.eventno
  AND empname = 'Mary Manager'



---- 2 syntax errors    1.ambigious event no , 2.  between  double e 



---p5


SELECT eventplan.planno, lineno, resname, numberfld, timestart, timeend
FROM eventrequest, facility, eventplan, eventplanline, resourcetbl
WHERE eventplan.planno = eventplanline.planno 
AND eventrequest.facno = facility.facno
AND eventplanline.resno = resourcetbl.resno
AND eventrequest.eventno = eventplan.eventno 

AND facname = 'Basketball arena' 
AND estaudience = 10000

















