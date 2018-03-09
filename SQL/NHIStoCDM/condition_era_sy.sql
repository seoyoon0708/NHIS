/**************************************
 --encoding : UTF-8
 --Author: OHDSI
  
@NHISDatabaseSchema : DB containing NHIS National Sample cohort DB
@ResultDatabaseSchema : DB for NHIS-NSC in CDM format
 
 --Description: OHDSI에서 생성한 condition_era 생성 쿼리
               총 3개의 temp table이 만들어짐
			   1) #cteConditionTarget
			   2) #cteEndDates
			   3) #cteConditionEnds
 --Generating Table: CONDITION_ERA
***************************************/

/**************************************
 @Author: OHDSI
 @Date: 2017.02.21 실행
 
 @Database: NHIS_NSC (16호 서버)
 @Description: OHDSI에서 생성한 condition_era 생성 쿼리
               총 3개의 temp table이 만들어짐
			   1) #cteConditionTarget
			   2) #cteEndDates
			   3) #cteConditionEnds
***************************************/

/**************************************
 1. condition_era 테이블 생성
***************************************/ 
CREATE TABLE CDM_ONE_MIL.CONDITION_ERA  (
     condition_era_id					INTEGER	    NOT NULL , 
     person_id							INTEGER     NOT NULL ,
     condition_concept_id				INTEGER   NOT NULL ,
     condition_era_start_date			DATE      NOT NULL ,
     condition_era_end_date				DATE 	  NOT NULL ,
     condition_occurrence_count			INTEGER			NULL 
); 

	 
/**************************************
 2. 1단계: 필요 데이터 조회
***************************************/ 
--------------------------------------------#cteConditionTarget 
create table cteConditionTarget as 
SELECT
	condition_occurrence_id, 
	person_id, 
	condition_concept_id, 
	condition_start_date, 
	COALESCE(nullif(condition_end_date,NULL),(condition_start_date + numtodsinterval(31,'day'))) AS condition_end_date  
FROM condition_occurrence;

	
--------------------------------------------#cteEndDates
create table cteEndDates as 
SELECT
	person_id
	, condition_concept_id
	, event_date + numtodsinterval(-30,'day') AS end_date 
FROM
(
	SELECT
		person_id
		, condition_concept_id
		, event_date
		, event_type
		, MAX(start_ordinal) OVER (PARTITION BY person_id, condition_concept_id ORDER BY event_date, event_type ROWS UNBOUNDED PRECEDING) AS start_ordinal -- this pulls the current START down from the prior rows so that the NULLs from the END DATES will contain a value we can compare with 
		, ROW_NUMBER() OVER (PARTITION BY person_id, condition_concept_id ORDER BY event_date, event_type) AS overall_ord -- this re-numbers the inner UNION so all rows are numbered ordered by the event date
	FROM
	(
		-- select the start dates, assigning a row number to each
		SELECT
			person_id
			, condition_concept_id
			, condition_start_date AS event_date
			, -1 AS event_type
			, ROW_NUMBER() OVER (PARTITION BY person_id, condition_concept_id ORDER BY condition_start_date) AS start_ordinal
		FROM cteConditionTarget
	
		UNION ALL
	
		-- pad the end dates by 30 to allow a grace period for overlapping ranges.
		SELECT
			person_id
			, condition_concept_id
			, condition_end_date + numtodsinterval(30,'day')
			, 1 AS event_type
			, NULL
		FROM cteConditionTarget
	) RAWDATA
) e
WHERE (2 * e.start_ordinal) - e.overall_ord = 0;


--------------------------------------------#cteConditionEnds
create table cteConditionEnds as 
SELECT
        c.person_id
	, c.condition_concept_id
	, c.condition_start_date
	, MIN(e.end_date) AS era_end_date
FROM cteConditionTarget c
JOIN cteEndDates e ON c.person_id = e.person_id AND c.condition_concept_id = e.condition_concept_id AND e.end_date >= c.condition_start_date
GROUP BY
      c.condition_occurrence_id
	, c.person_id
	, c.condition_concept_id
	, c.condition_start_date;


/**************************************
 3. 2단계: condition_era에 데이터 입력
***************************************/ 

INSERT INTO CDM_ONE_MIL.condition_era (person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count)
SELECT
	person_id
	, condition_concept_id
	, MIN(condition_start_date) AS condition_era_start_date
	, era_end_date AS condition_era_end_date
	, COUNT(*) AS condition_occurrence_count
FROM cteConditionEnds
GROUP BY person_id, condition_concept_id, era_end_date
ORDER BY person_id, condition_concept_id
;
