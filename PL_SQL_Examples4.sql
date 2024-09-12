SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION lease_time(my_stdate DATE, my_enddate DATE) RETURN NUMBER AS
BEGIN
  RETURN round(months_between(my_enddate, my_stdate), 0);
END;
/

SELECT lease_no, stdate, enddate, lease_time(stdate, enddate) FROM lease;

CREATE OR REPLACE FUNCTION lease_time(my_stdate DATE, my_enddate) RETURN NUMBER AS
BEGIN
  RETURN round(months_between(my_enddate, my_stdate), 0);
END;
/