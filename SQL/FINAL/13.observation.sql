/**************************************
 --encoding : UTF-8
 --Author: 조재형
 --Date: 2018.02.22
 
@NHISDatabaseSchema : DB containing NHIS National Sample cohort DB
@ResultDatabaseSchema : DB for NHIS-NSC in CDM format
@NHIS_JK: JK table in NHIS NSC
@NHIS_20T: 20 table in NHIS NSC
@NHIS_30T: 30 table in NHIS NSC
@NHIS_40T: 40 table in NHIS NSC
@NHIS_60T: 60 table in NHIS NSC
@NHIS_GJ: GJ table in NHIS NSC
@NHIS_GJ_vertical : GJ table from NHIS NSC, which was vertically transformatted
@CONDITION_MAPPINGTABLE : mapping table between KCD and OMOP vocabulary
@DRUG_MAPPINGTABLE : mapping table between EDI and OMOP vocabulary
@PROCEDURE_MAPPINGTABLE : mapping table between Korean procedure and OMOP vocabulary
@DEVICE_MAPPINGTABLE : mapping table between EDI and OMOP vocabulary
 
 --Description: OBSERVATION 테이블 생성
 --Generating Table: OBSERVATION
***************************************/

/**************************************
 1. 테이블 생성 
***************************************/ 
--drop table CDM_ONE_MIL.OBSERVATION
--drop table #observation_mapping
--drop table #observation_mapping09

--IF OBJECT_ID(@ResultDatabaseSchema.OBSERVATION', 'U') IS NULL
--drop table CDM_ONE_MIL.OBSERVATION;

CREATE TABLE CDM_ONE_MIL.OBSERVATION
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

-- observation mapping table(temp)
CREATE TABLE observation_mapping
    (
     meas_type						varchar2(50)					NULL , 
     id_value						varchar2(50)					NULL ,
     answer							INTEGER						NULL ,
     observation_concept_id			INTEGER						NULL ,
	 observation_type_concept_id	INTEGER						NULL ,
	 observation_unit_concept_id	INTEGER						NULL ,
	 value_as_concept_id			INTEGER						NULL ,
	 value_as_number				float						NULL 
	)
;
	
-- insert mapping data
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD1', '20', 1, 4058267, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD1', '20', 2, 43021368, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD1', '20', 3, 4058725, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD1', '20', 4, 4058286, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD1', '20', 5, 4077352, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD1', '20', 6, 4077982, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD1', '20', 7, 4058709, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD1', '20', 8, 4144289, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD1', '20', 9, 4195979, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD2', '21', 1, 4058267, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD2', '21', 2, 43021368, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD2', '21', 3, 4058725, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD2', '21', 4, 4058286, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD2', '21', 5, 4077352, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD2', '21', 6, 4077982, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD2', '21', 7, 4058709, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD2', '21', 8, 4144289, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD2', '21', 9, 4195979, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD3', '22', 1, 4058267, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD3', '22', 2, 43021368, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD3', '22', 3, 4058725, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD3', '22', 4, 4058286, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD3', '22', 5, 4077352, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD3', '22', 6, 4077982, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD3', '22', 7, 4058709, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD3', '22', 8, 4144289, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PMH_CD3', '22', 9, 4195979, 44814721, null, null, null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_APOP_PMH_YN',		'23',	1,		4077982,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_HDISE_PMH_YN',		'24',	1,		4077352,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_HPRTS_PMH_YN',		'25',	1,		4058286,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_DIABML_PMH_YN',	'26',	1,		4058709,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_HPLPDM_PMH_YN',	'27',	1,		4058275,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_ETCDSE_PMH_YN',	'28',	1,		44834226,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('HCHK_PHSS_PMH_YN',		'29',	1,		4058267,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('FMLY_LIVER_DISE_PATIEN_YN', '30', 1,	4144266,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('FMLY_HPRTS_PATIEN_YN',	'31',	0,		4053372,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('FMLY_HPRTS_PATIEN_YN',	'31',	1,		4050816,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('FMLY_APOP_PATIEN_YN',	'32',	0,		4175587,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('FMLY_APOP_PATIEN_YN',	'32',	1,		4169009,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('FMLY_HDISE_PATIEN_YN',	'33',	0,		4050792,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('FMLY_HDISE_PATIEN_YN',	'33',	1,		4173498,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('FMLY_DIABML_PATIEN_YN',	'34',	0,		4051106,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('FMLY_DIABML_PATIEN_YN',	'34',	1,		4051114,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('FMLY_CANCER_PATIEN_YN',	'35',	0,		4051100,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('FMLY_CANCER_PATIEN_YN',	'35',	1,		4171594,		44814721,	null,		null,		null) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('SMK_STAT_TYPE_RSPS_CD',	'36',	1,		4222303,		44814721,	NULL,		NULL,		NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('SMK_STAT_TYPE_RSPS_CD',	'36',	2,		4310250,		44814721,	NULL,		NULL,		NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('SMK_STAT_TYPE_RSPS_CD',	'36',	3,		4276526,		44814721,	NULL,		NULL,		NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('SMK_TERM_RSPS_CD',		'37',	1,		40766364,		44818704,	NULL,		NULL,		2.5)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('SMK_TERM_RSPS_CD',		'37',	2,		40766364,		44818704,	NULL,		NULL,		7.5)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('SMK_TERM_RSPS_CD',		'37',	3,		40766364,		44818704,	NULL,		NULL,		15)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('SMK_TERM_RSPS_CD',		'37',	4,		40766364,		44818704,	NULL,		NULL,		25)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('SMK_TERM_RSPS_CD',		'37',	5,		40766364,		44818704,	NULL,		NULL,		30)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('CUR_SMK_TERM_RSPS_CD',	'38',	0,		40766364,		44818704,	9448,		NULL,		NULL)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('CUR_DSQTY_RSPS_CD',		'39',	0,		40766929,		44818704,	45756923,	NULL,		NULL)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('PAST_SMK_TERM_RSPS_CD',	'40',	0,		40766364,		44818704,	9448,		NULL,		NULL)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('PAST_DSQTY_RSPS_CD',	'41',	0,		40766930,		44818704,	45756923,	NULL,		NULL)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DSQTY_RSPS_CD',			'42',	1,		40766929,		44818704,	45756954,	NULL,		0.25)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DSQTY_RSPS_CD',			'42',	2,		40766929,		44818704,	45756954,	NULL,		0.75)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DSQTY_RSPS_CD',			'42',	3,		40766929,		44818704,	45756954,	NULL,		1.5)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DSQTY_RSPS_CD',			'42',	4,		40766929,		44818704,	45756954,	NULL,		2)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DRNK_HABIT_RSPS_CD',	'43',	1,		40771103,		44818704,	NULL,		45882527,	NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DRNK_HABIT_RSPS_CD',	'43',	2,		40771103,		44818704,	NULL,		45885249,	NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DRNK_HABIT_RSPS_CD',	'43',	3,		40771103,		44818704,	NULL,		45881653,	NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DRNK_HABIT_RSPS_CD',	'43',	4,		40771103,		44818704,	NULL,		45885248,	NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DRNK_HABIT_RSPS_CD',	'43',	5,		40771103,		44818704,	NULL,		45879676,	NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('TM1_DRKQTY_RSPS_CD',	'44',	1,		3037705,		44818704,	4045131,	NULL,		3.5)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('TM1_DRKQTY_RSPS_CD',	'44',	2,		3037705,		44818704,	4045131,	NULL,		7)		 ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('TM1_DRKQTY_RSPS_CD',	'44',	3,		3037705,		44818704,	4045131,	NULL,		10.5)	 ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('TM1_DRKQTY_RSPS_CD',	'44',	4,		3037705,		44818704,	4045131,	NULL,		14)	 ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('EXERCI_FREQ_RSPS_CD',	'45',	1,		4036426,		44818704,	NULL,		45882527,	NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('EXERCI_FREQ_RSPS_CD',	'45',	2,		4036426,		44818704,	NULL,		45881653,	NULL)																						    ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('EXERCI_FREQ_RSPS_CD',	'45',	3,		4036426,		44818704,	NULL,		45885248,	NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('EXERCI_FREQ_RSPS_CD',	'45',	4,		4036426,		44818704,	NULL,		45883166,	NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('EXERCI_FREQ_RSPS_CD',	'45',	5,		4036426,		44818704,	NULL,		45879676,	NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('MOV20_WEK_FREQ_ID',		'46',	0,		82020119,		44818704,	NULL,		NULL,		NULL)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('MOV30_WEK_FREQ_ID',		'47',	0,		82020120,		44818704,	NULL,		NULL,		NULL)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('WLK30_WEK_FREQ_ID',		'48',	0,		82020121,		44818704,	NULL,		NULL,		NULL)  ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('CTRB_PT_TYPE_CD',		'49',	0,		3004572,		44814721,	4155146,	NULL,		NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('CTRB_PT_TYPE_CD',		'49',	1,		3004572,		44814721,	4155146,	NULL,		NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('CTRB_PT_TYPE_CD',		'49',	2,		3004572,		44814721,	4155146,	NULL,		NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('CTRB_PT_TYPE_CD',		'49',	3,		3004572,		44814721,	4155146,	NULL,		NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('CTRB_PT_TYPE_CD',		'49',	4,		3004572,		44814721,	4155146,	NULL,		NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('CTRB_PT_TYPE_CD',		'49',	5,		3004572,		44814721,	4155146,	NULL,		NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('CTRB_PT_TYPE_CD',		'49',	6,		3004572,		44814721,	4155146,	NULL,		NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('CTRB_PT_TYPE_CD',		'49',	7,		3004572,		44814721,	4155146,	NULL,		NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('CTRB_PT_TYPE_CD',		'49',	8,		3004572,		44814721,	4155146,	NULL,		NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('CTRB_PT_TYPE_CD',		'49',	9,		3004572,		44814721,	4155146,	NULL,		NULL) ;
insert into observation_mapping (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('CTRB_PT_TYPE_CD',		'49',	10,		3004572,		44814721,	4155146,	NULL,		NULL) ;



/**************************************
 2. 코드형 데이터 입력 (14768634개 행이 영향을 받음)
***************************************/ 
INSERT INTO CDM_ONE_MIL.OBSERVATION (observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_As_string, value_as_concept_id,
										qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value)

	select	case	when a.meas_type = 'HCHK_PMH_CD1' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'HCHK_PMH_CD2' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'HCHK_PMH_CD3' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'HCHK_APOP_PMH_YN' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'HCHK_HDISE_PMH_YN' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'HCHK_HPRTS_PMH_YN' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'HCHK_DIABML_PMH_YN' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'HCHK_HPLPDM_PMH_YN' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'HCHK_ETCDSE_PMH_YN' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'HCHK_PHSS_PMH_YN' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'FMLY_LIVER_DISE_PATIEN_YN' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'FMLY_HPRTS_PATIEN_YN' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'FMLY_APOP_PATIEN_YN' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'FMLY_HDISE_PATIEN_YN' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'FMLY_DIABML_PATIEN_YN' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'FMLY_CANCER_PATIEN_YN' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'SMK_STAT_TYPE_RSPS_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'SMK_TERM_RSPS_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'DSQTY_RSPS_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'DRNK_HABIT_RSPS_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'TM1_DRKQTY_RSPS_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'EXERCI_FREQ_RSPS_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					end as observation_id,
			a.person_id as person_id,
			b.observation_concept_id as observation_concept_id,
			to_date(a.hchk_year||'0101','yyyy-mm-dd') as observation_date,
			null as observation_datetime,
			b.observation_type_concept_id as observation_type_concept_id,
            
            CASE WHEN b.answer is not null
                then a.meas_value
                else b.value_as_number
            END as value_as_number,
            
			null as value_as_string,
			b.value_as_concept_id as value_as_concept_id,
			null as qualifier_source_value,
			null as unit_concept_id,
			null as provider_id,
			a.master_seq AS visit_occurrence_id,
			a.meas_value as observation_source_value,
			null as observation_source_concept_id,
			null as unit_source_value,
			null as qualifier_source_Value

	from (select master_seq, hchk_year, person_id, ykiho_gubun_cd, meas_type, 
				--가족력(FMLY_로 시작하는 변수)  유무 변수 08년까진 1, 2로 기록, 09년부터는 0, 1로 기록 고려
				case	when meas_type in('FMLY_LIVER_DISE_PATIEN_YN', 'FMLY_HPRTS_PATIEN_YN', 'FMLY_APOP_PATIEN_YN', 'FMLY_HDISE_PATIEN_YN', 'FMLY_DIABML_PATIEN_YN', 'FMLY_CANCER_PATIEN_YN') 
							and hchk_year in ('2002', '2003', '2004', '2005', '2006', '2007', '2008') then cast(meas_value as INTEGER)-1
				else meas_value
				end as meas_value 			
			from NHIS.GJ_VERTICAL) a
		JOIN observation_mapping b 
		on NVL(a.meas_type,'') = NVL(b.meas_type,'') 
	        and nvl(cast(a.meas_value as number(8)),0) = nvl(cast(b.answer as number(8)),0)
	where (a.meas_value IS NOT NULL and a.meas_type in ('HCHK_PMH_CD1', 'HCHK_PMH_CD2', 'HCHK_PMH_CD3','HCHK_APOP_PMH_YN', 'HCHK_HDISE_PMH_YN', 'HCHK_HPRTS_PMH_YN', 
																	'HCHK_DIABML_PMH_YN', 'HCHK_HPLPDM_PMH_YN', 'HCHK_ETCDSE_PMH_YN', 'HCHK_PHSS_PMH_YN', 'FMLY_LIVER_DISE_PATIEN_YN', 'FMLY_HPRTS_PATIEN_YN', 
																	'FMLY_APOP_PATIEN_YN', 'FMLY_HDISE_PATIEN_YN', 'FMLY_DIABML_PATIEN_YN', 'FMLY_CANCER_PATIEN_YN', 'SMK_STAT_TYPE_RSPS_CD', 'SMK_TERM_RSPS_CD',
																	 'DSQTY_RSPS_CD', 'EXERCI_FREQ_RSPS_CD')
		or(a.meas_value IS NOT NULL and a.meas_type in ('DRNK_HABIT_RSPS_CD', 'TM1_DRKQTY_RSPS_CD') and a.hchk_year in ('2002', '2003', '2004', '2005', '2006', '2007', '2008')))
;



/**************************************
 2. 수치형 데이터 입력 (4468917개 행이 영향을 받음)
***************************************/ 
INSERT INTO CDM_ONE_MIL.OBSERVATION (observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_As_string, value_as_concept_id,
										qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value)

	select	case	when a.meas_type = 'CUR_SMK_TERM_RSPS_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'CUR_DSQTY_RSPS_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'PAST_SMK_TERM_RSPS_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'PAST_DSQTY_RSPS_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'MOV20_WEK_FREQ_ID' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'MOV30_WEK_FREQ_ID' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'WLK30_WEK_FREQ_ID' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					end as observation_id,
			a.person_id as person_id,
			b.observation_concept_id as observation_concept_id,
			to_date(a.hchk_year||'0101','yyyy-mm-dd') as observation_date,
			null as observation_datetime,
			b.observation_type_concept_id as observation_type_concept_id,
				CASE WHEN b.answer is not null
				then a.meas_value
				else b.value_as_number
				END as value_as_number,
			null as value_as_string,
			b.value_as_concept_id as value_as_concept_id,
			null as qualifier_source_value,
			b.observation_unit_concept_id as unit_concept_id ,
			null as provider_id,
			a.master_seq as visit_occurrence_id,
			a.meas_value as observation_source_value,
			null as observation_source_concept_id,
			null as unit_source_value,
			null as qualifier_source_Value

	from (select master_seq, hchk_year, person_id, ykiho_gubun_cd, meas_type, meas_value
			from NHIS.GJ_VERTICAL) a
		JOIN observation_mapping b 
		on nvl(a.meas_type,'') = nvl(b.meas_type,'') 
	        and nvl(cast(a.meas_value as number(8)),0) >= nvl(cast(b.answer as number(8)),0)
	where (a.meas_value IS NOT NULL and a.meas_type in ('CUR_SMK_TERM_RSPS_CD', 'CUR_DSQTY_RSPS_CD', 'PAST_SMK_TERM_RSPS_CD', 'PAST_DSQTY_RSPS_CD', 
																	'MOV20_WEK_FREQ_ID', 'MOV30_WEK_FREQ_ID', 'WLK30_WEK_FREQ_ID'))
;


/**************************************
 2. 09년부터 응답이 바뀌는 음주 수치 입력 (693930개 행이 영향을 받음)
***************************************/ 
--temp mapping table

CREATE TABLE observation_mapping09
    (
     meas_type						varchar2(50)					NULL , 
     id_value						varchar2(50)					NULL ,
     answer							integer						NULL ,
     observation_concept_id			integer						NULL ,
	 observation_type_concept_id	integer						NULL ,
	 observation_unit_concept_id	integer						NULL ,
	 value_as_concept_id			integer						NULL ,
	 value_as_number				float						NULL 
	)
;


insert into observation_mapping09 (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DRNK_HABIT_RSPS_CD',	'43',	1,		40771103,		44818704,	45881908,		NULL,		0);
insert into observation_mapping09 (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DRNK_HABIT_RSPS_CD',	'43',	2,		40771103,		44818704,	45881908,		NULL,		1);
insert into observation_mapping09 (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DRNK_HABIT_RSPS_CD',	'43',	3,		40771103,		44818704,	45881908,		NULL,		2);
insert into observation_mapping09 (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DRNK_HABIT_RSPS_CD',	'43',	4,		40771103,		44818704,	45881908,		NULL,		3);
insert into observation_mapping09 (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DRNK_HABIT_RSPS_CD',	'43',	5,		40771103,		44818704,	45881908,		NULL,		4);
insert into observation_mapping09 (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DRNK_HABIT_RSPS_CD',	'43',	6,		40771103,		44818704,	45881908,		NULL,		5);
insert into observation_mapping09 (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DRNK_HABIT_RSPS_CD',	'43',	7,		40771103,		44818704,	45881908,		NULL,		6);
insert into observation_mapping09 (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('DRNK_HABIT_RSPS_CD',	'43',	8,		40771103,		44818704,	45881908,		NULL,		7);
insert into observation_mapping09 (meas_type, id_value, answer, observation_concept_id, observation_type_concept_id, observation_unit_concept_id, value_as_concept_id, value_as_number) values ('TM1_DRKQTY_RSPS_CD',	'44',	NULL,		3037705,		44818704,	4045131,		NULL,		NULL) ;



INSERT INTO CDM_ONE_MIL.OBSERVATION (observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_As_string, value_as_concept_id,
										qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value)

select	case	when a.meas_type = 'TM1_DRKQTY_RSPS_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
				end as observation_id,
			a.person_id as person_id,
			b.observation_concept_id as observation_concept_id,
			to_date(a.hchk_year||'0101','yyyy-mm-dd') as observation_date,
			null as observation_datetime,
			b.observation_type_concept_id as observation_type_concept_id,
				CASE WHEN b.answer is not null
				then b.value_as_number
				else a.meas_value
				END as value_as_number,
			null as value_as_string,
			b.value_as_concept_id as value_as_concept_id,
			null as qualifier_source_value,
			b.observation_unit_concept_id as unit_concept_id ,
			null as provider_id,
            a.master_seq as visit_occurrence_id,
			a.meas_value as observation_source_value,
			null as observation_source_concept_id,
			null as unit_source_value,
			null as qualifier_source_Value

	from (select master_seq, hchk_year, person_id, ykiho_gubun_cd, meas_type, meas_value
			from NHIS.GJ_VERTICAL) a
		JOIN observation_mapping09 b 
		on nvl(a.meas_type,'') = nvl(b.meas_type,'') 
	        and nvl(cast(a.meas_value as number(8)),0) >= nvl(cast(b.answer as number(8)),0)
	where (a.meas_value IS NOT NULL and a.meas_type in ('TM1_DRKQTY_RSPS_CD') and a.hchk_year in ('2009', '2010', '2011', '2012', '2013'))
;

/**************************************
 2. 09년부터 응답이 바뀌는 음주 코드 입력 (1147565개 행이 영향을 받음)
***************************************/ 
--temp mapping table



INSERT INTO CDM_ONE_MIL.OBSERVATION (observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_As_string, value_as_concept_id,
										qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value)

	select	case	when a.meas_type = 'DRNK_HABIT_RSPS_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					end as observation_id,
			a.person_id as person_id,
			b.observation_concept_id as observation_concept_id,
			to_date(a.hchk_year||'0101','yyyy-mm-dd') as observation_date,
			null as observation_datetime,
			b.observation_type_concept_id as observation_type_concept_id,
				CASE WHEN b.answer is not null
				then b.value_as_number
				else a.meas_value
				END as value_as_number,
			null as value_as_string,
			b.value_as_concept_id as value_as_concept_id,
			null as qualifier_source_value,
			b.observation_unit_concept_id as unit_concept_id ,
			null as provider_id,
			a.master_seq as visit_occurrence_id,
			a.meas_value as observation_source_value,
			null as observation_source_concept_id,
			null as unit_source_value,
			null as qualifier_source_Value

	from (select master_seq, hchk_year, person_id, ykiho_gubun_cd, meas_type, meas_value
			from NHIS.GJ_VERTICAL) a
		JOIN observation_mapping09 b 
		on nvl(a.meas_type,'') = nvl(b.meas_type,'') 
	        and nvl(cast(a.meas_value as number(8)),0) = nvl(cast(b.answer as number(8)),0)
	where (a.meas_value IS NOT NULL and a.meas_type in ('DRNK_HABIT_RSPS_CD') and a.hchk_year in ('2009', '2010', '2011', '2012', '2013'))
;



/**************************************
 2. 소득분위 데이터 입력 (11716257개 행이 영향을 받음)
***************************************/ 
INSERT INTO CDM_ONE_MIL.OBSERVATION (observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_As_string, value_as_concept_id,
										qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value)

	


	select	row_number() OVER(order by a.person_id asc) as observation_id,
			a.person_id as person_id,
			b.observation_concept_id as observation_concept_id,
			to_date(a.STND_Y||'0101','yyyy-mm-dd') as observation_date,
			null as observation_datetime,
			b.observation_type_concept_id as observation_type_concept_id,
				CASE WHEN b.answer is not null
				then a.CTRB_PT_TYPE_CD
				else b.value_as_number
				END as value_as_number,
			null as value_as_string,

			b.value_as_concept_id as value_as_concept_id,
			null as qualifier_source_value,
			b.observation_unit_concept_id as unit_concept_id ,
			null as provider_id,
			null as visit_occurrence_id ,
			a.CTRB_PT_TYPE_CD as observation_source_value,
			null as observation_source_concept_id,
			null as unit_source_value,
			null as qualifier_source_Value

	from (select STND_Y, PERSON_ID, cast(CTRB_PT_TYPE_CD as NUMBER(3))as CTRB_PT_TYPE_CD from NHIS.NHIS_JK) a
		JOIN observation_mapping b 
			on nvl(a.CTRB_PT_TYPE_CD,'') = nvl(b.answer,'') 
	where a.CTRB_PT_TYPE_CD is not null and b.meas_type = 'CTRB_PT_TYPE_CD'
;




/*****************************************************
					테이블 확인
*****************************************************/

--------------변환전 건수
select distinct meas_type, count(meas_type)
from NHIS.GJ_VERTICAL
where meas_value is not null  and meas_type in ('HCHK_PMH_CD1', 'HCHK_PMH_CD2', 'HCHK_PMH_CD3','HCHK_APOP_PMH_YN', 'HCHK_HDISE_PMH_YN', 'HCHK_HPRTS_PMH_YN', 
																	'HCHK_DIABML_PMH_YN', 'HCHK_HPLPDM_PMH_YN', 'HCHK_ETCDSE_PMH_YN', 'HCHK_PHSS_PMH_YN', 'FMLY_LIVER_DISE_PATIEN_YN', 'FMLY_HPRTS_PATIEN_YN', 
																	'FMLY_APOP_PATIEN_YN', 'FMLY_HDISE_PATIEN_YN', 'FMLY_DIABML_PATIEN_YN', 'FMLY_CANCER_PATIEN_YN', 'SMK_STAT_TYPE_RSPS_CD', 'SMK_TERM_RSPS_CD', 
																	'DSQTY_RSPS_CD', 'DRNK_HABIT_RSPS_CD', 'TM1_DRKQTY_RSPS_CD', 'EXERCI_FREQ_RSPS_CD', 'CUR_SMK_TERM_RSPS_CD', 'CUR_DSQTY_RSPS_CD', 'PAST_SMK_TERM_RSPS_CD', 'PAST_DSQTY_RSPS_CD', 
																	'MOV20_WEK_FREQ_ID', 'MOV30_WEK_FREQ_ID', 'WLK30_WEK_FREQ_ID')
group by meas_type 
order by meas_type ;
