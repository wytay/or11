--------------------------------------------------------
--  DDL for Procedure PAY_SEND
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "pays_u"."PAY_SEND" (ID_S IN NUMBER) AS
BEGIN
-- display the current system date in long format
  DBMS_OUTPUT.PUT_LINE( 'SEND ' || TO_CHAR(SYSDATE, 'DL') || TO_CHAR(ID_S) );
END pay_send;

/

--------------------------------------------------------
--  DDL for Procedure FOR_SEND
--------------------------------------------------------

create or replace PROCEDURE          "FOR_SEND" 
--(
--  NUM_4_SEND IN NUMBER DEFAULT 1000 
--)
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