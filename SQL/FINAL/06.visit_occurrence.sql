
truncate table visit_occurrence;

insert /*+append*/ into visit_occurrence(visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime,
	visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id,
	visit_source_value, visit_source_concept_id)
select	key_seq                 as visit_occurrence_id,
		person_id 				as person_id,
		case when form_cd in ('02', '04', '06', '07', '10', '12') and in_pat_cors_type in ('11', '21', '31') then 262 --입원 + 응급
			 when form_cd in ('02', '04', '06', '07', '10', '12') and in_pat_cors_type not in ('11', '21', '31') then 9201 --입원 + 입원
			 when form_cd in ('03', '05', '08', '09', '11', '13', '20', '21', 'ZZ') and in_pat_cors_type in ('11', '21', '31') then 9203 --외래 + 응급
			 when form_cd in ('03', '05', '08', '09', '11', '13', '20', '21', 'ZZ') and in_pat_cors_type not in ('11', '21', '31') then 9202 --외래 + 외래
			 else 0
		end 					as visit_concept_id,
		TO_DATE(recu_fr_dt, 'YYYYMMDD') as visit_start_date,
		null 					as visit_start_time,
		case when form_cd in ('02', '04', '06', '07', '10', '12') then TO_DATE(recu_fr_dt, 'YYYYMMDD')+vscn-1 --DATEADD(DAY, vscn-1, convert(date, recu_fr_dt, 112))
			 when form_cd in ('03', '05', '08', '09', '11', '13', '20', '21', 'ZZ') and in_pat_cors_type in ('11', '21', '31') then TO_DATE(recu_fr_dt, 'YYYYMMDD')+vscn-1 -- DATEADD(DAY, vscn-1, convert(date, recu_fr_dt, 112))
			 else TO_DATE(recu_fr_dt, 'YYYYMMDD')
		end 					as visit_end_date,
		null 					as visit_end_time,
		44818517 				as visit_type_concept_id,
		null 					as provider_id,
		ykiho_id 				as care_site_id,
		key_seq 				as visit_source_value,
		null 					as visit_source_concept_id
from (
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHIS.NHID_GY20_T1_2002 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHIS.NHID_GY20_T1_2003 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHIS.NHID_GY20_T1_2004 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHIS.NHID_GY20_T1_2005 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHIS.NHID_GY20_T1_2006 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHIS.NHID_GY20_T1_2007 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHIS.NHID_GY20_T1_2008 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHIS.NHID_GY20_T1_2009 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,cast(null as varchar2(2000))as MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHIS.NHID_GY20_T1_2010 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,                               MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHIS.NHID_GY20_T1_2011 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,                               MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHIS.NHID_GY20_T1_2012 UNION ALL
select PERSON_ID,KEY_SEQ,YKIHO_ID,RECU_FR_DT,FORM_CD,DSBJT_CD,MAIN_SICK,SUB_SICK,IN_PAT_CORS_TYPE,OFFC_INJ_TYPE,RECN,VSCN,FST_IN_PAT_DT,DMD_TRAMT,DMD_SBRDN_AMT,DMD_JBRDN_AMT,DMD_CT_TOT_AMT,DMD_MRI_TOT_AMT,EDEC_ADD_RT,EDEC_TRAMT,EDEC_SBRDN_AMT,EDEC_JBRDN_AMT,EDEC_CT_TOT_AMT,EDEC_MRI_TOT_AMT,DMD_DRG_NO,                               MPRSC_GRANT_NO,TOT_PRES_DD_CNT from NHIS.NHID_GY20_T1_2013)
;   

--119,362,154개 행 이(가) 삽입되었습니다.

commit;

--커밋 완료.

insert into VISIT_OCCURRENCE (
	visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime,
	visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id,
	visit_source_value, visit_source_concept_id
)
select 
	a.master_seq as visit_occurrence_id,
	a.person_id as person_id,
	9202 as visit_concept_id,
	TO_DATE(a.hchk_year||'0101','yyyymmdd') as visit_start_date, --cast(CONVERT(VARCHAR, a.hchk_year+'0101', 23)as date) as visit_start_date,
	null as visit_start_time,
	TO_DATE(a.hchk_year||'0101','yyyymmdd')  as visit_end_date,--cast(CONVERT(VARCHAR, a.hchk_year+'0101', 23)as date) as visit_end_date,
	null as visit_end_time,
	44818517 as visit_type_concept_id,
	null as provider_id,
	null as care_site_id,
	a.master_seq as visit_source_value,
	null as visit_source_concept_id
from NHIS.NHIS_GJ a 
;

--2,210,067개 행 이(가) 삽입되었습니다.

commit;

--커밋 완료.
