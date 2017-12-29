SELECT TABLESPACE_NAME, FILE_NAME, BYTES/1024 AS MBytes, RESULT/1024 AS USE_MBytes FROM
  (
  SELECT E.TABLESPACE_NAME,E.FILE_NAME,E.BYTES, (E.BYTES-SUM(F.BYTES)) RESULT
  FROM DBA_DATA_FILES E, DBA_FREE_SPACE F
  WHERE E.FILE_ID = F.FILE_ID
  GROUP BY E.TABLESPACE_NAME, E.FILE_NAME, E.BYTES
  ) A;

SELECT * FROM V$SORT_USAGE;

SELECT * FROM DBA_TEMP_FILES;



SELECT * FROM DBA_DATA_FILES E;

SELECT * FROM all_USERS;

SELECT * FROM DBA_USERS;

create table NHIS_JK as
SELECT * FROM NHID_JK_2002 UNION ALL
SELECT * FROM NHID_JK_2003 UNION ALL
SELECT * FROM NHID_JK_2004 UNION ALL
SELECT * FROM NHID_JK_2005 UNION ALL
SELECT * FROM NHID_JK_2006 UNION ALL
SELECT * FROM NHID_JK_2007 UNION ALL
SELECT * FROM NHID_JK_2008 UNION ALL
SELECT * FROM NHID_JK_2009 UNION ALL
SELECT * FROM NHID_JK_2010 UNION ALL
SELECT * FROM NHID_JK_2011 UNION ALL
SELECT * FROM NHID_JK_2012 UNION ALL
SELECT * FROM NHID_JK_2013 ;

TRUNCATE TABLE PERSON DROP STORAGE;

create table person_1 as select * from person where 1=2;

INSERT INTO PERSON
select /*+parallel(8)*/  A.person_id					as person_id
		,case when A.sex=1 then 8507 when A.sex=2 then 8532 end as gender_concept_id
		,year_of_birth
		,null 							as month_of_birth
		,null 							as day_of_birth
		,null 							as time_of_birth
		,38003585 						as race_concept_id --¿Œ¡æ
		,38003564 						as ethnicity_concept_id --πŒ¡∑º∫
		,A.SGG							as location_id
		,NULL							as provider_id
		,NULL							as care_site_id
		,A.PERSON_ID					as person_source_value
		,A.SEX							as gender_source_value
		,NULL							as gender_source_concept_id
		,NULL							as race_source_value
		,NULL							as race_source_concept_id
		,NULL							as ethnicity_source_value
		,NULL							as ethnicity_source_concept_id
   from (SELECT A.*, ROW_NUMBER() OVER (PARTITION BY PERSON_ID ORDER BY STND_Y DESC) RN
           FROM NHIS.NHIS_JK A ) A
  INNER JOIN (SELECT PERSON_ID, MIN(STND_Y-AGE_GROUP*5) year_of_birth
				FROM NHIS.NHIS_JK
			   GROUP BY PERSON_ID) B ON A.PERSON_ID=B.PERSON_ID AND A.RN=1
 ;

select count(*) from person
union all
select count(*) from person_1;


select * from person_1 where rownum<=100;

select * from all_tables
where owner='CDM_SAMPLE'
and table_name not like '%_EX%';

grant select on
