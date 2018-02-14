INSERT INTO PROCEDURE_OCCURRENCE 
	(procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, 
	modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, 
	procedure_source_concept_id, qualifier_source_value)
SELECT 
	--convert(bigint, convert(varchar, a.master_seq) + convert(varchar, row_number() over (partition by a.key_seq, a.seq_no order by b.concept_id))) as procedure_occurrence_id,
	3000000000+rownum as procedure_occurrence_id,
	a.person_id as person_id,
	a.div_cd, --CASE WHEN b.concept_id IS NOT NULL THEN b.concept_id ELSE 0 END as procedure_concept_id,
	TO_DATE(a.recu_fr_dt, 'YYYYMMDD') as procedure_date,
	45756900 as procedure_type_concept_id,
	NULL as modifier_concept_id,
	TO_NUMBER(a.dd_mqty_exec_freq) * TO_NUMBER(a.mdcn_exec_freq) * TO_NUMBER(a.dd_mqty_freq) as quantity,
	NULL as provider_id,
	a.key_seq as visit_occurrence_id,
	a.div_cd as procedure_source_value,
	null as procedure_source_concept_id,
	null as qualifier_source_value
FROM (SELECt x.key_seq, x.seq_no, x.recu_fr_dt, x.div_cd, 
			case when x.mdcn_exec_freq is not null and REGEXP_INSTR(x.mdcn_exec_freq,'[^0-9]')=0 and TO_NUMBER(x.mdcn_exec_freq) > 0 then TO_NUMBER(x.mdcn_exec_freq) else 1 end as mdcn_exec_freq,
			case when x.dd_mqty_exec_freq is not null and REGEXP_INSTR(x.dd_mqty_exec_freq,'[^0-9]')=0 and TO_NUMBER(x.dd_mqty_exec_freq) > 0 then TO_NUMBER(x.dd_mqty_exec_freq) else 1 end as dd_mqty_exec_freq,
			case when x.dd_mqty_freq is not null and REGEXP_INSTR(x.dd_mqty_freq,'[^0-9]')=0 and TO_NUMBER(x.dd_mqty_freq) > 0 then TO_NUMBER(x.dd_mqty_freq) else 1 end as dd_mqty_freq,
			y.visit_occurrence_id, y.person_id
	   FROM NHIS.NHIS_30T x 
	   inner join NHIS.NHIS_20T y on x.key_seq=y.key_seq
	--	 (select master_seq, key_seq, seq_no, person_id from seq_master where source_table='130') y	WHERE x.key_seq=y.key_seq AND x.seq_no=y.seq_no
	 ) a;
	
	--, procedure_EDI_mapped_20161007 b
--WHERE a.div_cd=b.sourcecode


/**************************************
 4. 60T를 이용하여 데이터 입력
***************************************/
INSERT INTO PROCEDURE_OCCURRENCE 
	(procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_type_concept_id, 
	modifier_concept_id, quantity, provider_id, visit_occurrence_id, procedure_source_value, 
	procedure_source_concept_id, qualifier_source_value)
SELECT 
	--convert(bigint, convert(varchar, a.master_seq) + convert(varchar, row_number() over (partition by a.key_seq, a.seq_no order by b.concept_id))) as procedure_occurrence_id,
	6000000000+rownum as procedure_occurrence_id,
	a.person_id as person_id,
	a.div_cd --CASE WHEN b.concept_id IS NOT NULL THEN b.concept_id ELSE 0 END as procedure_concept_id,
	TO_DATE(a.recu_fr_dt, 'YYYYMMDD') as procedure_date,
	45756900 as procedure_type_concept_id,
	NULL as modifier_concept_id,
	TO_NUMBER(a.dd_mqty_freq) * TO_NUMBER(a.dd_exec_freq) * TO_NUMBER(a.mdcn_exec_freq) as quantity,
	NULL as provider_id,
	a.key_seq as visit_occurrence_id,
	a.div_cd as procedure_source_value,
	null as procedure_source_concept_id,
	null as qualifier_source_value
FROM (SELECt x.key_seq, x.seq_no, x.recu_fr_dt, x.div_cd, 
			case when x.mdcn_exec_freq is not null and REGEXP_INSTR(x.mdcn_exec_freq,'[^0-9]')=0 and TO_NUMBER(x.mdcn_exec_freq) > 0 then TO_NUMBER(x.mdcn_exec_freq) else 1 end as mdcn_exec_freq,
			case when x.dd_exec_freq is not null and REGEXP_INSTR(x.dd_exec_freq,'[^0-9]')=0 and TO_NUMBER(x.dd_exec_freq) > 0 then TO_NUMBER(x.dd_exec_freq) else 1 end as dd_exec_freq,
			case when x.dd_mqty_freq is not null and REGEXP_INSTR(x.dd_mqty_freq,'[^0-9]')=0 and TO_NUMBER(x.dd_mqty_freq) > 0 then TO_NUMBER(x.dd_mqty_freq) else 1 end as dd_mqty_freq,
			y.person_id
	FROM NHIS.NHIS_60T x INNER JOIN NHIS.NHIS_20T y ON x.key_seq=y.key_seq
--		 (select master_seq, key_seq, seq_no, person_id from seq_master where source_table='160') y	WHERE x.key_seq=y.key_seq	AND x.seq_no=y.seq_no) a, @ResultDatabaseSchema.@PROCEDURE_MAPPINGTABLE b WHERE a.div_cd=b.sourcecode

    );
