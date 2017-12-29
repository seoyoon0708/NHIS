CREATE TABLE  COHORT                 AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.COHORT                   ;
CREATE TABLE  COHORT_ATTRIBUTE       AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.COHORT_ATTRIBUTE         ;
CREATE TABLE  DRUG_ERA               AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.DRUG_ERA                 ;
CREATE TABLE  DOSE_ERA               AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.DOSE_ERA                 ;
CREATE TABLE  CONDITION_ERA          AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.CONDITION_ERA            ;
CREATE TABLE  CONCEPT                AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.CONCEPT                  ;
CREATE TABLE  VOCABULARY             AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.VOCABULARY               ;
CREATE TABLE  DOMAIN                 AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.DOMAIN                   ;
CREATE TABLE  CONCEPT_CLASS          AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.CONCEPT_CLASS            ;
CREATE TABLE  CONCEPT_RELATIONSHIP   AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.CONCEPT_RELATIONSHIP     ;
CREATE TABLE  RELATIONSHIP           AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.RELATIONSHIP             ;
CREATE TABLE  CONCEPT_SYNONYM        AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.CONCEPT_SYNONYM          ;
CREATE TABLE  CONCEPT_ANCESTOR       AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.CONCEPT_ANCESTOR         ;
CREATE TABLE  SOURCE_TO_CONCEPT_MAP  AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.SOURCE_TO_CONCEPT_MAP    ;
CREATE TABLE  DRUG_STRENGTH          AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.DRUG_STRENGTH            ;
CREATE TABLE  COHORT_DEFINITION      AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.COHORT_DEFINITION        ;
CREATE TABLE  ATTRIBUTE_DEFINITION   AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.ATTRIBUTE_DEFINITION     ;
CREATE TABLE  CDM_SOURCE             AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.CDM_SOURCE               ;
CREATE TABLE  PERSON                 AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.PERSON                   ;
CREATE TABLE  SPECIMEN               AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.SPECIMEN                 ;
CREATE TABLE  DEATH                  AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.DEATH                    ;
CREATE TABLE  VISIT_OCCURRENCE       AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.VISIT_OCCURRENCE         ;
CREATE TABLE  MEASUREMENT            AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.MEASUREMENT              ;
CREATE TABLE  NOTE                   AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.NOTE                     ;
CREATE TABLE  NOTE_NLP               AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.NOTE_NLP                 ;
CREATE TABLE  OBSERVATION            AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.OBSERVATION              ;
CREATE TABLE  FACT_RELATIONSHIP      AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.FACT_RELATIONSHIP        ;
CREATE TABLE  LOCATION               AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.LOCATION                 ;
CREATE TABLE  CARE_SITE              AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.CARE_SITE                ;
CREATE TABLE  PROVIDER               AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.PROVIDER                 ;
CREATE TABLE  PAYER_PLAN_PERIOD      AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.PAYER_PLAN_PERIOD        ;
CREATE TABLE  COST                   AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.COST                     ;
CREATE TABLE  CONDITION_OCCURRENCE   AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.CONDITION_OCCURRENCE     ;
CREATE TABLE  OBSERVATION_PERIOD     AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.OBSERVATION_PERIOD       ;
CREATE TABLE  PROCEDURE_OCCURRENCE   AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.PROCEDURE_OCCURRENCE     ;

CREATE TABLE  DRUG_EXPOSURE   AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.DRUG_EXPOSURE     ;

CREATE TABLE  device_exposure   AS SELECT /*+parallel(8)*/ * FROM CDM_ONE_MIL.device_exposure     ;

select * from device_exposure;

select * from PROVIDER;

select * from all_tables where owner='CDM_SAMPLE';
