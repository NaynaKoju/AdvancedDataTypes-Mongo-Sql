SET SERVEROUTPUT ON;
SET SERVEROUTPUT OFF;

DECLARE
  surname	 VARCHAR2(10);
  n1		 NUMBER := 23.4567;
  joindate   DATE;
  endate	 DATE := '28-JAN-1995';
  pi         CONSTANT NUMBER := 3.1415926;
  my_surname TENANT.T_SURNAME%TYPE;
BEGIN
  SELECT t_surname
  INTO my_surname
  FROM tenant
  WHERE tenant_no = &enter_tenant_no;
  DBMS_OUTPUT.PUT_LINE('Tenant''s surname: '||my_surname);
  END;
/

DECLARE
		too_old EXCEPTION;
BEGIN
		IF &what_is_your_age > 55 THEN
			RAISE too_old;
		END IF;
EXCEPTION
		WHEN too_old THEN
			DBMS_OUTPUT.PUT_LINE('You are past it!');
END;
/

DECLARE
  my_surname TENANT.T_SURNAME%TYPE;
BEGIN
  SELECT t_surname
  INTO my_surname
  FROM tenant
  WHERE tenant_no = &enter_tenant_no;
  DBMS_OUTPUT.PUT_LINE('Tenant''s surname: '||my_surname);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No tenant with that number');
END;
/