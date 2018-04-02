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
		case when a.form_cd in ('02', '04', '06', '07', '10', '12') then TO_DATE(b.recu_fr_dt, 'YYYYMMDD')+b.vscn-1
			when a.form_cd in ('03', '05', '08', '09', '11', '13', '20', '21', 'ZZ') and b.in_pat_cors_type in ('11', '21', '31') then TO_DATE(b.recu_fr_dt, 'YYYYMMDD')+b.vscn-1 
			else TO_DATE(a.recu_fr_dt, 'YYYYMMDD')
		end as visit_end_date,
		a.sick_sym,
		case when a.sick_sym=b.main_sick then '44786627' --primary condition
			when a.sick_sym=b.sub_sick then '44786629' --secondary condition
			else '45756845' --third condition
		end as sick_order,
		case when a.sub_sick=a.sick_sym then 'Y' else 'N' end as sub_sick_yn,
		a.ICD_CONCEPT_ID
	from (select b.*,c.sick_sym,n.ICD_CONCEPT_ID from NHIS.NHID_GY20_T1_2002 b inner join NHIS.NHID_GY40_T1_2002 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
	      select b.*,c.sick_sym,n.ICD_CONCEPT_ID from NHIS.NHID_GY20_T1_2003 b inner join NHIS.NHID_GY40_T1_2003 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID from NHIS.NHID_GY20_T1_2004 b inner join NHIS.NHID_GY40_T1_2004 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID from NHIS.NHID_GY20_T1_2005 b inner join NHIS.NHID_GY40_T1_2005 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID from NHIS.NHID_GY20_T1_2006 b inner join NHIS.NHID_GY40_T1_2006 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID from NHIS.NHID_GY20_T1_2007 b inner join NHIS.NHID_GY40_T1_2007 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID from NHIS.NHID_GY20_T1_2008 b inner join NHIS.NHID_GY40_T1_2008 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID from NHIS.NHID_GY20_T1_2009 b inner join NHIS.NHID_GY40_T1_2009 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID from NHIS.NHID_GY20_T1_2010 b inner join NHIS.NHID_GY40_T1_2010 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID from NHIS.NHID_GY20_T1_2011 b inner join NHIS.NHID_GY40_T1_2011 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID from NHIS.NHID_GY20_T1_2012 b inner join NHIS.NHID_GY40_T1_2012 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE union all
		  select b.*,c.sick_sym,n.ICD_CONCEPT_ID from NHIS.NHID_GY20_T1_2013 b inner join NHIS.NHID_GY40_T1_2013 c on b.key_seq=c.key_seq inner join TS_MAP_ICD2SNOMED n on c.sick_sym=n.ICD_CODE 
	     ) a
--		observation_period d --추가
--	and TO_DATE(c.recu_fr_dt, 'YYYYMMDD') between d.observation_period_start_date and d.observation_period_end_date
	)  m	 
;

commit;

/*truncate table condition_occurrence;



insert /*+append*/ into condition_occurrence(
	condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_end_date, 
	condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, condition_source_value, condition_source_concept_id
	)    
select 
	--convert(bigint, convert(varchar, m.master_seq) + convert(varchar, ROW_NUMBER() OVER(partition BY key_seq, seq_no order by concept_id desc))) as condition_occurrence_id,
	--ROW_NUMBER() OVER(partition BY key_seq, seq_no order by concept_id desc) AS rank, m.seq_no,    
	ROWNUM condition_occurrence_id,
	m.person_id as person_id,
	n.SNOMED_CODE as condition_concept_id,
	TO_DATE(m.recu_fr_dt, 'YYYYMMDD') as condition_start_date,
	m.visit_end_date as condition_end_date,
	m.sick_order as condition_type_concept_id,
	null as stop_reason,
	null as provider_id,
	m.key_seq as visit_occurrence_id,
	m.sick_sym as condition_source_value,
	n.ICD_CONCEPT_ID as condition_source_concept_id 
from (
	select
		--a.master_seq, a.person_id, a.key_seq, a.seq_no,
        b.key_seq,
        b.person_id,
        --b.visit_occurrence_id,
		b.recu_fr_dt,
		case when b.form_cd in ('02', '04', '06', '07', '10', '12') then TO_DATE(b.recu_fr_dt, 'YYYYMMDD')+b.vscn-1
			when b.form_cd in ('03', '05', '08', '09', '11', '13', '20', '21', 'ZZ') and b.in_pat_cors_type in ('11', '21', '31') then TO_DATE(b.recu_fr_dt, 'YYYYMMDD')+b.vscn-1 
			else TO_DATE(b.recu_fr_dt, 'YYYYMMDD')
		end as visit_end_date,
		c.sick_sym,
		case when c.sick_sym=b.main_sick then '44786627' --primary condition
			when c.sick_sym=b.sub_sick then '44786629' --secondary condition
			else '45756845' --third condition
		end as sick_order,
		case when b.sub_sick=c.sick_sym then 'Y' else 'N' end as sub_sick_yn
	from NHIS.NHID_GY20_T1_2002 b, NHIS.NHID_GY40_T1_2002 c
--		observation_period d --추가
	where b.key_seq=c.key_seq	
--	and TO_DATE(c.recu_fr_dt, 'YYYYMMDD') between d.observation_period_start_date and d.observation_period_end_date
	)  m, --추가
	 TS_MAP_ICD2SNOMED n
where m.sick_sym=n.ICD_CODE	
;


commit;*/





