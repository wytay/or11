-- USER SQL
create USER "pays_u" identified by "45!2353#"
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP"
ACCOUNT UNLOCK ;

-- QUOTAS
ALTER USER "pays_u" QUOTA UNLIMITED ON "SYSTEM";
ALTER USER "pays_u" QUOTA UNLIMITED ON "USERS";

-- ROLES

-- SYSTEM PRIVILEGES

CREATE TABLE "pays_u"."org" 
(
  ID_O NUMBER(9, 0) NOT NULL 
, NAME NVARCHAR2(50) NOT NULL 
, INN NUMBER(12, 0) 
, KPP NUMBER(10, 0) 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

CREATE UNIQUE INDEX "pays_u"."org_INDEX1" ON "pays_u"."org" (NAME ASC) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

CREATE INDEX "pays_u"."org_INDEX2" ON "pays_u"."org" (INN ASC) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

CREATE INDEX "pays_u"."org_INDEX3" ON "pays_u"."org" (KPP ASC) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

CREATE UNIQUE INDEX "pays_u"."org_PK" ON "pays_u"."org" (ID_O ASC) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

ALTER TABLE "pays_u"."org"
ADD CONSTRAINT "orgs_PK" PRIMARY KEY 
(
  ID_O 
)
USING INDEX "pays_u".org_PK
ENABLE;

--------------------------------------------------------
--  File created - �������-����-25-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PAYS
--------------------------------------------------------

  CREATE TABLE "pays_u"."PAYS" 
   (	"ID_P" NUMBER, 
	"CRE_DATE" TIMESTAMP (6), 
	"PAY_DATE" TIMESTAMP (6), 
	"STATUS" NUMBER(4,0), 
	"P_TYPE" NUMBER(4,0), 
	"SUMM" NUMBER(18,2), 
	"AGENT_ID" NUMBER(9,0), 
	"REC_ID" NUMBER(9,0), 
	"SEND_DATE" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PAYS_INDEX6
--------------------------------------------------------

  CREATE INDEX "pays_u"."PAYS_INDEX6" ON "pays_u"."PAYS" ("SEND_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PAYS_INDEX7
--------------------------------------------------------

  CREATE INDEX "pays_u"."PAYS_INDEX7" ON "pays_u"."PAYS" ("P_TYPE", "PAY_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PAYS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "pays_u"."PAYS_PK" ON "pays_u"."PAYS" ("ID_P") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PAYS_INDEX1
--------------------------------------------------------

  CREATE INDEX "pays_u"."PAYS_INDEX1" ON "pays_u"."PAYS" ("CRE_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PAYS_INDEX2
--------------------------------------------------------

  CREATE INDEX "pays_u"."PAYS_INDEX2" ON "pays_u"."PAYS" ("PAY_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PAYS_INDEX3
--------------------------------------------------------

  CREATE INDEX "pays_u"."PAYS_INDEX3" ON "pays_u"."PAYS" ("AGENT_ID", "PAY_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PAYS_INDEX4
--------------------------------------------------------

  CREATE INDEX "pays_u"."PAYS_INDEX4" ON "pays_u"."PAYS" ("REC_ID", "PAY_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PAYS_INDEX5
--------------------------------------------------------

  CREATE INDEX "pays_u"."PAYS_INDEX5" ON "pays_u"."PAYS" ("STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table PAYS
--------------------------------------------------------

  ALTER TABLE "pays_u"."PAYS" ADD CONSTRAINT "PAYS_PK" PRIMARY KEY ("ID_P")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "pays_u"."PAYS" MODIFY ("CRE_DATE" NOT NULL ENABLE);
  ALTER TABLE "pays_u"."PAYS" MODIFY ("ID_P" NOT NULL ENABLE);
  ALTER TABLE "pays_u"."PAYS" MODIFY ("REC_ID" NOT NULL ENABLE);
  ALTER TABLE "pays_u"."PAYS" MODIFY ("AGENT_ID" NOT NULL ENABLE);
  ALTER TABLE "pays_u"."PAYS" MODIFY ("SUMM" NOT NULL ENABLE);
  ALTER TABLE "pays_u"."PAYS" MODIFY ("P_TYPE" NOT NULL ENABLE);
  ALTER TABLE "pays_u"."PAYS" MODIFY ("STATUS" NOT NULL ENABLE);