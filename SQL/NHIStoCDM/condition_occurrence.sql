
DESC condition_occurrence;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'CONDITION_OCCURRENCE_TMP' ;

CREATE TABLE condition_occurrence_TMP
AS SELECT * FROM CONDITION_OCCURRENCE
WHERE 1=2;

ALTER TABLE CONDITION_OCCURRENCE_TMP DROP CONSTRAINT SYS_C0011787;


insert /*+append*/ into condition_occurrence_TMP(
	condition_occurrence_id,
    person_id, 
    condition_concept_id,
    condition_start_date, 
    condition_end_date, 
	condition_type_concept_id,
    visit_occurrence_id, 
    condition_source_value 
	)    
select 
	ROWNUM condition_occurrence_id,
	m.person_id as person_id,
	n.SNOMED_CODE as condition_concept_id,
	TO_DATE(m.recu_fr_dt, 'YYYYMMDD') as condition_start_date,
	m.visit_end_date as condition_end_date,
	m.sick_order as condition_type_concept_id,
	m.visit_occurrence_id,
	m.sick_sym as condition_source_value
from (
	select
		--a.master_seq, a.person_id, a.key_seq, a.seq_no,
        b.person_id,
        b.visit_occurrence_id,
		b.recu_fr_dt,
		case when b.form_cd in ('02', '04', '06', '07', '10', '12') then TO_DATE(b.recu_fr_dt, 'YYYYMMDD')+b.vscn-1
			when b.form_cd in ('03', '05', '08', '09', '11', '13', '20', '21', 'ZZ') and b.in_pat_cors_type in ('11', '21', '31') then TO_DATE(b.recu_fr_dt, 'YYYYMMDD')+b.vscn-1 
			else TO_DATE(b.recu_fr_dt, 'YYYYMMDD')
		end as visit_end_date,
		c.sick_sym,
		case when c.sick_sym=b.main_sick then 44786627 --primary condition
			when c.sick_sym=b.sub_sick then 44786629 --secondary condition
			else 45756845 --third condition
		end as sick_order
		--case when b.sub_sick=c.sick_sym then 'Y' else 'N' end as sub_sick_yn
	from NHIS.NHIS_20T b, NHIS.NHIS_40T c
--		observation_period d --추가
	where b.key_seq=c.key_seq	
--	and TO_DATE(c.recu_fr_dt, 'YYYYMMDD') between d.observation_period_start_date and d.observation_period_end_date
	)  m, --추가
	 TS_MAP_ICD2SNOMED n
where m.sick_sym=n.ICD_CODE	
;

COMMIT;

create table CONDITION_OCCURRENCE as select * from CONDITION_OCCURRENCE_TMP;

select * from CONDITION_OCCURRENCE WHERE ROWNUM<100;
