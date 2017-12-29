CREATE TABLE concept (
  concept_id			INTEGER			NOT NULL,
  concept_name			VARCHAR2(255)	NOT NULL,
  domain_id				VARCHAR2(20)		NOT NULL,
  vocabulary_id			VARCHAR2(20)		NOT NULL,
  concept_class_id		VARCHAR2(20)		NOT NULL,
  standard_concept		VARCHAR2(1)		NULL,
  concept_code			VARCHAR2(50)		NOT NULL,
  valid_start_date		DATE			NOT NULL,
  valid_end_date		DATE			NOT NULL,
  invalid_reason		VARCHAR2(1)		NULL
)
;


                    

CREATE TABLE vocabulary (
  vocabulary_id			VARCHAR2(20)		NOT NULL,
  vocabulary_name		VARCHAR2(255)	NOT NULL,
  vocabulary_reference	VARCHAR2(255)	NULL,
  vocabulary_version	VARCHAR2(255)	NULL,
  vocabulary_concept_id	INTEGER			NOT NULL
)
;




CREATE TABLE domain (
  domain_id			VARCHAR2(20)		NOT NULL,
  domain_name		VARCHAR2(255)	NOT NULL,
  domain_concept_id	INTEGER			NOT NULL
)
;



CREATE TABLE concept_class (
  concept_class_id			VARCHAR2(20)		NOT NULL,
  concept_class_name		VARCHAR2(255)	NOT NULL,
  concept_class_concept_id	INTEGER			NOT NULL
)
;




CREATE TABLE concept_relationship (
  concept_id_1			INTEGER			NOT NULL,
  concept_id_2			INTEGER			NOT NULL,
  relationship_id		VARCHAR2(20)		NOT NULL,
  valid_start_date		DATE			NOT NULL,
  valid_end_date		DATE			NOT NULL,
  invalid_reason		CHAR(1)		NULL)
;



CREATE TABLE relationship (
  relationship_id			VARCHAR2(20)		NOT NULL,
  relationship_name			VARCHAR2(255)	NOT NULL,
  is_hierarchical			CHAR(1)		NOT NULL,
  defines_ancestry			CHAR(1)		NOT NULL,
  reverse_relationship_id	VARCHAR2(20)		NOT NULL,
  relationship_concept_id	INTEGER			NOT NULL
)
;


CREATE TABLE concept_synonym (
  concept_id			INTEGER			NOT NULL,
  concept_synonym_name	VARCHAR2(1000)	NOT NULL,
  language_concept_id	INTEGER			NOT NULL
)
;


CREATE TABLE concept_ancestor (
  ancestor_concept_id		INTEGER		NOT NULL,
  descendant_concept_id		INTEGER		NOT NULL,
  min_levels_of_separation	INTEGER		NOT NULL,
  max_levels_of_separation	INTEGER		NOT NULL
)
;



CREATE TABLE source_to_concept_map (
  source_code				VARCHAR2(50)		NOT NULL,
  source_concept_id			INTEGER			NOT NULL,
  source_vocabulary_id		VARCHAR2(20)		NOT NULL,
  source_code_description	VARCHAR2(255)	NULL,
  target_concept_id			INTEGER			NOT NULL,
  target_vocabulary_id		VARCHAR2(20)		NOT NULL,
  valid_start_date			DATE			NOT NULL,
  valid_end_date			DATE			NOT NULL,
  invalid_reason			CHAR(1)		NULL
)
;




CREATE TABLE drug_strength (
  drug_concept_id				INTEGER		NOT NULL,
  ingredient_concept_id			INTEGER		NOT NULL,
  amount_value					FLOAT		NULL,
  amount_unit_concept_id		INTEGER		NULL,
  numerator_value				FLOAT		NULL,
  numerator_unit_concept_id		INTEGER		NULL,
  denominator_value				FLOAT		NULL,
  denominator_unit_concept_id	INTEGER		NULL,
  box_size						INTEGER		NULL,
  valid_start_date				DATE		NOT NULL,
  valid_end_date				DATE		NOT NULL,
  invalid_reason				CHAR(1)	NULL
)
;



CREATE TABLE cohort_definition (
  cohort_definition_id				INTEGER			NOT NULL,
  cohort_definition_name			VARCHAR2(255)	NOT NULL,
  cohort_definition_description		CLOB	NULL,
  definition_type_concept_id		INTEGER			NOT NULL,
  cohort_definition_syntax			CLOB	NULL,
  subject_concept_id				INTEGER			NOT NULL,
  cohort_initiation_date			DATE			NULL
)
;


CREATE TABLE attribute_definition (
  attribute_definition_id		INTEGER			NOT NULL,
  attribute_name				VARCHAR2(255)	NOT NULL,
  attribute_description			CLOB	NULL,
  attribute_type_concept_id		INTEGER			NOT NULL,
  attribute_syntax				CLOB	NULL
)
;


/**************************

Standardized meta-data

***************************/


CREATE TABLE cdm_source
    (
     cdm_source_name					VARCHAR2(255)	NOT NULL,
	 cdm_source_abbreviation			VARCHAR2(25)		NULL,
	 cdm_holder							VARCHAR2(255)	NULL,
	 source_description					CLOB	NULL,
	 source_documentation_reference		VARCHAR2(255)	NULL,
	 cdm_etl_reference					VARCHAR2(255)	NULL,
	 source_release_date				DATE			NULL,
	 cdm_release_date					DATE			NULL,
	 cdm_version						VARCHAR2(10)		NULL,
	 vocabulary_version					VARCHAR2(20)		NULL
    )
;







/************************

Standardized clinical data

************************/


CREATE TABLE person
    (
     person_id						INTEGER		NOT NULL ,
     gender_concept_id				INTEGER		NOT NULL ,
     year_of_birth					INTEGER		NOT NULL ,
     month_of_birth					INTEGER		NULL,
     day_of_birth					INTEGER		NULL,
	   birth_datetime					TIMESTAMP WITH TIME ZONE	NULL,
     race_concept_id				INTEGER		NOT NULL,
     ethnicity_concept_id			INTEGER		NOT NULL,
     location_id					INTEGER		NULL,
     provider_id					INTEGER		NULL,
     care_site_id					INTEGER		NULL,
     person_source_value			VARCHAR2(50) NULL,
     gender_source_value			VARCHAR2(50) NULL,
	 gender_source_concept_id		INTEGER		NULL,
     race_source_value				VARCHAR2(50) NULL,
	 race_source_concept_id			INTEGER		NULL,
     ethnicity_source_value			VARCHAR2(50) NULL,
	 ethnicity_source_concept_id	INTEGER		NULL
    )
;





CREATE TABLE observation_period
    (
     observation_period_id				INTEGER		NOT NULL ,
     person_id							INTEGER		NOT NULL ,
     observation_period_start_date		DATE		NOT NULL ,
     observation_period_start_time		TIMESTAMP WITH TIME ZONE		NOT NULL ,
     observation_period_end_date		DATE		NOT NULL ,
     observation_period_end_time		TIMESTAMP WITH TIME ZONE		NOT NULL ,
	 period_type_concept_id				INTEGER		NOT NULL
    )
;



CREATE TABLE specimen
    (
     specimen_id						INTEGER			NOT NULL ,
	 person_id							INTEGER			NOT NULL ,
	 specimen_concept_id				INTEGER			NOT NULL ,
	 specimen_type_concept_id			INTEGER			NOT NULL ,
	 specimen_date						DATE			NOT NULL ,
	 specimen_datetime						TIMESTAMP WITH TIME ZONE		NULL ,
	 quantity							FLOAT			NULL ,
	 unit_concept_id					INTEGER			NULL ,
	 anatomic_site_concept_id			INTEGER			NULL ,
	 disease_status_concept_id			INTEGER			NULL ,
	 specimen_source_id					VARCHAR2(50)		NULL ,
	 specimen_source_value				VARCHAR2(50)		NULL ,
	 unit_source_value					VARCHAR2(50)		NULL ,
	 anatomic_site_source_value			VARCHAR2(50)		NULL ,
	 disease_status_source_value		VARCHAR2(50)		NULL
	)
;



CREATE TABLE death
    (
     person_id							INTEGER			NOT NULL ,
     death_date							DATE			NOT NULL ,
     death_datetime							TIMESTAMP WITH TIME ZONE			NULL ,
     death_type_concept_id				INTEGER			NOT NULL ,
     cause_concept_id					INTEGER			NULL ,
     cause_source_value					VARCHAR2(50)		NULL,
	 cause_source_concept_id			INTEGER			NULL
    )
;



CREATE TABLE visit_occurrence
    (
     visit_occurrence_id			INTEGER			NOT NULL ,
     person_id						INTEGER			NOT NULL ,
     visit_concept_id				INTEGER			NOT NULL ,
	 visit_start_date				DATE			NOT NULL ,
	 visit_start_datetime				TIMESTAMP WITH TIME ZONE		NULL ,
     visit_end_date					DATE			NOT NULL ,
	 visit_end_datetime					TIMESTAMP WITH TIME ZONE		NULL ,
	 visit_type_concept_id			INTEGER			NOT NULL ,
	 provider_id					INTEGER			NULL,
     care_site_id					INTEGER			NULL,
     visit_source_value				VARCHAR2(50)		NULL,
	 visit_source_concept_id		INTEGER			NULL,
	 admitting_source_concept_id	INTEGER			NULL ,
	 admitting_source_value			VARCHAR2(50)		NULL ,
	 discharge_to_concept_id		INTEGER		NULL ,
	 discharge_to_source_value		VARCHAR2(50)		NULL ,
	 preceding_visit_occurrence_id	INTEGER			NULL
    )
;



CREATE TABLE procedure_occurrence
    (
     procedure_occurrence_id		INTEGER			NOT NULL ,
     person_id						INTEGER			NOT NULL ,
     procedure_concept_id			INTEGER			NOT NULL ,
     procedure_date					DATE			NOT NULL ,
     procedure_datetime					TIMESTAMP WITH TIME ZONE			NOT NULL ,
     procedure_type_concept_id		INTEGER			NOT NULL ,
	 modifier_concept_id			INTEGER			NULL ,
	 quantity						INTEGER			NULL ,
     provider_id					INTEGER			NULL ,
     visit_occurrence_id			INTEGER			NULL ,
     procedure_source_value			VARCHAR2(50)		NULL ,
	 procedure_source_concept_id	INTEGER			NULL ,
	 qualifier_source_value			VARCHAR2(50)		NULL
    )
;



CREATE TABLE drug_exposure
    (
     drug_exposure_id				INTEGER			NOT NULL ,
     person_id						INTEGER			NOT NULL ,
     drug_concept_id				INTEGER			NOT NULL ,
     drug_exposure_start_date		DATE			NOT NULL ,
     drug_exposure_start_datetime	TIMESTAMP WITH TIME ZONE			NOT NULL ,
     drug_exposure_end_date			DATE			NOT NULL ,
     drug_exposure_end_datetime		TIMESTAMP WITH TIME ZONE			NULL ,
     verbatim_end_date				DATE			NULL ,
	 drug_type_concept_id			INTEGER			NOT NULL ,
     stop_reason					VARCHAR2(20)		NULL ,
     refills						INTEGER			NULL ,
     quantity						FLOAT			NULL ,
     days_supply					INTEGER			NULL ,
     sig							CLOB	NULL ,
	 route_concept_id				INTEGER			NULL ,
	 lot_number						VARCHAR2(50)		NULL ,
     provider_id					INTEGER			NULL ,
     visit_occurrence_id			INTEGER			NULL ,
     drug_source_value				VARCHAR2(50)		NULL ,
	 drug_source_concept_id			INTEGER			NULL ,
	 route_source_value				VARCHAR2(50)		NULL ,
	 dose_unit_source_value			VARCHAR2(50)		NULL
    )
;


CREATE TABLE device_exposure
    (
     device_exposure_id				INTEGER			NOT NULL ,
     person_id						INTEGER			NOT NULL ,
     device_concept_id				INTEGER			NOT NULL ,
     device_exposure_start_date		DATE			NOT NULL ,
     device_exposure_start_datetime		TIMESTAMP WITH TIME ZONE			NOT NULL ,
     device_exposure_end_date		DATE			NULL ,
     device_exposure_end_datetime		TIMESTAMP WITH TIME ZONE			NULL ,
     device_type_concept_id			INTEGER			NOT NULL ,
	 unique_device_id				VARCHAR2(50)		NULL ,
	 quantity						INTEGER			NULL ,
     provider_id					INTEGER			NULL ,
     visit_occurrence_id			INTEGER			NULL ,
     device_source_value			VARCHAR2(100)	NULL ,
	 device_source_concept_id		INTEGER			NULL
    )
;


CREATE TABLE condition_occurrence
    (
     condition_occurrence_id		INTEGER			NOT NULL ,
     person_id						INTEGER			NOT NULL ,
     condition_concept_id			INTEGER			NOT NULL ,
     condition_start_date			DATE			NOT NULL ,
     condition_start_datetime			TIMESTAMP WITH TIME ZONE			NOT NULL ,
     condition_end_date				DATE			NULL ,
     condition_end_datetime				TIMESTAMP WITH TIME ZONE			NULL ,
     condition_type_concept_id		INTEGER			NOT NULL ,
     stop_reason					VARCHAR2(20)		NULL ,
     provider_id					INTEGER			NULL ,
     visit_occurrence_id			INTEGER			NULL ,
     condition_source_value			VARCHAR2(50)		NULL ,
	 condition_source_concept_id	INTEGER			NULL ,
	 condition_status_source_value	VARCHAR2(50)		NULL ,
     condition_status_concept_id	INTEGER			NULL
    )
;



CREATE TABLE measurement
    (
     measurement_id					INTEGER			NOT NULL ,
     person_id						INTEGER			NOT NULL ,
     measurement_concept_id			INTEGER			NOT NULL ,
     measurement_date				DATE			NOT NULL ,
     measurement_datetime				TIMESTAMP WITH TIME ZONE		NULL ,
	 measurement_type_concept_id	INTEGER			NOT NULL ,
	 operator_concept_id			INTEGER			NULL ,
     value_as_number				FLOAT			NULL ,
     value_as_concept_id			INTEGER			NULL ,
     unit_concept_id				INTEGER			NULL ,
     range_low						FLOAT			NULL ,
     range_high						FLOAT			NULL ,
     provider_id					INTEGER			NULL ,
     visit_occurrence_id			INTEGER			NULL ,
     measurement_source_value		VARCHAR2(50)		NULL ,
	 measurement_source_concept_id	INTEGER			NULL ,
     unit_source_value				VARCHAR2(50)		NULL ,
	 value_source_value				VARCHAR2(50)		NULL
    )
;



CREATE TABLE note
    (
     note_id						INTEGER			NOT NULL ,
     person_id						INTEGER			NOT NULL ,
     note_date						DATE			NOT NULL ,
	 note_datetime						TIMESTAMP WITH TIME ZONE		NULL ,
	 note_type_concept_id			INTEGER			NOT NULL ,
	 note_class_concept_id			INTEGER			NOT NULL ,
	 note_title						VARCHAR2(250)	NULL ,
	 note_text						CLOB	NOT NULL ,
	 encoding_concept_id			INTEGER			NOT NULL ,
	 language_concept_id			INTEGER			NOT NULL ,
     provider_id					INTEGER			NULL ,
	 visit_occurrence_id			INTEGER			NULL ,
	 note_source_value				VARCHAR2(50)		NULL
    )
;


/*This table is new in CDM v5.2*/
CREATE TABLE note_nlp
(
  note_nlp_id					NUMBER(19)		NOT NULL ,
  note_id						INTEGER			NOT NULL ,
  section_concept_id			INTEGER			NULL ,
  snippet						VARCHAR2(250)	NULL ,
  offset						VARCHAR2(250)	NULL ,
  lexical_variant				VARCHAR2(250)	NOT NULL ,
  note_nlp_concept_id			INTEGER			NULL ,
  note_nlp_source_concept_id	INTEGER			NULL ,
  nlp_system					VARCHAR2(250)	NULL ,
  nlp_date						DATE			NOT NULL ,
  nlp_datetime					TIMESTAMP WITH TIME ZONE		NULL ,
  term_exists					CHAR(1)		NULL ,
  term_temporal					VARCHAR2(50)		NULL ,
  term_modifiers				VARCHAR2(2000)	NULL
)
;

CREATE TABLE observation
    (
     observation_id					INTEGER			NOT NULL ,
     person_id						INTEGER			NOT NULL ,
     observation_concept_id			INTEGER			NOT NULL ,
     observation_date				DATE			NOT NULL ,
     observation_datetime				TIMESTAMP WITH TIME ZONE		NULL ,
     observation_type_concept_id	INTEGER			NOT NULL ,
	 value_as_number				FLOAT			NULL ,
     value_as_string				VARCHAR2(60)		NULL ,
     value_as_concept_id			INTEGER			NULL ,
	 qualifier_concept_id			INTEGER			NULL ,
     unit_concept_id				INTEGER			NULL ,
     provider_id					INTEGER			NULL ,
     visit_occurrence_id			INTEGER			NULL ,
     observation_source_value		VARCHAR2(50)		NULL ,
	 observation_source_concept_id	INTEGER			NULL ,
     unit_source_value				VARCHAR2(50)		NULL ,
	 qualifier_source_value			VARCHAR2(50)		NULL
    )
;



CREATE TABLE fact_relationship
    (
     domain_concept_id_1			INTEGER			NOT NULL ,
	 fact_id_1						INTEGER			NOT NULL ,
	 domain_concept_id_2			INTEGER			NOT NULL ,
	 fact_id_2						INTEGER			NOT NULL ,
	 relationship_concept_id		INTEGER			NOT NULL
	)
;




/************************

Standardized health system data

************************/



CREATE TABLE location
    (
     location_id					INTEGER			NOT NULL ,
     address_1						VARCHAR2(50)		NULL ,
     address_2						VARCHAR2(50)		NULL ,
     city							VARCHAR2(50)		NULL ,
     state							CHAR(2)		NULL ,
     zip							VARCHAR2(9)		NULL ,
     county							VARCHAR2(20)		NULL ,
     location_source_value			VARCHAR2(50)		NULL
    )
;



CREATE TABLE care_site
    (
     care_site_id						INTEGER			NOT NULL ,
	 care_site_name						VARCHAR2(255)	NULL ,
     place_of_service_concept_id		INTEGER			NULL ,
     location_id						INTEGER			NULL ,
     care_site_source_value				VARCHAR2(50)		NULL ,
     place_of_service_source_value		VARCHAR2(50)		NULL
    )
;



CREATE TABLE provider
    (
     provider_id					INTEGER			NOT NULL ,
	 provider_name					VARCHAR2(255)	NULL ,
     NPI							VARCHAR2(20)		NULL ,
     DEA							VARCHAR2(20)		NULL ,
     specialty_concept_id			INTEGER			NULL ,
     care_site_id					INTEGER			NULL ,
	 year_of_birth					INTEGER			NULL ,
	 gender_concept_id				INTEGER			NULL ,
     provider_source_value			VARCHAR2(50)		NULL ,
     specialty_source_value			VARCHAR2(50)		NULL ,
	 specialty_source_concept_id	INTEGER			NULL ,
	 gender_source_value			VARCHAR2(50)		NULL ,
	 gender_source_concept_id		INTEGER			NULL
    )
;




/************************

Standardized health economics

************************/


CREATE TABLE payer_plan_period
    (
     payer_plan_period_id			INTEGER			NOT NULL ,
     person_id						INTEGER			NOT NULL ,
     payer_plan_period_start_date	DATE			NOT NULL ,
     payer_plan_period_end_date		DATE			NOT NULL ,
     payer_source_value				VARCHAR2 (50)	NULL ,
     plan_source_value				VARCHAR2 (50)	NULL ,
     family_source_value			VARCHAR2 (50)	NULL
    )
;



CREATE TABLE cost
    (
     cost_id					INTEGER	    NOT NULL ,
     cost_event_id       INTEGER     NOT NULL ,
     cost_domain_id       VARCHAR2(20)    NOT NULL ,
     cost_type_concept_id       INTEGER     NOT NULL ,
     currency_concept_id			INTEGER			NULL ,
     total_charge						FLOAT			NULL ,
     total_cost						FLOAT			NULL ,
     total_paid						FLOAT			NULL ,
     paid_by_payer					FLOAT			NULL ,
     paid_by_patient						FLOAT			NULL ,
     paid_patient_copay						FLOAT			NULL ,
     paid_patient_coinsurance				FLOAT			NULL ,
     paid_patient_deductible			FLOAT			NULL ,
     paid_by_primary						FLOAT			NULL ,
     paid_ingredient_cost				FLOAT			NULL ,
     paid_dispensing_fee					FLOAT			NULL ,
     payer_plan_period_id			INTEGER			NULL ,
     amount_allowed		FLOAT			NULL ,
     revenue_code_concept_id		INTEGER			NULL ,
     reveue_code_source_value    VARCHAR2(50)   NULL ,
	 drg_concept_id			INTEGER		NULL,
     drg_source_value		CHAR(3)		NULL
    )
;





/************************

Standardized derived elements

************************/

CREATE TABLE cohort
    (
	 cohort_definition_id			INTEGER			NOT NULL ,
     subject_id						INTEGER			NOT NULL ,
	 cohort_start_date				DATE			NOT NULL ,
     cohort_end_date				DATE			NOT NULL
    )
;


CREATE TABLE cohort_attribute
    (
	 cohort_definition_id			INTEGER			NOT NULL ,
     cohort_start_date				DATE			NOT NULL ,
     cohort_end_date				DATE			NOT NULL ,
     subject_id						INTEGER			NOT NULL ,
     attribute_definition_id		INTEGER			NOT NULL ,
	 value_as_number				FLOAT			NULL ,
	 value_as_concept_id			INTEGER			NULL
    )
;




CREATE TABLE drug_era
    (
     drug_era_id					INTEGER			NOT NULL ,
     person_id						INTEGER			NOT NULL ,
     drug_concept_id				INTEGER			NOT NULL ,
     drug_era_start_date			DATE			NOT NULL ,
     drug_era_end_date				DATE			NOT NULL ,
     drug_exposure_count			INTEGER			NULL ,
	 gap_days						INTEGER			NULL
    )
;


CREATE TABLE dose_era
    (
     dose_era_id					INTEGER			NOT NULL ,
     person_id						INTEGER			NOT NULL ,
     drug_concept_id				INTEGER			NOT NULL ,
	 unit_concept_id				INTEGER			NOT NULL ,
	 dose_value						FLOAT			NOT NULL ,
     dose_era_start_date			DATE			NOT NULL ,
     dose_era_end_date				DATE			NOT NULL
    )
;




CREATE TABLE condition_era
    (
     condition_era_id				INTEGER			NOT NULL ,
     person_id						INTEGER			NOT NULL ,
     condition_concept_id			INTEGER			NOT NULL ,
     condition_era_start_date		DATE			NOT NULL ,
     condition_era_end_date			DATE			NOT NULL ,
     condition_occurrence_count		INTEGER			NULL
    )
;


