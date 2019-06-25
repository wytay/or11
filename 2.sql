--------------------------------------------------------
--  File created - вторник-июня-25-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PAYS_ACTIONS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "pays_u"."PAYS_ACTIONS" AS 
FUNCTION pays_create (	"P_TYPE" IN "pays_u".pays.P_TYPE%TYPE,	"SUMM"  IN "pays_u".pays.SUMM%TYPE,	"AGENT_ID"  IN "pays_u".pays.AGENT_ID%TYPE, 	"REC_ID"  IN "pays_u".pays.REC_ID%TYPE 
) RETURN NUMBER;

FUNCTION pays_update (	"ID_P"  IN "pays_u".pays.ID_P%TYPE, 
	"CRE_DATE"  IN "pays_u".pays.CRE_DATE%TYPE:= NULL, 
	"PAY_DATE"  IN "pays_u".pays.PAY_DATE%TYPE:= NULL,
	"STATUS"  IN "pays_u".pays.STATUS%TYPE:= NULL, 
	"P_TYPE"  IN "pays_u".pays.P_TYPE%TYPE:= NULL,
	"SUMM"  IN "pays_u".pays.SUMM%TYPE,
    "AGENT_ID"  IN "pays_u".pays.AGENT_ID%TYPE,
    "REC_ID"  IN "pays_u".pays.REC_ID%TYPE , 
	"SEND_DATE" IN "pays_u".pays.SEND_DATE%TYPE 
) RETURN NUMBER;

FUNCTION pays_delete (	"ID_P"   IN "pays_u".pays.ID_P%TYPE) RETURN NUMBER;
END PAYS_ACTIONS;

/
