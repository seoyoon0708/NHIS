/*!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
USE GJ TABLE WITH CAUTION
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*/

/*
10000000000: JK TABLE 					NHIS.NHIS_JK
20000000000: 20TABLE for T1 AND T2 		NHIS.NHIS_20T
50000000000: 20TABLE for T3 			NHIS.NHIS_20T3
30000000000: 30TABLE for T1, T2, T3		NHIS.NHIS_30T
40000000000: 40TABLE for T1, T2, T3		NHIS.NHIS_40T
60000000000: 60TABLE for T1, T2, T3		NHIS.NHIS_60T
80000000000: GJ TABLE 					NHIS.NHIS_GJ
*/

/* 
--- NECESSARY DB FOR EACH TABLE ---
LOCATION: NONE
CARE_SITE: NHIS.NHIS_YK
PERSON: NHIS.NHIS_JK
DEATH: NHIS.NHIS_JK
OBSERVATION_PERIOD: NHIS.NHIS_JK, NHIS.NHIS_20T, NHIS.NHIS_30T, NHIS.NHIS_40T, NHIS.NHIS_60T, NHIS.NHIS_GJ
VISIT_OCCURRENCE: NHIS.NHIS_20T
CONDITION_OCCURRENCE: NHIS.NHIS_20T, NHIS.NHIS_40T
DRUG_EXPOSURE: NHIS.NHIS_30T, NHIS.NHIS_60T
PROCEDURE_EXPOSURE: NHIS.NHIS_30T, NHIS.NHIS_60T
DEVICE_EXPOSURE: NHIS.NHIS_30T, NHIS.NHIS_60T
MEASUREMENT: NHIS.NHIS_GJ
PAYER_PLAN_PERIOD: NHIS.NHIS_JK
COST: USE ALREADY MADE CDM TABLES
OBSERVATION: USE ALREADY MADE CDM TABLES
CONDITION_ERA: NHIS.NHIS_JK, NHIS,NHIS_20T
DRUG_ERA: NHIS.NHIS_JK, NHIS.NHIS_20T, NHIS.NHIS_30T, NHIS.NHIS_60T
*/





/*
--- NEEDED BY ---
	- OBSERVATION PERIOD
	- VISIT_OCCURRENCE
	- CONDITION_OCCURRENCE
	- CONDITION_ERA
	- DRUG_ERA
*/
CREATE TABLE NHIS.NHIS_20T
parallel 8
nologging
pctfree 0
as
select 2000000000+rownum visit_occurrence_id,a.*
from (
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T1_2002 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T1_2003 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T1_2004 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T1_2005 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T1_2006 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T1_2007 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T1_2008 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T1_2009 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T1_2010 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,                               MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T1_2011 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,                               MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T1_2012 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,                               MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T1_2013 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T2_2002 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T2_2003 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T2_2004 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T2_2005 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T2_2006 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T2_2007 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T2_2008 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T2_2009 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T2_2010 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,                               MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T2_2011 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,                               MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T2_2012 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,                               MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T2_2013 
) a ;

CREATE TABLE NHIS.NHIS_20T3
parallel 8
nologging
pctfree 0
as
select 5000000000+rownum visit_occurrence_id,b.*
from (
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,MPRSC_ISSUE_ADMIN_ID,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T3_2002 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,MPRSC_ISSUE_ADMIN_ID,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T3_2003 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,MPRSC_ISSUE_ADMIN_ID,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T3_2004 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,MPRSC_ISSUE_ADMIN_ID,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T3_2005 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,MPRSC_ISSUE_ADMIN_ID,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T3_2006 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,MPRSC_ISSUE_ADMIN_ID,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T3_2007 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,MPRSC_ISSUE_ADMIN_ID,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T3_2008 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,MPRSC_ISSUE_ADMIN_ID,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T3_2009 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,MPRSC_ISSUE_ADMIN_ID,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T3_2010 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,MPRSC_ISSUE_ADMIN_ID,                               MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T3_2011 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,MPRSC_ISSUE_ADMIN_ID,                               MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T3_2012 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,MPRSC_ISSUE_ADMIN_ID,                               MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHID_GY20_T3_2013  
) b ;

/*
--- NEEDED BY ---
	- CARE_SITE
*/
CREATE TABLE NHIS.NHIS_YK
AS
SELECT * FROM NHID_YK_2002 union all
SELECT * FROM NHID_YK_2003 union all
SELECT * FROM NHID_YK_2004 union all
SELECT * FROM NHID_YK_2005 union all
SELECT * FROM NHID_YK_2006 union all
SELECT * FROM NHID_YK_2007 union all
SELECT * FROM NHID_YK_2008 union all
SELECT * FROM NHID_YK_2009 union all
SELECT * FROM NHID_YK_2010 union all
SELECT * FROM NHID_YK_2011 union all
SELECT * FROM NHID_YK_2012 union all
SELECT * FROM NHID_YK_2013 ;


/*
--- NEEDED BY ---
	- PERSON
	- DEATH
	- OBSERVATION_PERIOD
	- PAYER_PLAN_PERIOD
	- CONDITION_ERA
	- DRUG_ERA
*/
CREATE TABLE NHIS.NHIS_JK
parallel 8
nologging
pctfree 0
as
select 1000000000+rownum person_id, j.*
from (
	SELECT * FROM NHID_JK_2002 union all
	SELECT * FROM NHID_JK_2003 union all
	SELECT * FROM NHID_JK_2004 union all
	SELECT * FROM NHID_JK_2005 union all
	SELECT * FROM NHID_JK_2006 union all
	SELECT * FROM NHID_JK_2007 union all
	SELECT * FROM NHID_JK_2008 union all
	SELECT * FROM NHID_JK_2009 union all
	SELECT * FROM NHID_JK_2010 union all
	SELECT * FROM NHID_JK_2011 union all
	SELECT * FROM NHID_JK_2012 union all
	SELECT * FROM NHID_JK_2013  
	) j ;


/*
--- NEEDED BY ---
	- OBSERVATION_PERIOD
	- DRUG_EXPOSURE
	- PROCEDURE_OCCURRENCE
	- DEVICE_EXPOSURE
	- DRUG_ERA
*/
CREATE TABLE NHIS.NHIS_30T
parallel 8
nologging
pctfree 0
as
select 3000000000+rownum drug_exposure_id, t.*
from (
	SELECT * FROM NHID_GY30_T1_2002 UNION ALL
	SELECT * FROM NHID_GY30_T1_2003 UNION ALL
	SELECT * FROM NHID_GY30_T1_2004 UNION ALL
	SELECT * FROM NHID_GY30_T1_2005 UNION ALL
	SELECT * FROM NHID_GY30_T1_2006 UNION ALL
	SELECT * FROM NHID_GY30_T1_2007 UNION ALL
	SELECT * FROM NHID_GY30_T1_2008 UNION ALL
	SELECT * FROM NHID_GY30_T1_2009 UNION ALL
	SELECT * FROM NHID_GY30_T1_2010 UNION ALL
	SELECT * FROM NHID_GY30_T1_2011 UNION ALL
	SELECT * FROM NHID_GY30_T1_2012 UNION ALL
	SELECT * FROM NHID_GY30_T1_2013 UNION ALL
	SELECT * FROM NHID_GY30_T2_2002 UNION ALL
	SELECT * FROM NHID_GY30_T2_2003 UNION ALL
	SELECT * FROM NHID_GY30_T2_2004 UNION ALL
	SELECT * FROM NHID_GY30_T2_2005 UNION ALL
	SELECT * FROM NHID_GY30_T2_2006 UNION ALL
	SELECT * FROM NHID_GY30_T2_2007 UNION ALL
	SELECT * FROM NHID_GY30_T2_2008 UNION ALL
	SELECT * FROM NHID_GY30_T2_2009 UNION ALL
	SELECT * FROM NHID_GY30_T2_2010 UNION ALL
	SELECT * FROM NHID_GY30_T2_2011 UNION ALL
	SELECT * FROM NHID_GY30_T2_2012 UNION ALL
	SELECT * FROM NHID_GY30_T2_2013 UNION ALL
	SELECT * FROM NHID_GY30_T3_2002 UNION ALL
	SELECT * FROM NHID_GY30_T3_2003 UNION ALL
	SELECT * FROM NHID_GY30_T3_2004 UNION ALL
	SELECT * FROM NHID_GY30_T3_2005 UNION ALL
	SELECT * FROM NHID_GY30_T3_2006 UNION ALL
	SELECT * FROM NHID_GY30_T3_2007 UNION ALL
	SELECT * FROM NHID_GY30_T3_2008 UNION ALL
	SELECT * FROM NHID_GY30_T3_2009 UNION ALL
	SELECT * FROM NHID_GY30_T3_2010 UNION ALL
	SELECT * FROM NHID_GY30_T3_2011 UNION ALL
	SELECT * FROM NHID_GY30_T3_2012 UNION ALL
	SELECT * FROM NHID_GY30_T3_2013 
	) t ;

/*
--- NEEDED BY ---
	- OBSERVATION_PERIOD
	- CONDITION_OCCURRENCE
*/
CREATE TABLE NHIS.NHIS_40T
parallel 8
nologging
pctfree 0
as
select 4000000000+rownum person_id, f.*
from (
	SELECT * FROM NHID_GY40_T1_2002 UNION ALL
	SELECT * FROM NHID_GY40_T1_2003 UNION ALL
	SELECT * FROM NHID_GY40_T1_2004 UNION ALL
	SELECT * FROM NHID_GY40_T1_2005 UNION ALL
	SELECT * FROM NHID_GY40_T1_2006 UNION ALL
	SELECT * FROM NHID_GY40_T1_2007 UNION ALL
	SELECT * FROM NHID_GY40_T1_2008 UNION ALL
	SELECT * FROM NHID_GY40_T1_2009 UNION ALL
	SELECT * FROM NHID_GY40_T1_2010 UNION ALL
	SELECT * FROM NHID_GY40_T1_2011 UNION ALL
	SELECT * FROM NHID_GY40_T1_2012 UNION ALL
	SELECT * FROM NHID_GY40_T1_2013 UNION ALL
	SELECT * FROM NHID_GY40_T2_2002 UNION ALL
	SELECT * FROM NHID_GY40_T2_2003 UNION ALL
	SELECT * FROM NHID_GY40_T2_2004 UNION ALL
	SELECT * FROM NHID_GY40_T2_2005 UNION ALL
	SELECT * FROM NHID_GY40_T2_2006 UNION ALL
	SELECT * FROM NHID_GY40_T2_2007 UNION ALL
	SELECT * FROM NHID_GY40_T2_2008 UNION ALL
	SELECT * FROM NHID_GY40_T2_2009 UNION ALL
	SELECT * FROM NHID_GY40_T2_2010 UNION ALL
	SELECT * FROM NHID_GY40_T2_2011 UNION ALL
	SELECT * FROM NHID_GY40_T2_2012 UNION ALL
	SELECT * FROM NHID_GY40_T2_2013 UNION ALL
	SELECT * FROM NHID_GY40_T3_2002 UNION ALL
	SELECT * FROM NHID_GY40_T3_2003 UNION ALL
	SELECT * FROM NHID_GY40_T3_2004 UNION ALL
	SELECT * FROM NHID_GY40_T3_2005 UNION ALL
	SELECT * FROM NHID_GY40_T3_2006 UNION ALL
	SELECT * FROM NHID_GY40_T3_2007 UNION ALL
	SELECT * FROM NHID_GY40_T3_2008 UNION ALL
	SELECT * FROM NHID_GY40_T3_2009 UNION ALL
	SELECT * FROM NHID_GY40_T3_2010 UNION ALL
	SELECT * FROM NHID_GY40_T3_2011 UNION ALL
	SELECT * FROM NHID_GY40_T3_2012 UNION ALL
	SELECT * FROM NHID_GY40_T3_2013 
	) f ;

/*
--- NEEDED BY ---
	- OBSERVATION_PERIOD
	- DRUG_EXPOSURE
	- PROCEDURE_OCCURRENCE
	- DEVICE_EXPOSURE
	- DRUG_ERA
*/
CREATE TABLE NHIS.NHIS_60T
parallel 8
nologging
pctfree 0
as
select 6000000000+rownum drug_exposure_id, s.*
from (
	SELECT * FROM NHID_GY60_T1_2002 UNION ALL
	SELECT * FROM NHID_GY60_T1_2003 UNION ALL
	SELECT * FROM NHID_GY60_T1_2004 UNION ALL
	SELECT * FROM NHID_GY60_T1_2005 UNION ALL
	SELECT * FROM NHID_GY60_T1_2006 UNION ALL
	SELECT * FROM NHID_GY60_T1_2007 UNION ALL
	SELECT * FROM NHID_GY60_T1_2008 UNION ALL
	SELECT * FROM NHID_GY60_T1_2009 UNION ALL
	SELECT * FROM NHID_GY60_T1_2010 UNION ALL
	SELECT * FROM NHID_GY60_T1_2011 UNION ALL
	SELECT * FROM NHID_GY60_T1_2012 UNION ALL
	SELECT * FROM NHID_GY60_T1_2013 UNION ALL
	SELECT * FROM NHID_GY60_T2_2002 UNION ALL
	SELECT * FROM NHID_GY60_T2_2003 UNION ALL
	SELECT * FROM NHID_GY60_T2_2004 UNION ALL
	SELECT * FROM NHID_GY60_T2_2005 UNION ALL
	SELECT * FROM NHID_GY60_T2_2006 UNION ALL
	SELECT * FROM NHID_GY60_T2_2007 UNION ALL
	SELECT * FROM NHID_GY60_T2_2008 UNION ALL
	SELECT * FROM NHID_GY60_T2_2009 UNION ALL
	SELECT * FROM NHID_GY60_T2_2010 UNION ALL
	SELECT * FROM NHID_GY60_T2_2011 UNION ALL
	SELECT * FROM NHID_GY60_T2_2012 UNION ALL
	SELECT * FROM NHID_GY60_T2_2013 UNION ALL
	SELECT * FROM NHID_GY60_T3_2002 UNION ALL
	SELECT * FROM NHID_GY60_T3_2003 UNION ALL
	SELECT * FROM NHID_GY60_T3_2004 UNION ALL
	SELECT * FROM NHID_GY60_T3_2005 UNION ALL
	SELECT * FROM NHID_GY60_T3_2006 UNION ALL
	SELECT * FROM NHID_GY60_T3_2007 UNION ALL
	SELECT * FROM NHID_GY60_T3_2008 UNION ALL
	SELECT * FROM NHID_GY60_T3_2009 UNION ALL
	SELECT * FROM NHID_GY60_T3_2010 UNION ALL
	SELECT * FROM NHID_GY60_T3_2011 UNION ALL
	SELECT * FROM NHID_GY60_T3_2012 UNION ALL
	SELECT * FROM NHID_GY60_T3_2013 
	) s ;

/*
--- NEEDED BY ---
	- OBSERVATION_PERIOD
	- MEASUREMENT
*/
CREATE TABLE NHIS.NHIS_GJ
parallel 8
nologging
pctfree 0
as
select 8000000000+rownum visit_occurrence_id,g.*
from (
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,cast(null as NUMBER(3))as WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,cast(null as NUMBER(3))as TRIGLYCERIDE,cast(null as NUMBER(3))as HDL_CHOLE,cast(null as NUMBER(3))as LDL_CHOLE,HMG,							  GLY_CD,							 OLIG_OCCU_CD,							OLIG_PH,OLIG_PROTE_CD,cast(null as NUMBER(3))as CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,							   HCHK_PMH_CD1,							HCHK_PMH_CD2,							 HCHK_PMH_CD3,							  FMLY_LIVER_DISE_PATIEN_YN,cast(null as varchar2(1)) as HCHK_APOP_PMH_YN,cast(null as varchar2(1)) as HCHK_HDISE_PMH_YN,cast(null as varchar2(1)) as HCHK_HPRTS_PMH_YN,cast(null as varchar2(1)) as HCHK_DIABML_PMH_YN,cast(null as varchar2(1)) as HCHK_HPLPDM_PMH_YN,cast(null as varchar2(1)) as HCHK_PHSS_PMH_YN,cast(null as varchar2(1)) as HCHK_ETCDSE_PMH_YN,FMLY_HPRTS_PATIEN_YN,FMLY_APOP_PATIEN_YN,FMLY_HDISE_PATIEN_YN,FMLY_DIABML_PATIEN_YN,FMLY_CANCER_PATIEN_YN,SMK_STAT_TYPE_RSPS_CD,							  SMK_TERM_RSPS_CD,							   DSQTY_RSPS_CD,DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,							   EXERCI_FREQ_RSPS_CD,cast(null as NUMBER(3)) as PAST_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as PAST_DSQTY_RSPS_CD,cast(null as NUMBER(3)) as CUR_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as CUR_DSQTY_RSPS_CD,cast(null as varchar2(1)) as MOV20_WEK_FREQ_ID,cast(null as varchar2(1)) as MOV30_WEK_FREQ_ID,cast(null as varchar2(1)) as WLK30_WEK_FREQ_ID from NHID_GJ_2002 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,cast(null as NUMBER(3))as WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,cast(null as NUMBER(3))as TRIGLYCERIDE,cast(null as NUMBER(3))as HDL_CHOLE,cast(null as NUMBER(3))as LDL_CHOLE,HMG,							  GLY_CD,							 OLIG_OCCU_CD,							OLIG_PH,OLIG_PROTE_CD,cast(null as NUMBER(3))as CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,							   HCHK_PMH_CD1,							HCHK_PMH_CD2,							 HCHK_PMH_CD3,							  FMLY_LIVER_DISE_PATIEN_YN,cast(null as varchar2(1)) as HCHK_APOP_PMH_YN,cast(null as varchar2(1)) as HCHK_HDISE_PMH_YN,cast(null as varchar2(1)) as HCHK_HPRTS_PMH_YN,cast(null as varchar2(1)) as HCHK_DIABML_PMH_YN,cast(null as varchar2(1)) as HCHK_HPLPDM_PMH_YN,cast(null as varchar2(1)) as HCHK_PHSS_PMH_YN,cast(null as varchar2(1)) as HCHK_ETCDSE_PMH_YN,FMLY_HPRTS_PATIEN_YN,FMLY_APOP_PATIEN_YN,FMLY_HDISE_PATIEN_YN,FMLY_DIABML_PATIEN_YN,FMLY_CANCER_PATIEN_YN,SMK_STAT_TYPE_RSPS_CD,							  SMK_TERM_RSPS_CD,							   DSQTY_RSPS_CD,DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,							   EXERCI_FREQ_RSPS_CD,cast(null as NUMBER(3)) as PAST_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as PAST_DSQTY_RSPS_CD,cast(null as NUMBER(3)) as CUR_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as CUR_DSQTY_RSPS_CD,cast(null as varchar2(1)) as MOV20_WEK_FREQ_ID,cast(null as varchar2(1)) as MOV30_WEK_FREQ_ID,cast(null as varchar2(1)) as WLK30_WEK_FREQ_ID from NHID_GJ_2003 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,cast(null as NUMBER(3))as WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,cast(null as NUMBER(3))as TRIGLYCERIDE,cast(null as NUMBER(3))as HDL_CHOLE,cast(null as NUMBER(3))as LDL_CHOLE,HMG,							  GLY_CD,							 OLIG_OCCU_CD,							OLIG_PH,OLIG_PROTE_CD,cast(null as NUMBER(3))as CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,							   HCHK_PMH_CD1,							HCHK_PMH_CD2,							 HCHK_PMH_CD3,							  FMLY_LIVER_DISE_PATIEN_YN,cast(null as varchar2(1)) as HCHK_APOP_PMH_YN,cast(null as varchar2(1)) as HCHK_HDISE_PMH_YN,cast(null as varchar2(1)) as HCHK_HPRTS_PMH_YN,cast(null as varchar2(1)) as HCHK_DIABML_PMH_YN,cast(null as varchar2(1)) as HCHK_HPLPDM_PMH_YN,cast(null as varchar2(1)) as HCHK_PHSS_PMH_YN,cast(null as varchar2(1)) as HCHK_ETCDSE_PMH_YN,FMLY_HPRTS_PATIEN_YN,FMLY_APOP_PATIEN_YN,FMLY_HDISE_PATIEN_YN,FMLY_DIABML_PATIEN_YN,FMLY_CANCER_PATIEN_YN,SMK_STAT_TYPE_RSPS_CD,							  SMK_TERM_RSPS_CD,							   DSQTY_RSPS_CD,DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,							   EXERCI_FREQ_RSPS_CD,cast(null as NUMBER(3)) as PAST_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as PAST_DSQTY_RSPS_CD,cast(null as NUMBER(3)) as CUR_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as CUR_DSQTY_RSPS_CD,cast(null as varchar2(1)) as MOV20_WEK_FREQ_ID,cast(null as varchar2(1)) as MOV30_WEK_FREQ_ID,cast(null as varchar2(1)) as WLK30_WEK_FREQ_ID from NHID_GJ_2004 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,cast(null as NUMBER(3))as WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,cast(null as NUMBER(3))as TRIGLYCERIDE,cast(null as NUMBER(3))as HDL_CHOLE,cast(null as NUMBER(3))as LDL_CHOLE,HMG,							  GLY_CD,							 OLIG_OCCU_CD,							OLIG_PH,OLIG_PROTE_CD,cast(null as NUMBER(3))as CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,							   HCHK_PMH_CD1,							HCHK_PMH_CD2,							 HCHK_PMH_CD3,							  FMLY_LIVER_DISE_PATIEN_YN,cast(null as varchar2(1)) as HCHK_APOP_PMH_YN,cast(null as varchar2(1)) as HCHK_HDISE_PMH_YN,cast(null as varchar2(1)) as HCHK_HPRTS_PMH_YN,cast(null as varchar2(1)) as HCHK_DIABML_PMH_YN,cast(null as varchar2(1)) as HCHK_HPLPDM_PMH_YN,cast(null as varchar2(1)) as HCHK_PHSS_PMH_YN,cast(null as varchar2(1)) as HCHK_ETCDSE_PMH_YN,FMLY_HPRTS_PATIEN_YN,FMLY_APOP_PATIEN_YN,FMLY_HDISE_PATIEN_YN,FMLY_DIABML_PATIEN_YN,FMLY_CANCER_PATIEN_YN,SMK_STAT_TYPE_RSPS_CD,							  SMK_TERM_RSPS_CD,							   DSQTY_RSPS_CD,DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,							   EXERCI_FREQ_RSPS_CD,cast(null as NUMBER(3)) as PAST_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as PAST_DSQTY_RSPS_CD,cast(null as NUMBER(3)) as CUR_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as CUR_DSQTY_RSPS_CD,cast(null as varchar2(1)) as MOV20_WEK_FREQ_ID,cast(null as varchar2(1)) as MOV30_WEK_FREQ_ID,cast(null as varchar2(1)) as WLK30_WEK_FREQ_ID from NHID_GJ_2005 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,cast(null as NUMBER(3))as WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,cast(null as NUMBER(3))as TRIGLYCERIDE,cast(null as NUMBER(3))as HDL_CHOLE,cast(null as NUMBER(3))as LDL_CHOLE,HMG,							  GLY_CD,							 OLIG_OCCU_CD,							OLIG_PH,OLIG_PROTE_CD,cast(null as NUMBER(3))as CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,							   HCHK_PMH_CD1,							HCHK_PMH_CD2,							 HCHK_PMH_CD3,							  FMLY_LIVER_DISE_PATIEN_YN,cast(null as varchar2(1)) as HCHK_APOP_PMH_YN,cast(null as varchar2(1)) as HCHK_HDISE_PMH_YN,cast(null as varchar2(1)) as HCHK_HPRTS_PMH_YN,cast(null as varchar2(1)) as HCHK_DIABML_PMH_YN,cast(null as varchar2(1)) as HCHK_HPLPDM_PMH_YN,cast(null as varchar2(1)) as HCHK_PHSS_PMH_YN,cast(null as varchar2(1)) as HCHK_ETCDSE_PMH_YN,FMLY_HPRTS_PATIEN_YN,FMLY_APOP_PATIEN_YN,FMLY_HDISE_PATIEN_YN,FMLY_DIABML_PATIEN_YN,FMLY_CANCER_PATIEN_YN,SMK_STAT_TYPE_RSPS_CD,							  SMK_TERM_RSPS_CD,							   DSQTY_RSPS_CD,DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,							   EXERCI_FREQ_RSPS_CD,cast(null as NUMBER(3)) as PAST_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as PAST_DSQTY_RSPS_CD,cast(null as NUMBER(3)) as CUR_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as CUR_DSQTY_RSPS_CD,cast(null as varchar2(1)) as MOV20_WEK_FREQ_ID,cast(null as varchar2(1)) as MOV30_WEK_FREQ_ID,cast(null as varchar2(1)) as WLK30_WEK_FREQ_ID from NHID_GJ_2006 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,cast(null as NUMBER(3))as WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,cast(null as NUMBER(3))as TRIGLYCERIDE,cast(null as NUMBER(3))as HDL_CHOLE,cast(null as NUMBER(3))as LDL_CHOLE,HMG,							  GLY_CD,							 OLIG_OCCU_CD,							OLIG_PH,OLIG_PROTE_CD,cast(null as NUMBER(3))as CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,							   HCHK_PMH_CD1,							HCHK_PMH_CD2,							 HCHK_PMH_CD3,							  FMLY_LIVER_DISE_PATIEN_YN,cast(null as varchar2(1)) as HCHK_APOP_PMH_YN,cast(null as varchar2(1)) as HCHK_HDISE_PMH_YN,cast(null as varchar2(1)) as HCHK_HPRTS_PMH_YN,cast(null as varchar2(1)) as HCHK_DIABML_PMH_YN,cast(null as varchar2(1)) as HCHK_HPLPDM_PMH_YN,cast(null as varchar2(1)) as HCHK_PHSS_PMH_YN,cast(null as varchar2(1)) as HCHK_ETCDSE_PMH_YN,FMLY_HPRTS_PATIEN_YN,FMLY_APOP_PATIEN_YN,FMLY_HDISE_PATIEN_YN,FMLY_DIABML_PATIEN_YN,FMLY_CANCER_PATIEN_YN,SMK_STAT_TYPE_RSPS_CD,							  SMK_TERM_RSPS_CD,							   DSQTY_RSPS_CD,DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,							   EXERCI_FREQ_RSPS_CD,cast(null as NUMBER(3)) as PAST_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as PAST_DSQTY_RSPS_CD,cast(null as NUMBER(3)) as CUR_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as CUR_DSQTY_RSPS_CD,cast(null as varchar2(1)) as MOV20_WEK_FREQ_ID,cast(null as varchar2(1)) as MOV30_WEK_FREQ_ID,cast(null as varchar2(1)) as WLK30_WEK_FREQ_ID from NHID_GJ_2007 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT, 						  WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,  						 TRIGLYCERIDE,							HDL_CHOLE,							LDL_CHOLE,HMG,							  GLY_CD,							 OLIG_OCCU_CD,							OLIG_PH,OLIG_PROTE_CD,						    CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,							   HCHK_PMH_CD1,							HCHK_PMH_CD2,							 HCHK_PMH_CD3,							  FMLY_LIVER_DISE_PATIEN_YN,cast(null as varchar2(1)) as HCHK_APOP_PMH_YN,cast(null as varchar2(1)) as HCHK_HDISE_PMH_YN,cast(null as varchar2(1)) as HCHK_HPRTS_PMH_YN,cast(null as varchar2(1)) as HCHK_DIABML_PMH_YN,cast(null as varchar2(1)) as HCHK_HPLPDM_PMH_YN,cast(null as varchar2(1)) as HCHK_PHSS_PMH_YN,cast(null as varchar2(1)) as HCHK_ETCDSE_PMH_YN,FMLY_HPRTS_PATIEN_YN,FMLY_APOP_PATIEN_YN,FMLY_HDISE_PATIEN_YN,FMLY_DIABML_PATIEN_YN,FMLY_CANCER_PATIEN_YN,SMK_STAT_TYPE_RSPS_CD,							  SMK_TERM_RSPS_CD,							   DSQTY_RSPS_CD,DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,							   EXERCI_FREQ_RSPS_CD,cast(null as NUMBER(3)) as PAST_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as PAST_DSQTY_RSPS_CD,cast(null as NUMBER(3)) as CUR_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as CUR_DSQTY_RSPS_CD,cast(null as varchar2(1)) as MOV20_WEK_FREQ_ID,cast(null as varchar2(1)) as MOV30_WEK_FREQ_ID,cast(null as varchar2(1)) as WLK30_WEK_FREQ_ID from NHID_GJ_2008 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,						  WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,							 TRIGLYCERIDE,							HDL_CHOLE,							LDL_CHOLE,HMG,cast(null as varchar2(1))as GLY_CD,cast(null as varchar2(1))as OLIG_OCCU_CD,cast(null as NUMBER(3))as OLIG_PH,OLIG_PROTE_CD,							CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,cast(null as varchar2(1))as HCHK_PMH_CD1,cast(null as varchar2(1))as HCHK_PMH_CD2,cast(null as varchar2(1))as HCHK_PMH_CD3,cast(null as varchar2(1))as FMLY_LIVER_DISE_PATIEN_YN,							 HCHK_APOP_PMH_YN,							   HCHK_HDISE_PMH_YN,							  HCHK_HPRTS_PMH_YN,							 HCHK_DIABML_PMH_YN,							 HCHK_HPLPDM_PMH_YN,							 HCHK_PHSS_PMH_YN,							   HCHK_ETCDSE_PMH_YN,FMLY_HPRTS_PATIEN_YN,FMLY_APOP_PATIEN_YN,FMLY_HDISE_PATIEN_YN,FMLY_DIABML_PATIEN_YN,FMLY_CANCER_PATIEN_YN,SMK_STAT_TYPE_RSPS_CD,cast(null as varchar2(1))as SMK_TERM_RSPS_CD,cast(null as varchar2(1))as DSQTY_RSPS_CD,DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,cast(null as varchar2(1))as EXERCI_FREQ_RSPS_CD,							  PAST_SMK_TERM_RSPS_CD,       					   PAST_DSQTY_RSPS_CD,							 CUR_SMK_TERM_RSPS_CD,							 CUR_DSQTY_RSPS_CD,								MOV20_WEK_FREQ_ID,							 MOV30_WEK_FREQ_ID,								WLK30_WEK_FREQ_ID from NHID_GJ_2009 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,						  WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,							 TRIGLYCERIDE,							HDL_CHOLE,							LDL_CHOLE,HMG,cast(null as varchar2(1))as GLY_CD,cast(null as varchar2(1))as OLIG_OCCU_CD,cast(null as NUMBER(3))as OLIG_PH,OLIG_PROTE_CD,							CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,cast(null as varchar2(1))as HCHK_PMH_CD1,cast(null as varchar2(1))as HCHK_PMH_CD2,cast(null as varchar2(1))as HCHK_PMH_CD3,cast(null as varchar2(1))as FMLY_LIVER_DISE_PATIEN_YN,							 HCHK_APOP_PMH_YN,							   HCHK_HDISE_PMH_YN,							  HCHK_HPRTS_PMH_YN,							 HCHK_DIABML_PMH_YN,							 HCHK_HPLPDM_PMH_YN,							 HCHK_PHSS_PMH_YN,							   HCHK_ETCDSE_PMH_YN,FMLY_HPRTS_PATIEN_YN,FMLY_APOP_PATIEN_YN,FMLY_HDISE_PATIEN_YN,FMLY_DIABML_PATIEN_YN,FMLY_CANCER_PATIEN_YN,SMK_STAT_TYPE_RSPS_CD,cast(null as varchar2(1))as SMK_TERM_RSPS_CD,cast(null as varchar2(1))as DSQTY_RSPS_CD,DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,cast(null as varchar2(1))as EXERCI_FREQ_RSPS_CD,							  PAST_SMK_TERM_RSPS_CD,       					   PAST_DSQTY_RSPS_CD,							 CUR_SMK_TERM_RSPS_CD,							 CUR_DSQTY_RSPS_CD,								MOV20_WEK_FREQ_ID,							 MOV30_WEK_FREQ_ID,								WLK30_WEK_FREQ_ID from NHID_GJ_2010 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,						  WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,							 TRIGLYCERIDE,							HDL_CHOLE,							LDL_CHOLE,HMG,cast(null as varchar2(1))as GLY_CD,cast(null as varchar2(1))as OLIG_OCCU_CD,cast(null as NUMBER(3))as OLIG_PH,OLIG_PROTE_CD,							CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,cast(null as varchar2(1))as HCHK_PMH_CD1,cast(null as varchar2(1))as HCHK_PMH_CD2,cast(null as varchar2(1))as HCHK_PMH_CD3,cast(null as varchar2(1))as FMLY_LIVER_DISE_PATIEN_YN,							 HCHK_APOP_PMH_YN,							   HCHK_HDISE_PMH_YN,							  HCHK_HPRTS_PMH_YN,							 HCHK_DIABML_PMH_YN,							 HCHK_HPLPDM_PMH_YN,							 HCHK_PHSS_PMH_YN,							   HCHK_ETCDSE_PMH_YN,FMLY_HPRTS_PATIEN_YN,FMLY_APOP_PATIEN_YN,FMLY_HDISE_PATIEN_YN,FMLY_DIABML_PATIEN_YN,FMLY_CANCER_PATIEN_YN,SMK_STAT_TYPE_RSPS_CD,cast(null as varchar2(1))as SMK_TERM_RSPS_CD,cast(null as varchar2(1))as DSQTY_RSPS_CD,DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,cast(null as varchar2(1))as EXERCI_FREQ_RSPS_CD,							  PAST_SMK_TERM_RSPS_CD,       					   PAST_DSQTY_RSPS_CD,							 CUR_SMK_TERM_RSPS_CD,							 CUR_DSQTY_RSPS_CD,								MOV20_WEK_FREQ_ID,							 MOV30_WEK_FREQ_ID,								WLK30_WEK_FREQ_ID from NHID_GJ_2011 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,						  WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,							 TRIGLYCERIDE,							HDL_CHOLE,							LDL_CHOLE,HMG,cast(null as varchar2(1))as GLY_CD,cast(null as varchar2(1))as OLIG_OCCU_CD,cast(null as NUMBER(3))as OLIG_PH,OLIG_PROTE_CD,							CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,cast(null as varchar2(1))as HCHK_PMH_CD1,cast(null as varchar2(1))as HCHK_PMH_CD2,cast(null as varchar2(1))as HCHK_PMH_CD3,cast(null as varchar2(1))as FMLY_LIVER_DISE_PATIEN_YN,							 HCHK_APOP_PMH_YN,							   HCHK_HDISE_PMH_YN,							  HCHK_HPRTS_PMH_YN,							 HCHK_DIABML_PMH_YN,							 HCHK_HPLPDM_PMH_YN,							 HCHK_PHSS_PMH_YN,							   HCHK_ETCDSE_PMH_YN,FMLY_HPRTS_PATIEN_YN,FMLY_APOP_PATIEN_YN,FMLY_HDISE_PATIEN_YN,FMLY_DIABML_PATIEN_YN,FMLY_CANCER_PATIEN_YN,SMK_STAT_TYPE_RSPS_CD,cast(null as varchar2(1))as SMK_TERM_RSPS_CD,cast(null as varchar2(1))as DSQTY_RSPS_CD,DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,cast(null as varchar2(1))as EXERCI_FREQ_RSPS_CD,							  PAST_SMK_TERM_RSPS_CD,       					   PAST_DSQTY_RSPS_CD,							 CUR_SMK_TERM_RSPS_CD,							 CUR_DSQTY_RSPS_CD,								MOV20_WEK_FREQ_ID,							 MOV30_WEK_FREQ_ID,								WLK30_WEK_FREQ_ID from NHID_GJ_2012 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,						  WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,							 TRIGLYCERIDE,							HDL_CHOLE,							LDL_CHOLE,HMG,cast(null as varchar2(1))as GLY_CD,cast(null as varchar2(1))as OLIG_OCCU_CD,cast(null as NUMBER(3))as OLIG_PH,OLIG_PROTE_CD,							CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,cast(null as varchar2(1))as HCHK_PMH_CD1,cast(null as varchar2(1))as HCHK_PMH_CD2,cast(null as varchar2(1))as HCHK_PMH_CD3,cast(null as varchar2(1))as FMLY_LIVER_DISE_PATIEN_YN,							 HCHK_APOP_PMH_YN,							   HCHK_HDISE_PMH_YN,							  HCHK_HPRTS_PMH_YN,							 HCHK_DIABML_PMH_YN,							 HCHK_HPLPDM_PMH_YN,							 HCHK_PHSS_PMH_YN,							   HCHK_ETCDSE_PMH_YN,FMLY_HPRTS_PATIEN_YN,FMLY_APOP_PATIEN_YN,FMLY_HDISE_PATIEN_YN,FMLY_DIABML_PATIEN_YN,FMLY_CANCER_PATIEN_YN,SMK_STAT_TYPE_RSPS_CD,cast(null as varchar2(1))as SMK_TERM_RSPS_CD,cast(null as varchar2(1))as DSQTY_RSPS_CD,DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,cast(null as varchar2(1))as EXERCI_FREQ_RSPS_CD,							  PAST_SMK_TERM_RSPS_CD,       					   PAST_DSQTY_RSPS_CD,							 CUR_SMK_TERM_RSPS_CD,							 CUR_DSQTY_RSPS_CD,								MOV20_WEK_FREQ_ID,							 MOV30_WEK_FREQ_ID,								WLK30_WEK_FREQ_ID from NHID_GJ_2013

) g ;  
