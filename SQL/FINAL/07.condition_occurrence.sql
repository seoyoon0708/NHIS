create table condition_occurrence_wo_rownum
as
select 
	--ROWNUM condition_occurrence_id,
	m.person_id as person_id,
	nvl(n.SNOMED_CODE,0) as condition_concept_id,
	TO_DATE(m.recu_fr_dt, 'YYYYMMDD') as condition_start_date,
	m.visit_end_date as condition_end_date,
	m.sick_order as condition_type_concept_id,
	cast(null as varchar2(2000)) as stop_reason,
	cast(null as varchar2(2000)) as provider_id,
	m.key_seq as visit_occurrence_id,
	m.sick_sym as condition_source_value,
	n.ICD_CONCEPT_ID as condition_source_concept_id 
from (
	select
        a.key_seq,
        a.person_id,
		a.recu_fr_dt,
		case when a.form_cd in ('02', '04', '06', '07', '10', '12') then TO_DATE(a.recu_fr_dt, 'YYYYMMDD')+a.vscn-1
			when a.form_cd in ('03', '05', '08', '09', '11', '13', '20', '21', 'ZZ') and a.in_pat_cors_type in ('11', '21', '31') then TO_DATE(a.recu_fr_dt, 'YYYYMMDD')+a.vscn-1 
			else TO_DATE(a.recu_fr_dt, 'YYYYMMDD')
		end as visit_end_date,
		a.sick_sym,
		case when a.sick_sym=a.main_sick then '44786627' --primary condition
			when a.sick_sym=a.sub_sick then '44786629' --secondary condition
			else '45756845' --third condition
		end as sick_order,
		case when a.sub_sick=a.sick_sym then 'Y' else 'N' end as sub_sick_yn
	from (select b.PERSON_ID,b.KEY_SEQ,b.RECU_FR_DT,b.FORM_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.VSCN,c.sick_sym from NHIS.NHID_GY20_T1_2002 b inner join NHIS.NHID_GY40_T1_2002 c on b.key_seq=c.key_seq union all
	      select b.PERSON_ID,b.KEY_SEQ,b.RECU_FR_DT,b.FORM_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.VSCN,c.sick_sym from NHIS.NHID_GY20_T1_2003 b inner join NHIS.NHID_GY40_T1_2003 c on b.key_seq=c.key_seq union all
		  select b.PERSON_ID,b.KEY_SEQ,b.RECU_FR_DT,b.FORM_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.VSCN,c.sick_sym from NHIS.NHID_GY20_T1_2004 b inner join NHIS.NHID_GY40_T1_2004 c on b.key_seq=c.key_seq union all
		  select b.PERSON_ID,b.KEY_SEQ,b.RECU_FR_DT,b.FORM_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.VSCN,c.sick_sym from NHIS.NHID_GY20_T1_2005 b inner join NHIS.NHID_GY40_T1_2005 c on b.key_seq=c.key_seq union all
		  select b.PERSON_ID,b.KEY_SEQ,b.RECU_FR_DT,b.FORM_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.VSCN,c.sick_sym from NHIS.NHID_GY20_T1_2006 b inner join NHIS.NHID_GY40_T1_2006 c on b.key_seq=c.key_seq union all
		  select b.PERSON_ID,b.KEY_SEQ,b.RECU_FR_DT,b.FORM_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.VSCN,c.sick_sym from NHIS.NHID_GY20_T1_2007 b inner join NHIS.NHID_GY40_T1_2007 c on b.key_seq=c.key_seq union all
		  select b.PERSON_ID,b.KEY_SEQ,b.RECU_FR_DT,b.FORM_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.VSCN,c.sick_sym from NHIS.NHID_GY20_T1_2008 b inner join NHIS.NHID_GY40_T1_2008 c on b.key_seq=c.key_seq union all
		  select b.PERSON_ID,b.KEY_SEQ,b.RECU_FR_DT,b.FORM_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.VSCN,c.sick_sym from NHIS.NHID_GY20_T1_2009 b inner join NHIS.NHID_GY40_T1_2009 c on b.key_seq=c.key_seq union all
		  select b.PERSON_ID,b.KEY_SEQ,b.RECU_FR_DT,b.FORM_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.VSCN,c.sick_sym from NHIS.NHID_GY20_T1_2010 b inner join NHIS.NHID_GY40_T1_2010 c on b.key_seq=c.key_seq union all
		  select b.PERSON_ID,b.KEY_SEQ,b.RECU_FR_DT,b.FORM_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.VSCN,c.sick_sym from NHIS.NHID_GY20_T1_2011 b inner join NHIS.NHID_GY40_T1_2011 c on b.key_seq=c.key_seq union all
		  select b.PERSON_ID,b.KEY_SEQ,b.RECU_FR_DT,b.FORM_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.VSCN,c.sick_sym from NHIS.NHID_GY20_T1_2012 b inner join NHIS.NHID_GY40_T1_2012 c on b.key_seq=c.key_seq union all
		  select b.PERSON_ID,b.KEY_SEQ,b.RECU_FR_DT,b.FORM_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.VSCN,c.sick_sym from NHIS.NHID_GY20_T1_2013 b inner join NHIS.NHID_GY40_T1_2013 c on b.key_seq=c.key_seq 
	     ) a
	)  m
	left outer join TS_MAP_ICD2SNOMED n on m.sick_sym=n.ICD_CODE
;

CREATE SEQUENCE cond_occurrence_id
START WITH 4000000000
INCREMENT BY 1;

create table condition_occurrence as
(select cond_occurrence_id.nextval as condition_occurrence_id,
        person_id, 
        condition_concept_id, 
        condition_start_date, 
        condition_end_date, 
	condition_type_concept_id, 
        stop_reason, 
        provider_id, 
        visit_occurrence_id, 
        condition_source_value, 
        condition_source_concept_id	
    from condition_occurrence_wo_rownum)
    ;
