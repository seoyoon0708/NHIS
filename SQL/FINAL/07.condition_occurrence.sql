truncate table condition_occurrence;

insert /*+append*/ into condition_occurrence(
	condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_end_date, 
	condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, condition_source_value, condition_source_concept_id
	)    
select 
	--convert(bigint, convert(varchar, m.master_seq) + convert(varchar, ROW_NUMBER() OVER(partition BY key_seq, seq_no order by concept_id desc))) as condition_occurrence_id,
	--ROW_NUMBER() OVER(partition BY key_seq, seq_no order by concept_id desc) AS rank, m.seq_no,    
	ROWNUM condition_occurrence_id,
	m.person_id as person_id,
	m.SNOMED_CODE as condition_concept_id,
	TO_DATE(m.recu_fr_dt, 'YYYYMMDD') as condition_start_date,
	m.visit_end_date as condition_end_date,
	m.sick_order as condition_type_concept_id,
	null as stop_reason,
	null as provider_id,
	m.key_seq as visit_occurrence_id,
	m.sick_sym as condition_source_value,
	m.ICD_CONCEPT_ID as condition_source_concept_id 
from (
	select
		--a.master_seq, a.person_id, a.key_seq, a.seq_no,
        a.key_seq,
        a.person_id,
        --b.visit_occurrence_id,
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
		case when a.sub_sick=a.sick_sym then 'Y' else 'N' end as sub_sick_yn,
		a.ICD_CONCEPT_ID,
        a.SNOMED_CODE
	from (select b.*,c.sick_sym,n.ICD_CONCEPT_ID,n.SNOMED_CODE from NHIS.NHID_GY20_T1_2002 b inner join NHIS.NHID_GY40_T1_2002 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
	      select b.*,c.sick_sym,n.ICD_CONCEPT_ID,n.SNOMED_CODE from NHIS.NHID_GY20_T1_2003 b inner join NHIS.NHID_GY40_T1_2003 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID,n.SNOMED_CODE from NHIS.NHID_GY20_T1_2004 b inner join NHIS.NHID_GY40_T1_2004 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID,n.SNOMED_CODE from NHIS.NHID_GY20_T1_2005 b inner join NHIS.NHID_GY40_T1_2005 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID,n.SNOMED_CODE from NHIS.NHID_GY20_T1_2006 b inner join NHIS.NHID_GY40_T1_2006 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID,n.SNOMED_CODE from NHIS.NHID_GY20_T1_2007 b inner join NHIS.NHID_GY40_T1_2007 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID,n.SNOMED_CODE from NHIS.NHID_GY20_T1_2008 b inner join NHIS.NHID_GY40_T1_2008 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID,n.SNOMED_CODE from NHIS.NHID_GY20_T1_2009 b inner join NHIS.NHID_GY40_T1_2009 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID,n.SNOMED_CODE from NHIS.NHID_GY20_T1_2010 b inner join NHIS.NHID_GY40_T1_2010 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.PERSON_ID,b.KEY_SEQ,b.YKIHO_ID,b.RECU_FR_DT,b.FORM_CD,b.DSBJT_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.OFFC_INJ_TYPE,b.RECN,b.VSCN,b.FST_IN_PAT_DT,b.DMD_TRAMT,b.DMD_SBRDN_AMT,b.DMD_JBRDN_AMT,b.DMD_CT_TOT_AMT,b.DMD_MRI_TOT_AMT,b.EDEC_ADD_RT,b.EDEC_TRAMT,b.EDEC_SBRDN_AMT,b.EDEC_JBRDN_AMT,b.EDEC_CT_TOT_AMT,b.EDEC_MRI_TOT_AMT,b.DMD_DRG_NO,b.TOT_PRES_DD_CNT,c.sick_sym,n.ICD_CONCEPT_ID,n.SNOMED_CODE from NHIS.NHID_GY20_T1_2011 b inner join NHIS.NHID_GY40_T1_2011 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.PERSON_ID,b.KEY_SEQ,b.YKIHO_ID,b.RECU_FR_DT,b.FORM_CD,b.DSBJT_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.OFFC_INJ_TYPE,b.RECN,b.VSCN,b.FST_IN_PAT_DT,b.DMD_TRAMT,b.DMD_SBRDN_AMT,b.DMD_JBRDN_AMT,b.DMD_CT_TOT_AMT,b.DMD_MRI_TOT_AMT,b.EDEC_ADD_RT,b.EDEC_TRAMT,b.EDEC_SBRDN_AMT,b.EDEC_JBRDN_AMT,b.EDEC_CT_TOT_AMT,b.EDEC_MRI_TOT_AMT,b.DMD_DRG_NO,b.TOT_PRES_DD_CNT,c.sick_sym,n.ICD_CONCEPT_ID,n.SNOMED_CODE from NHIS.NHID_GY20_T1_2012 b inner join NHIS.NHID_GY40_T1_2012 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.PERSON_ID,b.KEY_SEQ,b.YKIHO_ID,b.RECU_FR_DT,b.FORM_CD,b.DSBJT_CD,b.MAIN_SICK,b.SUB_SICK,b.IN_PAT_CORS_TYPE,b.OFFC_INJ_TYPE,b.RECN,b.VSCN,b.FST_IN_PAT_DT,b.DMD_TRAMT,b.DMD_SBRDN_AMT,b.DMD_JBRDN_AMT,b.DMD_CT_TOT_AMT,b.DMD_MRI_TOT_AMT,b.EDEC_ADD_RT,b.EDEC_TRAMT,b.EDEC_SBRDN_AMT,b.EDEC_JBRDN_AMT,b.EDEC_CT_TOT_AMT,b.EDEC_MRI_TOT_AMT,b.DMD_DRG_NO,b.TOT_PRES_DD_CNT,c.sick_sym,n.ICD_CONCEPT_ID,n.SNOMED_CODE from NHIS.NHID_GY20_T1_2013 b inner join NHIS.NHID_GY40_T1_2013 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE 
	     ) a
--		observation_period d --추가
--	and TO_DATE(c.recu_fr_dt, 'YYYYMMDD') between d.observation_period_start_date and d.observation_period_end_date
	)  m	 
;
