--------------------------------------------------------
--  DDL for Package PAYS_ACTIONS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "pays_u"."PAYS_ACTIONS" AS 
FUNCTION pays_create (	"P_TYPE" NUMBER,	"SUMM" NUMBER,	"AGENT_ID" NUMBER, 	"REC_ID" NUMBER 
) RETURN NUMBER;
  
FUNCTION pays_update (	"ID" NUMBER, 
	"CRE_DATE" TIMESTAMP:= NULL, 
	"PAY_DATE" TIMESTAMP:=NULL, 
	"STATUS" NUMBER:=NULL, 
	"P_TYPE" NUMBER:=NULL, 
	"SUMM" NUMBER:=NULL, 
	"AGENT_ID" NUMBER:=NULL, 
	"REC_ID" NUMBER:=NULL, 
	"SEND_DATE" TIMESTAMP:=NULL
) RETURN NUMBER;

FUNCTION pays_delete (	"ID"  NUMBER ) RETURN NUMBER;
END PAYS_ACTIONS;

/
