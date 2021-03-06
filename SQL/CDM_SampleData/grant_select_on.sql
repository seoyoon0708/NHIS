GRANT SELECT ON COHORT                 TO CDM_SAMPLE;
GRANT SELECT ON COHORT_ATTRIBUTE       TO CDM_SAMPLE;
GRANT SELECT ON DRUG_ERA               TO CDM_SAMPLE;
GRANT SELECT ON DOSE_ERA               TO CDM_SAMPLE;
GRANT SELECT ON CONDITION_ERA          TO CDM_SAMPLE;
GRANT SELECT ON CONCEPT                TO CDM_SAMPLE;
GRANT SELECT ON VOCABULARY             TO CDM_SAMPLE;
GRANT SELECT ON DOMAIN                 TO CDM_SAMPLE;
GRANT SELECT ON CONCEPT_CLASS          TO CDM_SAMPLE;
GRANT SELECT ON CONCEPT_RELATIONSHIP   TO CDM_SAMPLE;
GRANT SELECT ON RELATIONSHIP           TO CDM_SAMPLE;
GRANT SELECT ON CONCEPT_SYNONYM        TO CDM_SAMPLE;
GRANT SELECT ON CONCEPT_ANCESTOR       TO CDM_SAMPLE;
GRANT SELECT ON SOURCE_TO_CONCEPT_MAP  TO CDM_SAMPLE;
GRANT SELECT ON DRUG_STRENGTH          TO CDM_SAMPLE;
GRANT SELECT ON COHORT_DEFINITION      TO CDM_SAMPLE;
GRANT SELECT ON ATTRIBUTE_DEFINITION   TO CDM_SAMPLE;
GRANT SELECT ON CDM_SOURCE             TO CDM_SAMPLE;
GRANT SELECT ON PERSON                 TO CDM_SAMPLE;
GRANT SELECT ON SPECIMEN               TO CDM_SAMPLE;
GRANT SELECT ON DEATH                  TO CDM_SAMPLE;
GRANT SELECT ON VISIT_OCCURRENCE       TO CDM_SAMPLE;
GRANT SELECT ON MEASUREMENT            TO CDM_SAMPLE;
GRANT SELECT ON NOTE                   TO CDM_SAMPLE;
GRANT SELECT ON NOTE_NLP               TO CDM_SAMPLE;
GRANT SELECT ON OBSERVATION            TO CDM_SAMPLE;
GRANT SELECT ON FACT_RELATIONSHIP      TO CDM_SAMPLE;
GRANT SELECT ON LOCATION               TO CDM_SAMPLE;
GRANT SELECT ON CARE_SITE              TO CDM_SAMPLE;
GRANT SELECT ON PROVIDER               TO CDM_SAMPLE;
GRANT SELECT ON PAYER_PLAN_PERIOD      TO CDM_SAMPLE;
GRANT SELECT ON COST                   TO CDM_SAMPLE;
GRANT SELECT ON CONDITION_OCCURRENCE   TO CDM_SAMPLE;
GRANT SELECT ON OBSERVATION_PERIOD     TO CDM_SAMPLE;
GRANT SELECT ON PROCEDURE_OCCURRENCE   TO CDM_SAMPLE;

GRANT SELECT ON drug_exposure   TO CDM_SAMPLE;

GRANT SELECT ON device_exposure   TO CDM_SAMPLE;


select * from drug_exposure;
