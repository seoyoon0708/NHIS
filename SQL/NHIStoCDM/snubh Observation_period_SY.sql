CREATE TABLE NHIS.NHIS_JK
parallel 8 
nologging
pctfree 0 
as
select 8000000000+rownum observation_period_id, g.*
from (
select STND_Y, PERSON_ID, SEX, AGE_GROUP, DTH_YM, DTH_CODE1, DTH_CODE2, SIDO, SGG, IPSN_TYPE_CD , CTRB_PT_TYPE_CD, DFAB_GRD_CD, DFAB_PTN_CD, DFAB_REG_YM from NHID_JK_2002 UNION ALL
select STND_Y, PERSON_ID, SEX, AGE_GROUP, DTH_YM, DTH_CODE1, DTH_CODE2, SIDO, SGG, IPSN_TYPE_CD , CTRB_PT_TYPE_CD, DFAB_GRD_CD, DFAB_PTN_CD, DFAB_REG_YM from NHID_JK_2003 UNION ALL
select STND_Y, PERSON_ID, SEX, AGE_GROUP, DTH_YM, DTH_CODE1, DTH_CODE2, SIDO, SGG, IPSN_TYPE_CD , CTRB_PT_TYPE_CD, DFAB_GRD_CD, DFAB_PTN_CD, DFAB_REG_YM from NHID_JK_2004 UNION ALL
select STND_Y, PERSON_ID, SEX, AGE_GROUP, DTH_YM, DTH_CODE1, DTH_CODE2, SIDO, SGG, IPSN_TYPE_CD , CTRB_PT_TYPE_CD, DFAB_GRD_CD, DFAB_PTN_CD, DFAB_REG_YM from NHID_JK_2005 UNION ALL
select STND_Y, PERSON_ID, SEX, AGE_GROUP, DTH_YM, DTH_CODE1, DTH_CODE2, SIDO, SGG, IPSN_TYPE_CD , CTRB_PT_TYPE_CD, DFAB_GRD_CD, DFAB_PTN_CD, DFAB_REG_YM from NHID_JK_2006 UNION ALL
select STND_Y, PERSON_ID, SEX, AGE_GROUP, DTH_YM, DTH_CODE1, DTH_CODE2, SIDO, SGG, IPSN_TYPE_CD , CTRB_PT_TYPE_CD, DFAB_GRD_CD, DFAB_PTN_CD, DFAB_REG_YM from NHID_JK_2007 UNION ALL
select STND_Y, PERSON_ID, SEX, AGE_GROUP, DTH_YM, DTH_CODE1, DTH_CODE2, SIDO, SGG, IPSN_TYPE_CD , CTRB_PT_TYPE_CD, DFAB_GRD_CD, DFAB_PTN_CD, DFAB_REG_YM from NHID_JK_2008 UNION ALL
select STND_Y, PERSON_ID, SEX, AGE_GROUP, DTH_YM, DTH_CODE1, DTH_CODE2, SIDO, SGG, IPSN_TYPE_CD , CTRB_PT_TYPE_CD, DFAB_GRD_CD, DFAB_PTN_CD, DFAB_REG_YM from NHID_JK_2009 UNION ALL
select STND_Y, PERSON_ID, SEX, AGE_GROUP, DTH_YM, DTH_CODE1, DTH_CODE2, SIDO, SGG, IPSN_TYPE_CD , CTRB_PT_TYPE_CD, DFAB_GRD_CD, DFAB_PTN_CD, DFAB_REG_YM from NHID_JK_2010 UNION ALL
select STND_Y, PERSON_ID, SEX, AGE_GROUP, DTH_YM, DTH_CODE1, DTH_CODE2, SIDO, SGG, IPSN_TYPE_CD , CTRB_PT_TYPE_CD, DFAB_GRD_CD, DFAB_PTN_CD, DFAB_REG_YM from NHID_JK_2011 UNION ALL
select STND_Y, PERSON_ID, SEX, AGE_GROUP, DTH_YM, DTH_CODE1, DTH_CODE2, SIDO, SGG, IPSN_TYPE_CD , CTRB_PT_TYPE_CD, DFAB_GRD_CD, DFAB_PTN_CD, DFAB_REG_YM from NHID_JK_2012 UNION ALL
select STND_Y, PERSON_ID, SEX, AGE_GROUP, DTH_YM, DTH_CODE1, DTH_CODE2, SIDO, SGG, IPSN_TYPE_CD , CTRB_PT_TYPE_CD, DFAB_GRD_CD, DFAB_PTN_CD, DFAB_REG_YM from NHID_JK_2013 ) g;

truncate table observation_period;

-- step 1
select
      a.person_id as person_id, 
      case when a.stnd_y >= b.year_of_birth then TO_DATE(TO_CHAR(a.stnd_y)||'0101', 'YYYYMMDD')
            else TO_DATE(TO_CHAR(b.year_of_birth)||'0101', 'YYYYMMDD') 
      end as observation_period_start_date, --관측시작일
      case when TO_DATE(a.stnd_y||'1231', 'YYYYMMDD') > c.death_date then c.death_date
            else TO_DATE(a.stnd_y||'1231', 'YYYYMMDD')
      end as observation_period_end_date --관측종료일
into #observation_period_temp1
from NHIS.NHIS_JK a,
      NHIS.PERSON b left join NHIS.death c
      on b.person_id=c.person_id
where a.person_id=b.person_id
--(12132633개 행이 영향을 받음), 00:05

-- step 2
select *, row_number() over(partition by person_id order by observation_period_start_date, observation_period_end_date) AS id
into #observation_period_temp2
from #observation_period_temp1
where observation_period_start_date < observation_period_end_date -- 사망 이후 가지는 자격을 제외시키는 쿼리
--(12132529개 행이 영향을 받음), 00:08


-- step 3
select 
	a.*, TO_DATE(a.observation_period_end_date, 'YYYYMMDD') - TO_DATE(b.observation_period_start_date, 'YYYYMMDD') as days
	into #observation_period_temp3
	from #observation_period_temp2 a
		left join
		#observation_period_temp2 b
		on a.person_id = b.person_id
			and a.id = cast(b.id as int)-1
	order by person_id, id
--(12132529개 행이 영향을 받음), 00:15

-- step 4
select
	a.*, CASE WHEN id=1 THEN 1
   ELSE SUM(CASE WHEN DAYS>1 THEN 1 ELSE 0 END) OVER(PARTITION BY person_id ORDER BY id ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING)+1
   END AS sumday
   into #observation_period_temp4
   from #observation_period_temp3 a
   order by person_id, id
--(12132529개 행이 영향을 받음), 00:12


-- step 5
CREATE SEQUENCE observation_period_id START WITH 1;
select observation_period_id,
	person_id,
	min(observation_period_start_date) as observation_period_start_date,
	max(observation_period_end_date) as observation_period_end_date,
	44814725 as PERIOD_TYPE_CONCEPT_ID
INTO @ResultDatabaseSchema.OBSERVATION_PERIOD
from #observation_period_temp4
group by person_id, sumday
order by person_id, observation_period_start_date
--(1256091개 행이 영향을 받음), 00:10

drop table #observation_period_temp1, #observation_period_temp2, #observation_period_temp3, #observation_period_temp4