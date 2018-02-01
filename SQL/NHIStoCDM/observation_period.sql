create table observation_period_temp1
as
select
      a.person_id as person_id, 
      case when a.stnd_y >= b.year_of_birth then TO_DATE(a.stnd_y||'0101','YYYYMMDD')--convert(date, convert(varchar, a.stnd_y) + '0101', 112) 
            else TO_DATE(b.year_of_birth||'0101','YYYYMMDD') --convert(date, convert(varchar, b.year_of_birth) + '0101', 112) 
      end as observation_period_start_date, --관측시작일
      case when TO_DATE(a.stnd_y||'1231','YYYYMMDD')> c.death_date then c.death_date --convert(date, a.stnd_y + '1231', 112) > c.death_date then c.death_date
            else TO_DATE(a.stnd_y||'1231','YYYYMMDD') --convert(date, a.stnd_y + '1231', 112)
      end as observation_period_end_date --관측종료일
from NHIS.NHIS_JK a,
      CDM_ONE_MIL.person b left join CDM_ONE_MIL.death c
      on b.person_id=c.person_id
where a.person_id=b.person_id;
--(12132633개 행이 영향을 받음), 00:05

-- step 2
create table observation_period_temp2
as
select a.*, row_number() over(partition by person_id order by observation_period_start_date, observation_period_end_date) AS id
from observation_period_temp1 a
where observation_period_start_date < observation_period_end_date -- 사망 이후 가지는 자격을 제외시키는 쿼리
--(12132529개 행이 영향을 받음), 00:08
;



-- step 3
create table observation_period_temp3
as
select 
	a.*, a.observation_period_end_date-b.observation_period_start_date as days--datediff(day, a.observation_period_end_date, b.observation_period_start_date) as days	
	from observation_period_temp2 a
		left join
		observation_period_temp2 b
		on a.person_id = b.person_id and a.id=b.id-1
		--	and a.id = cast(b.id as int)-1
	order by a.person_id, a.id;
--(12132529개 행이 영향을 받음), 00:15

-- step 4
create table observation_period_temp4
as
select
	a.*, CASE WHEN id=1 THEN 1
   ELSE SUM(CASE WHEN DAYS>1 THEN 1 ELSE 0 END) OVER(PARTITION BY person_id ORDER BY id ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING)+1
   END AS sumday
   from observation_period_temp3 a
   order by person_id, id;
--(12132529개 행이 영향을 받음), 00:12

truncate table observation_period;

-- step 5
select * from observation_period_temp4;

create table obervation_period_temp5
as
select --rownum as observation_period_id, --identity(int, 1, 1) as observation_period_id,
	person_id,
	min(observation_period_start_date) as observation_period_start_date,
	max(observation_period_end_date) as observation_period_end_date,
	44814725 as PERIOD_TYPE_CONCEPT_ID
from observation_period_temp4
group by person_id, sumday
order by person_id, observation_period_start_date;

INSERT /*+append*/ INTO CDM_ONE_MIL.OBSERVATION_PERIOD
select rownum as observation_period_id,
       x.*
 from obervation_period_temp5 x
;

commit;

select * from CDM_ONE_MIL.OBSERVATION_PERIOD;