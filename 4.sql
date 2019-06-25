--------------------------------------------------------
--  DDL for Procedure PAY_SEND
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "pays_u"."PAY_SEND" (ID_S IN NUMBER) AS
BEGIN
--dummy for send 1 pay record
  DBMS_OUTPUT.PUT_LINE( 'SEND ' || TO_CHAR(SYSDATE, 'DL') || TO_CHAR(ID_S) );
END pay_send;

/

--------------------------------------------------------
--  DDL for Procedure FOR_SEND
--------------------------------------------------------

create or replace PROCEDURE          "FOR_SEND" 
-- select for sending per 1 record
AS 
BEGIN
-- status=2 - оплачен 
  FOR rec_row in (SELECT distinct rec_id FROM "pays_u".pays where status=2 ORDER BY dbms_random.random)
  loop
--     "pays_u".PAY_SEND(rec_row.rec_id);

  FOR pay_row in (SELECT id_p FROM "pays_u".pays where status=2 and rec_id=rec_row.rec_id for update skip locked)
  LOOP
     "pays_u".PAY_SEND(pay_row.id_p);
  END LOOP;
  COMMIT;
END LOOP;


END FOR_SEND;

/
create or replace PROCEDURE FOR_SEND1 AS 
-- select for send many records
BEGIN
DECLARE
l_cursor SYS_REFCURSOR;
BEGIN
FOR rec_row in (SELECT distinct rec_id FROM "pays_u".pays where status=2 ORDER BY dbms_random.random)
  LOOP
--     "pays_u".PAY_SEND(rec_row.rec_id);

OPEN l_cursor FOR SELECT id_p FROM "pays_u".pays where status=2 and  "pays_u".pays.rec_id=rec_row.rec_id for update skip locked  ;
"pays_u".pay_send1( l_cursor );
CLOSE l_cursor;
commit;
 END LOOP;
END;
END FOR_SEND1;

/


create or replace PROCEDURE     pay_send1 (p_cursor IN SYS_REFCURSOR)
AS
--dummy for send many record

 id1 NUMBER;
BEGIN
LOOP
     FETCH p_cursor INTO id1;
     EXIT WHEN p_cursor%NOTFOUND;

-- process data as needed
DBMS_OUTPUT.PUT_LINE( 'SENDed ' || TO_CHAR(SYSDATE, 'DL') || TO_CHAR(id1) );
END LOOP;

--CLOSE p_cursor;
END;