drop sequence seq_client;

drop table client;

create table client(client_id number(6) primary key, 
client_forenames varchar2(20), 
client_surname varchar2(20));

CREATE SEQUENCE seq_client
MINVALUE 10001
START WITH 10001
INCREMENT BY 1
CACHE 10;

INSERT INTO client VALUES(seq_client.nextval, 'Fred', 'Smith');
INSERT INTO client VALUES(seq_client.nextval, 'Jane', 'Stevens');

SELECT * FROM client;

SELECT * 
FROM prop_for_rent
WHERE prop_type = '&property_type';





drop table student;
create student (student_id number(6) , 
student_firstname varchar2(20), 
student_lastname varchar2(20));

CREATE SEQUENCE stud_student
MINVALUE 10001
START WITH 10001
INCREMENT BY 1
CACHE 10;

INSERT INTO student VALUES(stud_student.nextval, 'Nayna', 'Koju');
INSERT INTO student VALUES(stud_student.nextval, 'Esha', 'Prajapati');
commit;

