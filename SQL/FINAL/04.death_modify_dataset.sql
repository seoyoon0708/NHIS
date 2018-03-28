-- author: 정성재
-- Removing duplicated rows with multiple cause_concept_id


create table death_bak
as select * from death;

truncate table death;

INSERT INTO DEATH (person_id, death_date, death_type_concept_id, cause_concept_id, 
cause_source_value, cause_source_concept_id)
SELECT
person_id, death_date, death_type_concept_id, cause_concept_id, 
cause_source_value, cause_source_concept_id
from (
select a.*, row_number() over (partition by person_id order by null) RN
  from death_bak a
      )
 where RN=1
 ;
