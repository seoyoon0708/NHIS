create table cteDrugPreTarget_rev
as  SELECT 	d.drug_exposure_id
			, d.person_id
			, c.concept_id AS ingredient_concept_id
			, d.drug_exposure_start_date AS drug_exposure_start_date
			, d.days_supply AS days_supply
			, COALESCE(d.drug_exposure_end_date, d.drug_exposure_start_date+d.days_supply, drug_exposure_start_date+1) AS drug_exposure_end_date
			, lead(d.drug_exposure_start_date) over (partition by d.person_id,c.concept_id order by d.drug_exposure_start_date) as next_start_date
			, CASE WHEN COALESCE(d.drug_exposure_end_date, d.drug_exposure_start_date+d.days_supply, drug_exposure_start_date+1)-
						lead(d.drug_exposure_start_date) over (partition by d.person_id,c.concept_id order by d.drug_exposure_start_date)>30 then 1 else 0
			  END AS NEW_ERA_YN
		 FROM drug_exposure d
		JOIN concept_ancestor ca ON ca.descendant_concept_id = d.drug_concept_id
		JOIN concept c ON ca.ancestor_concept_id = c.concept_id
		WHERE c.vocabulary_id = 'RxNorm'
		AND c.concept_class_ID = 'Ingredient'		
;


create table drug_era_mini (drug_era_id,person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) as
select rownum as drug_era_id,x.*
from (SELECT
			  person_id
			, ingredient_concept_id as drug_concept_id
			, MIN(drug_exposure_start_date) AS drug_era_start_date
			, MAX(drug_exposure_end_date)   AS drug_era_end_date
			, COUNT(*) 						AS drug_exposure_count
			, SUM(GAP) AS gap_days
		FROM (SELECT a.*
					,case when next_start_date>drug_exposure_end_date THEN next_start_date-drug_exposure_end_date ELSE 0 END as GAP
					,sum(NEW_ERA_YN) over (partition by person_id,ingredient_concept_id order by drug_exposure_start_date rows between unbounded preceding and current row) ERA_NO	   
			   from cteDrugPreTarget_rev a) b 
		GROUP BY person_id,ingredient_concept_id,ERA_NO
      ) x;


/**************************************
 2. 1단계: 필요 데이터 조회
***************************************
--------------------------------------------#cteDrugPreTarget 
drop table cteDrugPreTarget;

create table cteDrugPreTarget
as
SELECT 	d.drug_exposure_id
	, d.person_id
	, c.concept_id AS ingredient_concept_id
	, d.drug_exposure_start_date AS drug_exposure_start_date
	, d.days_supply AS days_supply
	, COALESCE(d.drug_exposure_end_date, d.drug_exposure_start_date+d.days_supply, drug_exposure_start_date+1) AS drug_exposure_end_date
 FROM drug_exposure d
JOIN concept_ancestor ca ON ca.descendant_concept_id = d.drug_concept_id
JOIN concept c ON ca.ancestor_concept_id = c.concept_id
WHERE c.vocabulary_id = 'RxNorm'
AND c.concept_class_ID = 'Ingredient'
;
 
drop table cteDrugTarget1;

--------------------------------------------#cteDrugTarget1
create table cteDrugTarget1
as
SELECT
	drug_exposure_id
	, person_id
	, ingredient_concept_id
	, drug_exposure_start_date
	, days_supply
	, drug_exposure_end_date
	, drug_exposure_end_date - drug_exposure_start_date AS days_of_exposure ---Calculates the days of exposure to the drug so at the end we can subtract the SUM of these days from the total days in the era.
FROM  cteDrugPreTarget;




--------------------------------------------#cteEndDates1
create table cteEndDates1 
as
SELECT
	person_id
	, ingredient_concept_id
	, event_date-30 AS end_date -- unpad the end date
FROM
(
	SELECT
		person_id
		, ingredient_concept_id
		, event_date
		, event_type
		, MAX(start_ordinal) OVER (PARTITION BY person_id, ingredient_concept_id ORDER BY event_date, event_type ROWS unbounded preceding) AS start_ordinal -- this pulls the current START down from the prior rows so that the NULLs from the END DATES will contain a value we can compare with
		, ROW_NUMBER() OVER (PARTITION BY person_id, ingredient_concept_id ORDER BY event_date, event_type) AS overall_ord -- this re-numbers the inner UNION so all rows are numbered ordered by the event date
	FROM (
		-- select the start dates, assigning a row number to each
		SELECT
			person_id
			, ingredient_concept_id
			, drug_exposure_start_date AS event_date
			, -1 AS event_type
			, ROW_NUMBER() OVER (PARTITION BY person_id, ingredient_concept_id ORDER BY drug_exposure_start_date) AS start_ordinal
		FROM cteDrugTarget1
	
		UNION ALL
	
		-- pad the end dates by 30 to allow a grace period for overlapping ranges.
		SELECT
			person_id
			, ingredient_concept_id
			, drug_exposure_end_date+30
			, 1 AS event_type
			, NULL
		FROM cteDrugTarget1
	) RAWDATA
) e
WHERE (2 * e.start_ordinal) - e.overall_ord = 0;

	
--------------------------------------------#cteDrugExposureEnds1
CREATE table cteDrugExposureEnds1
AS
SELECT 
	   dt.person_id
	   , dt.ingredient_concept_id as drug_concept_id
	   , dt.drug_exposure_start_date
	   , MIN(e.end_date) AS drug_era_end_date
	   , dt.days_of_exposure AS days_of_exposure
 FROM cteDrugTarget1 dt
 JOIN cteEndDates1 e ON dt.person_id = e.person_id AND dt.ingredient_concept_id = e.ingredient_concept_id AND e.end_date >= dt.drug_exposure_start_date
GROUP BY 
        dt.drug_exposure_id
	  , dt.person_id
	  , dt.ingredient_concept_id
	  , dt.drug_exposure_start_date
	  , dt.days_of_exposure;

		  
/**************************************
 3. 2단계: drug_era에 데이터 입력
***************************************/ 

INSERT INTO drug_era (drug_era_id,person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days)
select rownum as drug_dra_id,x.*
from (
SELECT
	  person_id
	, drug_concept_id
	, MIN(drug_exposure_start_date) AS drug_era_start_date
	, drug_era_end_date
	, COUNT(*) AS drug_exposure_count
	, drug_era_end_date-MIN(drug_exposure_start_date) -SUM(days_of_exposure) AS gap_days
	/*, EXTRACT(EPOCH FROM (drug_era_end_date - MIN(drug_exposure_start_date)) - SUM(days_of_exposure))/86400 AS gap_day
			  ---dividing by 86400 puts the integer in the "units" of days.
			  ---There are no actual units on this, it is just an integer, but we want it to represent days and dividing by 86400 does that.*/
FROM cteDrugExposureEnds1
GROUP BY person_id, drug_concept_id, drug_era_end_date
) X;

commit;
*/
