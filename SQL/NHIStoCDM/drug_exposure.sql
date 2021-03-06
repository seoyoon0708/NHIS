insert into DRUG_EXPOSURE 
(drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_end_date, 
drug_type_concept_id, stop_reason, refills, quantity, days_supply, 
sig, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number,
provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, 
dose_unit_source_value)
SELECT 3000000000+ROWNUM drug_exposure_id,
	a.person_id as person_id,
	b.concept_id as drug_concept_id,
	TO_DATE(a.recu_fr_dt, 'YYYYMMDD') as drug_exposure_start_date,
	--DATEADD(day, CEILING(convert(float, a.mdcn_exec_freq)/convert(float, a.dd_mqty_exec_freq))-1, convert(date, a.recu_fr_dt, 112)) as drug_exposure_end_date, (수정: 2017.02.17 by 이성원)
	--DATEADD(day, convert(float, a.mdcn_exec_freq)-1, convert(date, a.recu_fr_dt, 112)) as drug_exposure_end_date,
	TO_DATE(a.recu_fr_dt, 'YYYYMMDD')+TO_NUMBER(a.mdcn_exec_freq)-1 as drug_exposure_end_date,
	38000180 as drug_type_concept_id,
	NULL as stop_reason,
	NULL as refills,
	TO_NUMBER(a.dd_mqty_exec_freq) * TO_NUMBER(a.mdcn_exec_freq) * TO_NUMBER(a.dd_mqty_freq) as quantity,
	a.mdcn_exec_freq as days_supply,
	a.clause_cd as sig,
	CASE 
		WHEN a.clause_cd='03' and a.item_cd='01' then 4128794 -- oral
		WHEN a.clause_cd='03' and a.item_cd='02' then 45956875 -- not applicable
		WHEN a.clause_cd='04' and a.item_cd='01' then 4139962 -- Subcutaneous
		WHEN a.clause_cd='04' and a.item_cd='02' then 4112421 -- intravenous
		WHEN a.clause_cd='04' and a.item_cd='03' then 4112421
		ELSE 0
	END as route_concept_id,
	NULL as effective_drug_dose,
	NULL as dose_unit_concept_id,
	NULL as lot_number,
	NULL as provider_id,
	a.key_seq as visit_occurrence_id,
	a.div_cd as drug_source_value,
	null as drug_source_concept_id,
	a.clause_cd||'/'||a.item_cd as route_source_value,
	NULL as dose_unit_source_value
FROM 
	(SELECt x.key_seq, x.seq_no, x.recu_fr_dt, x.div_cd,
			case when x.mdcn_exec_freq is not null and REGEXP_INSTR(x.mdcn_exec_freq,'[^0-9]')=0 and TO_NUMBER(x.mdcn_exec_freq) > 0 then TO_NUMBER(x.mdcn_exec_freq) else 1 end as mdcn_exec_freq,
			case when x.dd_mqty_exec_freq is not null and REGEXP_INSTR(x.dd_mqty_exec_freq,'[^0-9]')=0 and TO_NUMBER(x.dd_mqty_exec_freq) > 0 then TO_NUMBER(x.dd_mqty_exec_freq) else 1 end as dd_mqty_exec_freq,
			case when x.dd_mqty_freq is not null and REGEXP_INSTR(x.dd_mqty_freq,'[^0-9]')=0 and TO_NUMBER(x.dd_mqty_freq) > 0 then cast(x.dd_mqty_freq as float) else 1 end as dd_mqty_freq,
			case when x.clause_cd is not null and len(x.clause_cd) = 1 and REGEXP_INSTR(x.clause_cd,'[^0-9]')=0 and TO_NUMBER(x.clause_cd) between 1 and 9 then '0' || x.clause_cd else x.clause_cd end as clause_cd,
			case when x.item_cd is not null and len(x.item_cd) = 1 and REGEXP_INSTR(x.item_cd,'[^0-9]')=0 and TO_NUMBER(x.item_cd) between 1 and 9 then '0' || x.item_cd else x.item_cd end as item_cd,
			y.master_seq, y.person_id			
	FROM NHIS.NHIS_30T x, 
	     (select master_seq, person_id, key_seq, seq_no from seq_master where source_Table='130') y	WHERE x.key_seq=y.key_seq AND x.seq_no=y.seq_no
	) a, DRUG_MAPPINGTABLE b
where a.div_cd=b.source_code
;


insert into DRUG_EXPOSURE 
(drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_end_date, 
drug_type_concept_id, stop_reason, refills, quantity, days_supply, 
sig, route_concept_id, effective_drug_dose, dose_unit_concept_id, lot_number,
provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, 
dose_unit_source_value)
SELECT --convert(bigint, convert(varchar, a.master_seq) + convert(varchar, row_number() over (partition by a.key_seq, a.seq_no order by b.concept_id))) as drug_exposure_id,
    6000000000+ROWNUM
	a.person_id as person_id,
	b.concept_id as drug_concept_id,
	TO_DATE(a.recu_fr_dt, 'YYYYMMDD') as drug_exposure_start_date,
	-- DATEADD(day, CEILING(convert(float, a.mdcn_exec_freq)/convert(float, a.dd_exec_freq))-1, convert(date, a.recu_fr_dt, 112)) as drug_exposure_end_date, (수정: 2017.02.17 by 이성원)
	--DATEADD(day, convert(float, a.mdcn_exec_freq)-1, convert(date, a.recu_fr_dt, 112)) as drug_exposure_end_date,
	TO_DATE(a.recu_fr_dt, 'YYYYMMDD')+TO_NUMBER(a.mdcn_exec_freq)-1 as drug_exposure_end_date,
	38000177 as drug_type_concept_id,
	NULL as stop_reason,
	NULL as refills,
	--convert(float, a.dd_mqty_freq) * convert(float, a.dd_exec_freq) * convert(float, a.mdcn_exec_freq) as quantity,
	TO_NUMBER(a.dd_mqty_freq)*TO_NUMBER(a.dd_exec_freq) * TO_NUMBER(a.mdcn_exec_freq) *  as quantity,
	a.mdcn_exec_freq as days_supply,
	null as sig,
	null as route_concept_id,
	NULL as effective_drug_dose,
	NULL as dose_unit_concept_id,
	NULL as lot_number,
	NULL as provider_id,
	a.key_seq as visit_occurrence_id,
	a.div_cd as drug_source_value,
	null as drug_source_concept_id,
	null as route_source_value,
	NULL as dose_unit_source_value
FROM 
	(SELECt x.key_seq, x.seq_no, x.recu_fr_dt, x.div_cd,
			case when x.mdcn_exec_freq is not null and REGEXP_INSTR(x.mdcn_exec_freq,'[^0-9]')=0 and TO_NUMBER(x.mdcn_exec_freq) > '0' then TO_NUMBER(x.mdcn_exec_freq) else 1 end as mdcn_exec_freq,
			case when x.dd_mqty_freq is not null and REGEXP_INSTR(x.dd_mqty_freq,'[^0-9]')=0 and TO_NUMBER(x.dd_mqty_freq) > '0' then TO_NUMBER(x.dd_mqty_freq) else 1 end as dd_mqty_freq,
			case when x.dd_exec_freq is not null and REGEXP_INSTR(x.dd_exec_freq,'[^0-9]')=0 and TO_NUMBER(x.dd_exec_freq) > '0' then TO_NUMBER(x.dd_exec_freq) else 1 end as dd_exec_freq,
			y.master_seq, y.person_id			
	FROM @NHISDatabaseSchema.@NHIS_60T x 
	     --(select master_seq, person_id, key_seq, seq_no from seq_master where source_Table='160') y	WHERE x.key_seq=y.key_seq AND x.seq_no=y.seq_no
	) a, DRUG_MAPPINGTABLE b
where a.div_cd=b.source_code
;
