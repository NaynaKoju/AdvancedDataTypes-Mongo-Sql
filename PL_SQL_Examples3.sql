SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE tenants_full_name (ten_no TENANT.TENANT_NO%TYPE) AS
  my_surname TENANT.T_SURNAME%TYPE;
BEGIN
  SELECT t_surname
  INTO my_surname
  FROM tenant
  WHERE tenant_no = ten_no;
  DBMS_OUTPUT.PUT_LINE('Tenant''s surname: '||my_surname);
END;
/

EXECUTE tenants_full_name(3003);

CREATE OR REPLACE PROCEDURE tenants_full_name (ten_no TENANT.TENANT_NO%TYPE) AS
  my_surname TENANT.T_SURNAME%TYPE;
  my_forenames TENANT.T_FORENAMES%TYPE;
BEGIN
  SELECT t_surname, t_forenames
  INTO my_surname, my_forenames
  FROM tenant
  WHERE tenant_no = ten_no;
  DBMS_OUTPUT.PUT_LINE('Tenant''s name: ' || my_forenames||' '||my_surname);
END;
/

CREATE OR REPLACE PROCEDURE insert2 
  (mycode MODULE.MOD_CODE%TYPE, 
   mydesc MODULE.DESCRIPTION%TYPE, 
   mycred MODULE.CREDITS%TYPE) AS
BEGIN
  INSERT INTO module VALUES(mycode, mydesc, mycred);
  DBMS_OUTPUT.PUT_LINE('Hello');
END;
/

DELETE FROM Module;

DECLARE
  mod_code MODULE.MOD_CODE%TYPE;
  mod_desc MODULE.DESCRIPTION%TYPE;
  mod_cred MODULE.CREDITS%TYPE;
BEGIN
  mod_code := '&Enter_module_code';
  mod_desc := '&Enter_module_description';
  mod_cred := &Enter_module_credits;
  insert2(mod_code, mod_desc, mod_cred);
END;
/

SELECT * FROM module;


