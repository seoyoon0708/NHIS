create table observation_period_bak20180228
as select * from observation_period;

TRUNCATE TABLE OBSERVATION_PERIOD;

INSERT /*+APPEND*/ INTO OBSERVATION_PERIOD
select	ROWNUM			                                        as OBSERVATION_PERIOD_ID          
		,A.PERSON_ID                                            as PERSON_ID                  
		,TO_DATE(STND_Y||'0101','YYYYMMDD')                     as OBSERVATION_PERIOD_START_DATE  
		,COALESCE(DEATH_DATE,TO_DATE(STND_Y||'1231','YYYYMMDD'))as OBSERVATION_PERIOD_END_DATE    
		,44814725		                                        as PERIOD_TYPE_CONCEPT_ID         
  FROM	NHIS.NHIS_JK a
  LEFT OUTER JOIN (SELECT X.*,ROW_NUMBER() OVER(PARTITION BY PERSON_ID ORDER BY DEATH_DATE ASC) RN FROM DEATH X) B ON A.PERSON_ID=B.PERSON_ID AND TO_CHAR(death_date,'YYYY')=STND_Y AND B.RN=1  
;

--12,132,633개 행 이(가) 삽입되었습니다.

COMMIT;

--커밋 완료.
