CREATE TABLE TS_MAP_ATCTORXNORM
AS
select CONCEPT_ID_1                 AS ATC_CONCEPT_ID
      ,CONCEPT_ID_1_CONCEPT_CODE    AS ATC_CODE
      ,CONCEPT_ID_1_NAME            AS ATC_CONCEPT_NAME
      ,CONCEPT_ID_2                 AS RxNorm_CONCEPT_ID
      ,CONCEPT_ID_2_CONCEPT_CODE    AS RxNorm_CONCEPT_CODE
      ,CONCEPT_ID_2_NAME            AS RxNorm_CONCEPT_NAME      
  from ATCTORXNORM
;

create table TS_MAP_EDITOATC
as
select PRODUCT_CODE     AS EDI_CODE
      ,ATC_CODE         AS ATC_CODE
  from (
select A.*, row_number() over (partition by product_code order by ATC_CODE asc) RN
  from EDITOATC A
) where RN=1;


TRUNCATE TABLE DRUG_EXPOSURE;

insert /*+append*/ into DRUG_EXPOSURE 
(drug_exposure_id
, person_id
, drug_concept_id
, drug_exposure_start_date
, drug_exposure_end_date
, drug_type_concept_id
, stop_reason
, refills
, quantity
, days_supply
, sig
, route_concept_id
, lot_number
, provider_id
, visit_occurrence_id
, drug_source_value
, drug_source_concept_id
, route_source_value
, dose_unit_source_value)
SELECT 3000000000+ROWNUM drug_exposure_id,
	a.person_id as person_id,
	a.concept_id as drug_concept_id,
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
	NULL as lot_number,
	NULL as provider_id,
	a.key_seq as visit_occurrence_id,
	a.div_cd as drug_source_value,
	null as drug_source_concept_id,
	a.clause_cd||'/'||a.item_cd as route_source_value,
	NULL as dose_unit_source_value
FROM (SELECt x.key_seq, x.seq_no, x.recu_fr_dt, x.div_cd,
			case when x.mdcn_exec_freq is not null and REGEXP_INSTR(x.mdcn_exec_freq,'[^0-9]')=0 and TO_NUMBER(x.mdcn_exec_freq) > 0 then TO_NUMBER(x.mdcn_exec_freq) else 1 end as mdcn_exec_freq,
			case when x.dd_mqty_exec_freq is not null and REGEXP_INSTR(x.dd_mqty_exec_freq,'[^0-9]')=0 and TO_NUMBER(x.dd_mqty_exec_freq) > 0 then TO_NUMBER(x.dd_mqty_exec_freq) else 1 end as dd_mqty_exec_freq,
			case when x.dd_mqty_freq is not null and REGEXP_INSTR(x.dd_mqty_freq,'[^0-9]')=0 and TO_NUMBER(x.dd_mqty_freq) > 0 then cast(x.dd_mqty_freq as float) else 1 end as dd_mqty_freq,
			case when x.clause_cd is not null and length(x.clause_cd) = 1 and REGEXP_INSTR(x.clause_cd,'[^0-9]')=0 and TO_NUMBER(x.clause_cd) between 1 and 9 then '0' || x.clause_cd else x.clause_cd end as clause_cd,
			case when x.item_cd is not null and length(x.item_cd) = 1 and REGEXP_INSTR(x.item_cd,'[^0-9]')=0 and TO_NUMBER(x.item_cd) between 1 and 9 then '0' || x.item_cd else x.item_cd end as item_cd,
			person_id, 
			COALESCE(X.RXNORM_CONCEPT_ID,0) as concept_id   
FROM (
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2002 a inner join NHIS.NHID_GY30_T1_2002 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE LEFT join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2003 a inner join NHIS.NHID_GY30_T1_2003 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE LEFT join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2004 a inner join NHIS.NHID_GY30_T1_2004 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE LEFT join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2005 a inner join NHIS.NHID_GY30_T1_2005 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE LEFT join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2006 a inner join NHIS.NHID_GY30_T1_2006 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE LEFT join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2007 a inner join NHIS.NHID_GY30_T1_2007 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE LEFT join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2008 a inner join NHIS.NHID_GY30_T1_2008 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE LEFT join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2009 a inner join NHIS.NHID_GY30_T1_2009 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE LEFT join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2010 a inner join NHIS.NHID_GY30_T1_2010 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE LEFT join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2011 a inner join NHIS.NHID_GY30_T1_2011 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE LEFT join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2012 a inner join NHIS.NHID_GY30_T1_2012 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE LEFT join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2013 a inner join NHIS.NHID_GY30_T1_2013 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE LEFT join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE
) x
) a
;

commit;



insert /*+append*/ into DRUG_EXPOSURE 
(drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_end_date, 
drug_type_concept_id, stop_reason, refills, quantity, days_supply, 
sig, route_concept_id,   lot_number,
provider_id, visit_occurrence_id, drug_source_value, drug_source_concept_id, route_source_value, 
dose_unit_source_value)
SELECT --convert(bigint, convert(varchar, a.master_seq) + convert(varchar, row_number() over (partition by a.key_seq, a.seq_no order by b.concept_id))) as drug_exposure_id,
    6000000000+ROWNUM,
	a.person_id as person_id,
	a.concept_id as drug_concept_id,
	TO_DATE(a.recu_fr_dt, 'YYYYMMDD') as drug_exposure_start_date,
	-- DATEADD(day, CEILING(convert(float, a.mdcn_exec_freq)/convert(float, a.dd_exec_freq))-1, convert(date, a.recu_fr_dt, 112)) as drug_exposure_end_date, (수정: 2017.02.17 by 이성원)
	--DATEADD(day, convert(float, a.mdcn_exec_freq)-1, convert(date, a.recu_fr_dt, 112)) as drug_exposure_end_date,
	TO_DATE(a.recu_fr_dt, 'YYYYMMDD')+TO_NUMBER(a.mdcn_exec_freq)-1 as drug_exposure_end_date,
	38000177 as drug_type_concept_id,
	NULL as stop_reason,
	NULL as refills,
	--convert(float, a.dd_mqty_freq) * convert(float, a.dd_exec_freq) * convert(float, a.mdcn_exec_freq) as quantity,
	TO_NUMBER(a.dd_mqty_freq)*TO_NUMBER(a.dd_exec_freq) * TO_NUMBER(a.mdcn_exec_freq)   as quantity,
	a.mdcn_exec_freq as days_supply,
	null as sig,
	null as route_concept_id,
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
			x.person_id, 
			COALESCE(X.RXNORM_CONCEPT_ID,0) as concept_id 	
       FROM (
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2002 a inner join NHIS.NHID_GY60_T1_2002 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE left join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2003 a inner join NHIS.NHID_GY60_T1_2003 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE left join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2004 a inner join NHIS.NHID_GY60_T1_2004 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE left join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2005 a inner join NHIS.NHID_GY60_T1_2005 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE left join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2006 a inner join NHIS.NHID_GY60_T1_2006 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE left join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2007 a inner join NHIS.NHID_GY60_T1_2007 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE left join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2008 a inner join NHIS.NHID_GY60_T1_2008 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE left join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2009 a inner join NHIS.NHID_GY60_T1_2009 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE left join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2010 a inner join NHIS.NHID_GY60_T1_2010 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE left join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2011 a inner join NHIS.NHID_GY60_T1_2011 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE left join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2012 a inner join NHIS.NHID_GY60_T1_2012 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE left join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE UNION ALL
SELECT a.PERSON_ID,B.*,C.*,D.* FROM NHIS.NHID_GY20_T1_2013 a inner join NHIS.NHID_GY60_T1_2013 b on a.key_seq=b.key_seq inner join TS_MAP_EDITOATC c on b.DIV_CD=c.EDI_CODE left join TS_MAP_ATCTORXNORM D on c.ATC_CODE=D.ATC_CODE
) x
) a
;

COMMIT;
