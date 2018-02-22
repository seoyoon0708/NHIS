CREATE TABLE CDM_ONE_MIL.measurement
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

CREATE TABLE measurement_mapping
    (
     meas_type						varchar(50)					NULL , 
     id_value						varchar(50)					NULL ,
     answer							INTEGER						NULL ,
     measurement_concept_id			INTEGER						NULL ,
	 measurement_type_concept_id	INTEGER						NULL ,
	 measurement_unit_concept_id	INTEGER						NULL ,
	 value_as_concept_id			INTEGER						NULL ,
	 value_as_number				float						NULL 
	)
;

insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('HEIGHT',			'01',	0,	3036277,	44818701,	4122378,	NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('WEIGHT',			'02',	0,	3025315,	44818701,	4122383,	NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('WAIST',				'03',	0,	3016258,	44818701,	4122378,	NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('BP_HIGH',			'04',	0,	3028737,	44818701,	4118323,	NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('BP_LWST',			'05',	0,	3012888,	44818701,	4118323,	NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('BLDS',				'06',	0,	46235168,	44818702,	4121396,	NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('TOT_CHOLE',			'07',	0,	3027114,	44818702,	4121396,	NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('TRIGLYCERIDE',		'08',	0,	3022038,	44818702,	4121396,	NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('HDL_CHOLE',			'09',	0,	3023752,	44818702,	4121396,	NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('LDL_CHOLE',			'10',	0,	3028437,	44818702,	4121396,	NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('HMG',				'11',	0,	3000963,	44818702,	4121395,	NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('GLY_CD',			'12',	1,	3009261,	44818702,	NULL,		9189,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('GLY_CD',			'12',	2,	3009261,	44818702,	NULL,		4127785,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('GLY_CD',			'12',	3,	3009261,	44818702,	NULL,		4123508,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('GLY_CD',			'12',	4,	3009261,	44818702,	NULL,		4126673,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('GLY_CD',			'12',	5,	3009261,	44818702,	NULL,		4125547,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('GLY_CD',			'12',	6,	3009261,	44818702,	NULL,		4126674,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('OLIG_OCCU_CD',		'13',	1,	437038,		44818702,	NULL,		9189,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('OLIG_OCCU_CD',		'13',	2,	437038,		44818702,	NULL,		4127785,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('OLIG_OCCU_CD',		'13',	3,	437038,		44818702,	NULL,		4123508,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('OLIG_OCCU_CD',		'13',	4,	437038,		44818702,	NULL,		4126673,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('OLIG_OCCU_CD',		'13',	5,	437038,		44818702,	NULL,		4125547,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('OLIG_OCCU_CD',		'13',	6,	437038,		44818702,	NULL,		4126674,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('OLIG_PH',			'14',	0,	3015736,	44818702,	8482,		NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('OLIG_PROTE_CD',		'15',	1,	3014051,	44818702,	NULL,		9189,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('OLIG_PROTE_CD',		'15',	2,	3014051,	44818702,	NULL,		4127785,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('OLIG_PROTE_CD',		'15',	3,	3014051,	44818702,	NULL,		4123508,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('OLIG_PROTE_CD',		'15',	4,	3014051,	44818702,	NULL,		4126673,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('OLIG_PROTE_CD',		'15',	5,	3014051,	44818702,	NULL,		4125547,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('OLIG_PROTE_CD',		'15',	6,	3014051,	44818702,	NULL,		4126674,	NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('CREATININE',		'16',	0,	2212294,	44818702,	4121396,	NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('SGOT_AST',			'17',	0,	2212597,	44818702,	4118000,	NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('SGPT_ALT',			'18',	0,	2212598,	44818702,	4118000,	NULL,		NULL);
insert into measurement_mapping (meas_type, id_value, answer, measurement_concept_id, measurement_type_concept_id, measurement_unit_concept_id, value_as_concept_id, value_as_number) values ('GAMMA_GTP',			'19',	0,	4289475,	44818702,	4118000,	NULL,		NULL);																																																												
				
                
/*
--- NEEDED BY ---
	- OBSERVATION_PERIOD
	- MEASUREMENT
*/
CREATE TABLE NHIS.NHIS_GJ
parallel 8
nologging
pctfree 0
as
select 8000000000+rownum visit_occurrence_id,g.*
from (
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,cast(null as NUMBER(3))as WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,cast(null as NUMBER(3))as TRIGLYCERIDE,cast(null as NUMBER(3))as HDL_CHOLE,cast(null as NUMBER(3))as LDL_CHOLE,HMG,cast(GLY_CD as NUMBER(3)) as GLY_CD,cast(OLIG_OCCU_CD as NUMBER(3)) as OLIG_OCCU_CD,						    OLIG_PH,cast(OLIG_PROTE_CD as NUMBER(3)) as OLIG_PROTE_CD,cast(null as NUMBER(3))as CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,cast(HCHK_PMH_CD1 as NUMBER(3)) as HCHK_PMH_CD1,cast(HCHK_PMH_CD2 as NUMBER(3)) as HCHK_PMH_CD2,cast(HCHK_PMH_CD3 as NUMBER(3)) as HCHK_PMH_CD3,cast(FMLY_LIVER_DISE_PATIEN_YN as NUMBER(3)) as FMLY_LIVER_DISE_PATIEN_YN,			 cast(null as NUMBER(3)) as HCHK_APOP_PMH_YN,			  cast(null as NUMBER(3)) as HCHK_HDISE_PMH_YN,				cast(null as NUMBER(3)) as HCHK_HPRTS_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_DIABML_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_HPLPDM_PMH_YN,			 cast(null as NUMBER(3)) as HCHK_PHSS_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_ETCDSE_PMH_YN,cast(FMLY_HPRTS_PATIEN_YN as NUMBER(3)) as FMLY_HPRTS_PATIEN_YN,cast(FMLY_APOP_PATIEN_YN as NUMBER(3)) as FMLY_APOP_PATIEN_YN,cast(FMLY_HDISE_PATIEN_YN as NUMBER(3)) as FMLY_HDISE_PATIEN_YN,cast(FMLY_DIABML_PATIEN_YN as NUMBER(3)) as FMLY_DIABML_PATIEN_YN,cast(FMLY_CANCER_PATIEN_YN as NUMBER(3)) as FMLY_CANCER_PATIEN_YN,cast(SMK_STAT_TYPE_RSPS_CD as NUMBER(3)) as SMK_STAT_TYPE_RSPS_CD,cast(SMK_TERM_RSPS_CD as NUMBER(3)) as SMK_TERM_RSPS_CD,cast(DSQTY_RSPS_CD as NUMBER(3)) as DSQTY_RSPS_CD,cast(DRNK_HABIT_RSPS_CD as NUMBER(3)) as DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,cast(EXERCI_FREQ_RSPS_CD as NUMBER(3)) as EXERCI_FREQ_RSPS_CD,cast(null as NUMBER(3)) as PAST_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as PAST_DSQTY_RSPS_CD,cast(null as NUMBER(3)) as CUR_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as CUR_DSQTY_RSPS_CD,			  cast(null as NUMBER(3)) as MOV20_WEK_FREQ_ID,				cast(null as NUMBER(3)) as MOV30_WEK_FREQ_ID,			  cast(null as NUMBER(3)) as WLK30_WEK_FREQ_ID from NHID_GJ_2002 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,cast(null as NUMBER(3))as WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,cast(null as NUMBER(3))as TRIGLYCERIDE,cast(null as NUMBER(3))as HDL_CHOLE,cast(null as NUMBER(3))as LDL_CHOLE,HMG,cast(GLY_CD as NUMBER(3)) as GLY_CD,cast(OLIG_OCCU_CD as NUMBER(3)) as OLIG_OCCU_CD,						    OLIG_PH,cast(OLIG_PROTE_CD as NUMBER(3)) as OLIG_PROTE_CD,cast(null as NUMBER(3))as CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,cast(HCHK_PMH_CD1 as NUMBER(3)) as HCHK_PMH_CD1,cast(HCHK_PMH_CD2 as NUMBER(3)) as HCHK_PMH_CD2,cast(HCHK_PMH_CD3 as NUMBER(3)) as HCHK_PMH_CD3,cast(FMLY_LIVER_DISE_PATIEN_YN as NUMBER(3)) as FMLY_LIVER_DISE_PATIEN_YN,			 cast(null as NUMBER(3)) as HCHK_APOP_PMH_YN,			  cast(null as NUMBER(3)) as HCHK_HDISE_PMH_YN,				cast(null as NUMBER(3)) as HCHK_HPRTS_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_DIABML_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_HPLPDM_PMH_YN,			 cast(null as NUMBER(3)) as HCHK_PHSS_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_ETCDSE_PMH_YN,cast(FMLY_HPRTS_PATIEN_YN as NUMBER(3)) as FMLY_HPRTS_PATIEN_YN,cast(FMLY_APOP_PATIEN_YN as NUMBER(3)) as FMLY_APOP_PATIEN_YN,cast(FMLY_HDISE_PATIEN_YN as NUMBER(3)) as FMLY_HDISE_PATIEN_YN,cast(FMLY_DIABML_PATIEN_YN as NUMBER(3)) as FMLY_DIABML_PATIEN_YN,cast(FMLY_CANCER_PATIEN_YN as NUMBER(3)) as FMLY_CANCER_PATIEN_YN,cast(SMK_STAT_TYPE_RSPS_CD as NUMBER(3)) as SMK_STAT_TYPE_RSPS_CD,cast(SMK_TERM_RSPS_CD as NUMBER(3)) as SMK_TERM_RSPS_CD,cast(DSQTY_RSPS_CD as NUMBER(3)) as DSQTY_RSPS_CD,cast(DRNK_HABIT_RSPS_CD as NUMBER(3)) as DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,cast(EXERCI_FREQ_RSPS_CD as NUMBER(3)) as EXERCI_FREQ_RSPS_CD,cast(null as NUMBER(3)) as PAST_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as PAST_DSQTY_RSPS_CD,cast(null as NUMBER(3)) as CUR_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as CUR_DSQTY_RSPS_CD,			  cast(null as NUMBER(3)) as MOV20_WEK_FREQ_ID,				cast(null as NUMBER(3)) as MOV30_WEK_FREQ_ID,			  cast(null as NUMBER(3)) as WLK30_WEK_FREQ_ID from NHID_GJ_2003 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,cast(null as NUMBER(3))as WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,cast(null as NUMBER(3))as TRIGLYCERIDE,cast(null as NUMBER(3))as HDL_CHOLE,cast(null as NUMBER(3))as LDL_CHOLE,HMG,cast(GLY_CD as NUMBER(3)) as GLY_CD,cast(OLIG_OCCU_CD as NUMBER(3)) as OLIG_OCCU_CD,						    OLIG_PH,cast(OLIG_PROTE_CD as NUMBER(3)) as OLIG_PROTE_CD,cast(null as NUMBER(3))as CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,cast(HCHK_PMH_CD1 as NUMBER(3)) as HCHK_PMH_CD1,cast(HCHK_PMH_CD2 as NUMBER(3)) as HCHK_PMH_CD2,cast(HCHK_PMH_CD3 as NUMBER(3)) as HCHK_PMH_CD3,cast(FMLY_LIVER_DISE_PATIEN_YN as NUMBER(3)) as FMLY_LIVER_DISE_PATIEN_YN,			 cast(null as NUMBER(3)) as HCHK_APOP_PMH_YN,			  cast(null as NUMBER(3)) as HCHK_HDISE_PMH_YN,				cast(null as NUMBER(3)) as HCHK_HPRTS_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_DIABML_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_HPLPDM_PMH_YN,			 cast(null as NUMBER(3)) as HCHK_PHSS_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_ETCDSE_PMH_YN,cast(FMLY_HPRTS_PATIEN_YN as NUMBER(3)) as FMLY_HPRTS_PATIEN_YN,cast(FMLY_APOP_PATIEN_YN as NUMBER(3)) as FMLY_APOP_PATIEN_YN,cast(FMLY_HDISE_PATIEN_YN as NUMBER(3)) as FMLY_HDISE_PATIEN_YN,cast(FMLY_DIABML_PATIEN_YN as NUMBER(3)) as FMLY_DIABML_PATIEN_YN,cast(FMLY_CANCER_PATIEN_YN as NUMBER(3)) as FMLY_CANCER_PATIEN_YN,cast(SMK_STAT_TYPE_RSPS_CD as NUMBER(3)) as SMK_STAT_TYPE_RSPS_CD,cast(SMK_TERM_RSPS_CD as NUMBER(3)) as SMK_TERM_RSPS_CD,cast(DSQTY_RSPS_CD as NUMBER(3)) as DSQTY_RSPS_CD,cast(DRNK_HABIT_RSPS_CD as NUMBER(3)) as DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,cast(EXERCI_FREQ_RSPS_CD as NUMBER(3)) as EXERCI_FREQ_RSPS_CD,cast(null as NUMBER(3)) as PAST_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as PAST_DSQTY_RSPS_CD,cast(null as NUMBER(3)) as CUR_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as CUR_DSQTY_RSPS_CD,			  cast(null as NUMBER(3)) as MOV20_WEK_FREQ_ID,				cast(null as NUMBER(3)) as MOV30_WEK_FREQ_ID,			  cast(null as NUMBER(3)) as WLK30_WEK_FREQ_ID from NHID_GJ_2004 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,cast(null as NUMBER(3))as WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,cast(null as NUMBER(3))as TRIGLYCERIDE,cast(null as NUMBER(3))as HDL_CHOLE,cast(null as NUMBER(3))as LDL_CHOLE,HMG,cast(GLY_CD as NUMBER(3)) as GLY_CD,cast(OLIG_OCCU_CD as NUMBER(3)) as OLIG_OCCU_CD,						    OLIG_PH,cast(OLIG_PROTE_CD as NUMBER(3)) as OLIG_PROTE_CD,cast(null as NUMBER(3))as CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,cast(HCHK_PMH_CD1 as NUMBER(3)) as HCHK_PMH_CD1,cast(HCHK_PMH_CD2 as NUMBER(3)) as HCHK_PMH_CD2,cast(HCHK_PMH_CD3 as NUMBER(3)) as HCHK_PMH_CD3,cast(FMLY_LIVER_DISE_PATIEN_YN as NUMBER(3)) as FMLY_LIVER_DISE_PATIEN_YN,			 cast(null as NUMBER(3)) as HCHK_APOP_PMH_YN,			  cast(null as NUMBER(3)) as HCHK_HDISE_PMH_YN,				cast(null as NUMBER(3)) as HCHK_HPRTS_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_DIABML_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_HPLPDM_PMH_YN,			 cast(null as NUMBER(3)) as HCHK_PHSS_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_ETCDSE_PMH_YN,cast(FMLY_HPRTS_PATIEN_YN as NUMBER(3)) as FMLY_HPRTS_PATIEN_YN,cast(FMLY_APOP_PATIEN_YN as NUMBER(3)) as FMLY_APOP_PATIEN_YN,cast(FMLY_HDISE_PATIEN_YN as NUMBER(3)) as FMLY_HDISE_PATIEN_YN,cast(FMLY_DIABML_PATIEN_YN as NUMBER(3)) as FMLY_DIABML_PATIEN_YN,cast(FMLY_CANCER_PATIEN_YN as NUMBER(3)) as FMLY_CANCER_PATIEN_YN,cast(SMK_STAT_TYPE_RSPS_CD as NUMBER(3)) as SMK_STAT_TYPE_RSPS_CD,cast(SMK_TERM_RSPS_CD as NUMBER(3)) as SMK_TERM_RSPS_CD,cast(DSQTY_RSPS_CD as NUMBER(3)) as DSQTY_RSPS_CD,cast(DRNK_HABIT_RSPS_CD as NUMBER(3)) as DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,cast(EXERCI_FREQ_RSPS_CD as NUMBER(3)) as EXERCI_FREQ_RSPS_CD,cast(null as NUMBER(3)) as PAST_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as PAST_DSQTY_RSPS_CD,cast(null as NUMBER(3)) as CUR_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as CUR_DSQTY_RSPS_CD,			  cast(null as NUMBER(3)) as MOV20_WEK_FREQ_ID,				cast(null as NUMBER(3)) as MOV30_WEK_FREQ_ID,			  cast(null as NUMBER(3)) as WLK30_WEK_FREQ_ID from NHID_GJ_2005 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,cast(null as NUMBER(3))as WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,cast(null as NUMBER(3))as TRIGLYCERIDE,cast(null as NUMBER(3))as HDL_CHOLE,cast(null as NUMBER(3))as LDL_CHOLE,HMG,cast(GLY_CD as NUMBER(3)) as GLY_CD,cast(OLIG_OCCU_CD as NUMBER(3)) as OLIG_OCCU_CD,						    OLIG_PH,cast(OLIG_PROTE_CD as NUMBER(3)) as OLIG_PROTE_CD,cast(null as NUMBER(3))as CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,cast(HCHK_PMH_CD1 as NUMBER(3)) as HCHK_PMH_CD1,cast(HCHK_PMH_CD2 as NUMBER(3)) as HCHK_PMH_CD2,cast(HCHK_PMH_CD3 as NUMBER(3)) as HCHK_PMH_CD3,cast(FMLY_LIVER_DISE_PATIEN_YN as NUMBER(3)) as FMLY_LIVER_DISE_PATIEN_YN,			 cast(null as NUMBER(3)) as HCHK_APOP_PMH_YN,			  cast(null as NUMBER(3)) as HCHK_HDISE_PMH_YN,				cast(null as NUMBER(3)) as HCHK_HPRTS_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_DIABML_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_HPLPDM_PMH_YN,			 cast(null as NUMBER(3)) as HCHK_PHSS_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_ETCDSE_PMH_YN,cast(FMLY_HPRTS_PATIEN_YN as NUMBER(3)) as FMLY_HPRTS_PATIEN_YN,cast(FMLY_APOP_PATIEN_YN as NUMBER(3)) as FMLY_APOP_PATIEN_YN,cast(FMLY_HDISE_PATIEN_YN as NUMBER(3)) as FMLY_HDISE_PATIEN_YN,cast(FMLY_DIABML_PATIEN_YN as NUMBER(3)) as FMLY_DIABML_PATIEN_YN,cast(FMLY_CANCER_PATIEN_YN as NUMBER(3)) as FMLY_CANCER_PATIEN_YN,cast(SMK_STAT_TYPE_RSPS_CD as NUMBER(3)) as SMK_STAT_TYPE_RSPS_CD,cast(SMK_TERM_RSPS_CD as NUMBER(3)) as SMK_TERM_RSPS_CD,cast(DSQTY_RSPS_CD as NUMBER(3)) as DSQTY_RSPS_CD,cast(DRNK_HABIT_RSPS_CD as NUMBER(3)) as DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,cast(EXERCI_FREQ_RSPS_CD as NUMBER(3)) as EXERCI_FREQ_RSPS_CD,cast(null as NUMBER(3)) as PAST_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as PAST_DSQTY_RSPS_CD,cast(null as NUMBER(3)) as CUR_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as CUR_DSQTY_RSPS_CD,			  cast(null as NUMBER(3)) as MOV20_WEK_FREQ_ID,				cast(null as NUMBER(3)) as MOV30_WEK_FREQ_ID,			  cast(null as NUMBER(3)) as WLK30_WEK_FREQ_ID from NHID_GJ_2006 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,cast(null as NUMBER(3))as WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,cast(null as NUMBER(3))as TRIGLYCERIDE,cast(null as NUMBER(3))as HDL_CHOLE,cast(null as NUMBER(3))as LDL_CHOLE,HMG,cast(GLY_CD as NUMBER(3)) as GLY_CD,cast(OLIG_OCCU_CD as NUMBER(3)) as OLIG_OCCU_CD,						    OLIG_PH,cast(OLIG_PROTE_CD as NUMBER(3)) as OLIG_PROTE_CD,cast(null as NUMBER(3))as CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,cast(HCHK_PMH_CD1 as NUMBER(3)) as HCHK_PMH_CD1,cast(HCHK_PMH_CD2 as NUMBER(3)) as HCHK_PMH_CD2,cast(HCHK_PMH_CD3 as NUMBER(3)) as HCHK_PMH_CD3,cast(FMLY_LIVER_DISE_PATIEN_YN as NUMBER(3)) as FMLY_LIVER_DISE_PATIEN_YN,			 cast(null as NUMBER(3)) as HCHK_APOP_PMH_YN,			  cast(null as NUMBER(3)) as HCHK_HDISE_PMH_YN,				cast(null as NUMBER(3)) as HCHK_HPRTS_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_DIABML_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_HPLPDM_PMH_YN,			 cast(null as NUMBER(3)) as HCHK_PHSS_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_ETCDSE_PMH_YN,cast(FMLY_HPRTS_PATIEN_YN as NUMBER(3)) as FMLY_HPRTS_PATIEN_YN,cast(FMLY_APOP_PATIEN_YN as NUMBER(3)) as FMLY_APOP_PATIEN_YN,cast(FMLY_HDISE_PATIEN_YN as NUMBER(3)) as FMLY_HDISE_PATIEN_YN,cast(FMLY_DIABML_PATIEN_YN as NUMBER(3)) as FMLY_DIABML_PATIEN_YN,cast(FMLY_CANCER_PATIEN_YN as NUMBER(3)) as FMLY_CANCER_PATIEN_YN,cast(SMK_STAT_TYPE_RSPS_CD as NUMBER(3)) as SMK_STAT_TYPE_RSPS_CD,cast(SMK_TERM_RSPS_CD as NUMBER(3)) as SMK_TERM_RSPS_CD,cast(DSQTY_RSPS_CD as NUMBER(3)) as DSQTY_RSPS_CD,cast(DRNK_HABIT_RSPS_CD as NUMBER(3)) as DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,cast(EXERCI_FREQ_RSPS_CD as NUMBER(3)) as EXERCI_FREQ_RSPS_CD,cast(null as NUMBER(3)) as PAST_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as PAST_DSQTY_RSPS_CD,cast(null as NUMBER(3)) as CUR_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as CUR_DSQTY_RSPS_CD,			  cast(null as NUMBER(3)) as MOV20_WEK_FREQ_ID,				cast(null as NUMBER(3)) as MOV30_WEK_FREQ_ID,			  cast(null as NUMBER(3)) as WLK30_WEK_FREQ_ID from NHID_GJ_2007 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT, 						  WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,  						 TRIGLYCERIDE,							HDL_CHOLE,							LDL_CHOLE,HMG,cast(GLY_CD as NUMBER(3)) as GLY_CD,cast(OLIG_OCCU_CD as NUMBER(3)) as OLIG_OCCU_CD,						    OLIG_PH,cast(OLIG_PROTE_CD as NUMBER(3)) as OLIG_PROTE_CD,						    CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,cast(HCHK_PMH_CD1 as NUMBER(3)) as HCHK_PMH_CD1,cast(HCHK_PMH_CD2 as NUMBER(3)) as HCHK_PMH_CD2,cast(HCHK_PMH_CD3 as NUMBER(3)) as HCHK_PMH_CD3,cast(FMLY_LIVER_DISE_PATIEN_YN as NUMBER(3)) as FMLY_LIVER_DISE_PATIEN_YN,			 cast(null as NUMBER(3)) as HCHK_APOP_PMH_YN,			  cast(null as NUMBER(3)) as HCHK_HDISE_PMH_YN,				cast(null as NUMBER(3)) as HCHK_HPRTS_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_DIABML_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_HPLPDM_PMH_YN,			 cast(null as NUMBER(3)) as HCHK_PHSS_PMH_YN,			   cast(null as NUMBER(3)) as HCHK_ETCDSE_PMH_YN,cast(FMLY_HPRTS_PATIEN_YN as NUMBER(3)) as FMLY_HPRTS_PATIEN_YN,cast(FMLY_APOP_PATIEN_YN as NUMBER(3)) as FMLY_APOP_PATIEN_YN,cast(FMLY_HDISE_PATIEN_YN as NUMBER(3)) as FMLY_HDISE_PATIEN_YN,cast(FMLY_DIABML_PATIEN_YN as NUMBER(3)) as FMLY_DIABML_PATIEN_YN,cast(FMLY_CANCER_PATIEN_YN as NUMBER(3)) as FMLY_CANCER_PATIEN_YN,cast(SMK_STAT_TYPE_RSPS_CD as NUMBER(3)) as SMK_STAT_TYPE_RSPS_CD,cast(SMK_TERM_RSPS_CD as NUMBER(3)) as SMK_TERM_RSPS_CD,cast(DSQTY_RSPS_CD as NUMBER(3)) as DSQTY_RSPS_CD,cast(DRNK_HABIT_RSPS_CD as NUMBER(3)) as DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,cast(EXERCI_FREQ_RSPS_CD as NUMBER(3)) as EXERCI_FREQ_RSPS_CD,cast(null as NUMBER(3)) as PAST_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as PAST_DSQTY_RSPS_CD,cast(null as NUMBER(3)) as CUR_SMK_TERM_RSPS_CD,cast(null as NUMBER(3)) as CUR_DSQTY_RSPS_CD,			  cast(null as NUMBER(3)) as MOV20_WEK_FREQ_ID,				cast(null as NUMBER(3)) as MOV30_WEK_FREQ_ID,			  cast(null as NUMBER(3)) as WLK30_WEK_FREQ_ID from NHID_GJ_2008 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,						  WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,							 TRIGLYCERIDE,							HDL_CHOLE,							LDL_CHOLE,HMG,	 cast(null as number(3))as GLY_CD,	  	   cast(null as number(3))as OLIG_OCCU_CD,cast(null as NUMBER(3))as OLIG_PH,cast(OLIG_PROTE_CD as NUMBER(3)) as OLIG_PROTE_CD,							CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,			cast(null as number(3))as HCHK_PMH_CD1,			cast(null as number(3))as HCHK_PMH_CD2,			cast(null as number(3))as HCHK_PMH_CD3,						 cast(null as number(3))as FMLY_LIVER_DISE_PATIEN_YN,cast(HCHK_APOP_PMH_YN as NUMBER(3)) as HCHK_APOP_PMH_YN,cast(HCHK_HDISE_PMH_YN as NUMBER(3)) as HCHK_HDISE_PMH_YN,cast(HCHK_HPRTS_PMH_YN as NUMBER(3)) as HCHK_HPRTS_PMH_YN,cast(HCHK_DIABML_PMH_YN as NUMBER(3)) as HCHK_DIABML_PMH_YN,cast(HCHK_HPLPDM_PMH_YN as NUMBER(3)) as HCHK_HPLPDM_PMH_YN,cast(HCHK_PHSS_PMH_YN as NUMBER(3)) as HCHK_PHSS_PMH_YN,cast(HCHK_ETCDSE_PMH_YN as NUMBER(3)) as HCHK_ETCDSE_PMH_YN,cast(FMLY_HPRTS_PATIEN_YN as NUMBER(3)) as FMLY_HPRTS_PATIEN_YN,cast(FMLY_APOP_PATIEN_YN as NUMBER(3)) as FMLY_APOP_PATIEN_YN,cast(FMLY_HDISE_PATIEN_YN as NUMBER(3)) as FMLY_HDISE_PATIEN_YN,cast(FMLY_DIABML_PATIEN_YN as NUMBER(3)) as FMLY_DIABML_PATIEN_YN,cast(FMLY_CANCER_PATIEN_YN as NUMBER(3)) as FMLY_CANCER_PATIEN_YN,cast(SMK_STAT_TYPE_RSPS_CD as NUMBER(3)) as SMK_STAT_TYPE_RSPS_CD,			  cast(null as number(3))as SMK_TERM_RSPS_CD,		   cast(null as number(3))as DSQTY_RSPS_CD,cast(DRNK_HABIT_RSPS_CD as NUMBER(3)) as DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,				   cast(null as number(3))as EXERCI_FREQ_RSPS_CD,  						    PAST_SMK_TERM_RSPS_CD,       					 PAST_DSQTY_RSPS_CD,						   CUR_SMK_TERM_RSPS_CD,						   CUR_DSQTY_RSPS_CD,cast(MOV20_WEK_FREQ_ID as NUMBER(3)) as MOV20_WEK_FREQ_ID,cast(MOV30_WEK_FREQ_ID as NUMBER(3)) as MOV30_WEK_FREQ_ID,cast(WLK30_WEK_FREQ_ID as NUMBER(3)) as WLK30_WEK_FREQ_ID from NHID_GJ_2009 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,						  WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,							 TRIGLYCERIDE,							HDL_CHOLE,							LDL_CHOLE,HMG,	 cast(null as number(3))as GLY_CD,	  	   cast(null as number(3))as OLIG_OCCU_CD,cast(null as NUMBER(3))as OLIG_PH,cast(OLIG_PROTE_CD as NUMBER(3)) as OLIG_PROTE_CD,							CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,			cast(null as number(3))as HCHK_PMH_CD1,			cast(null as number(3))as HCHK_PMH_CD2,			cast(null as number(3))as HCHK_PMH_CD3,						 cast(null as number(3))as FMLY_LIVER_DISE_PATIEN_YN,cast(HCHK_APOP_PMH_YN as NUMBER(3)) as HCHK_APOP_PMH_YN,cast(HCHK_HDISE_PMH_YN as NUMBER(3)) as HCHK_HDISE_PMH_YN,cast(HCHK_HPRTS_PMH_YN as NUMBER(3)) as HCHK_HPRTS_PMH_YN,cast(HCHK_DIABML_PMH_YN as NUMBER(3)) as HCHK_DIABML_PMH_YN,cast(HCHK_HPLPDM_PMH_YN as NUMBER(3)) as HCHK_HPLPDM_PMH_YN,cast(HCHK_PHSS_PMH_YN as NUMBER(3)) as HCHK_PHSS_PMH_YN,cast(HCHK_ETCDSE_PMH_YN as NUMBER(3)) as HCHK_ETCDSE_PMH_YN,cast(FMLY_HPRTS_PATIEN_YN as NUMBER(3)) as FMLY_HPRTS_PATIEN_YN,cast(FMLY_APOP_PATIEN_YN as NUMBER(3)) as FMLY_APOP_PATIEN_YN,cast(FMLY_HDISE_PATIEN_YN as NUMBER(3)) as FMLY_HDISE_PATIEN_YN,cast(FMLY_DIABML_PATIEN_YN as NUMBER(3)) as FMLY_DIABML_PATIEN_YN,cast(FMLY_CANCER_PATIEN_YN as NUMBER(3)) as FMLY_CANCER_PATIEN_YN,cast(SMK_STAT_TYPE_RSPS_CD as NUMBER(3)) as SMK_STAT_TYPE_RSPS_CD,			  cast(null as number(3))as SMK_TERM_RSPS_CD,		   cast(null as number(3))as DSQTY_RSPS_CD,cast(DRNK_HABIT_RSPS_CD as NUMBER(3)) as DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,				   cast(null as number(3))as EXERCI_FREQ_RSPS_CD,  						    PAST_SMK_TERM_RSPS_CD,       					 PAST_DSQTY_RSPS_CD,						   CUR_SMK_TERM_RSPS_CD,						   CUR_DSQTY_RSPS_CD,cast(MOV20_WEK_FREQ_ID as NUMBER(3)) as MOV20_WEK_FREQ_ID,cast(MOV30_WEK_FREQ_ID as NUMBER(3)) as MOV30_WEK_FREQ_ID,cast(WLK30_WEK_FREQ_ID as NUMBER(3)) as WLK30_WEK_FREQ_ID from NHID_GJ_2010 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,						  WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,							 TRIGLYCERIDE,							HDL_CHOLE,							LDL_CHOLE,HMG,	 cast(null as number(3))as GLY_CD,	  	   cast(null as number(3))as OLIG_OCCU_CD,cast(null as NUMBER(3))as OLIG_PH,cast(OLIG_PROTE_CD as NUMBER(3)) as OLIG_PROTE_CD,							CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,			cast(null as number(3))as HCHK_PMH_CD1,			cast(null as number(3))as HCHK_PMH_CD2,			cast(null as number(3))as HCHK_PMH_CD3,						 cast(null as number(3))as FMLY_LIVER_DISE_PATIEN_YN,cast(HCHK_APOP_PMH_YN as NUMBER(3)) as HCHK_APOP_PMH_YN,cast(HCHK_HDISE_PMH_YN as NUMBER(3)) as HCHK_HDISE_PMH_YN,cast(HCHK_HPRTS_PMH_YN as NUMBER(3)) as HCHK_HPRTS_PMH_YN,cast(HCHK_DIABML_PMH_YN as NUMBER(3)) as HCHK_DIABML_PMH_YN,cast(HCHK_HPLPDM_PMH_YN as NUMBER(3)) as HCHK_HPLPDM_PMH_YN,cast(HCHK_PHSS_PMH_YN as NUMBER(3)) as HCHK_PHSS_PMH_YN,cast(HCHK_ETCDSE_PMH_YN as NUMBER(3)) as HCHK_ETCDSE_PMH_YN,cast(FMLY_HPRTS_PATIEN_YN as NUMBER(3)) as FMLY_HPRTS_PATIEN_YN,cast(FMLY_APOP_PATIEN_YN as NUMBER(3)) as FMLY_APOP_PATIEN_YN,cast(FMLY_HDISE_PATIEN_YN as NUMBER(3)) as FMLY_HDISE_PATIEN_YN,cast(FMLY_DIABML_PATIEN_YN as NUMBER(3)) as FMLY_DIABML_PATIEN_YN,cast(FMLY_CANCER_PATIEN_YN as NUMBER(3)) as FMLY_CANCER_PATIEN_YN,cast(SMK_STAT_TYPE_RSPS_CD as NUMBER(3)) as SMK_STAT_TYPE_RSPS_CD,			  cast(null as number(3))as SMK_TERM_RSPS_CD,		   cast(null as number(3))as DSQTY_RSPS_CD,cast(DRNK_HABIT_RSPS_CD as NUMBER(3)) as DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,				   cast(null as number(3))as EXERCI_FREQ_RSPS_CD,  						    PAST_SMK_TERM_RSPS_CD,       					 PAST_DSQTY_RSPS_CD,						   CUR_SMK_TERM_RSPS_CD,						   CUR_DSQTY_RSPS_CD,cast(MOV20_WEK_FREQ_ID as NUMBER(3)) as MOV20_WEK_FREQ_ID,cast(MOV30_WEK_FREQ_ID as NUMBER(3)) as MOV30_WEK_FREQ_ID,cast(WLK30_WEK_FREQ_ID as NUMBER(3)) as WLK30_WEK_FREQ_ID from NHID_GJ_2011 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,						  WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,							 TRIGLYCERIDE,							HDL_CHOLE,							LDL_CHOLE,HMG,	 cast(null as number(3))as GLY_CD,	  	   cast(null as number(3))as OLIG_OCCU_CD,cast(null as NUMBER(3))as OLIG_PH,cast(OLIG_PROTE_CD as NUMBER(3)) as OLIG_PROTE_CD,							CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,			cast(null as number(3))as HCHK_PMH_CD1,			cast(null as number(3))as HCHK_PMH_CD2,			cast(null as number(3))as HCHK_PMH_CD3,						 cast(null as number(3))as FMLY_LIVER_DISE_PATIEN_YN,cast(HCHK_APOP_PMH_YN as NUMBER(3)) as HCHK_APOP_PMH_YN,cast(HCHK_HDISE_PMH_YN as NUMBER(3)) as HCHK_HDISE_PMH_YN,cast(HCHK_HPRTS_PMH_YN as NUMBER(3)) as HCHK_HPRTS_PMH_YN,cast(HCHK_DIABML_PMH_YN as NUMBER(3)) as HCHK_DIABML_PMH_YN,cast(HCHK_HPLPDM_PMH_YN as NUMBER(3)) as HCHK_HPLPDM_PMH_YN,cast(HCHK_PHSS_PMH_YN as NUMBER(3)) as HCHK_PHSS_PMH_YN,cast(HCHK_ETCDSE_PMH_YN as NUMBER(3)) as HCHK_ETCDSE_PMH_YN,cast(FMLY_HPRTS_PATIEN_YN as NUMBER(3)) as FMLY_HPRTS_PATIEN_YN,cast(FMLY_APOP_PATIEN_YN as NUMBER(3)) as FMLY_APOP_PATIEN_YN,cast(FMLY_HDISE_PATIEN_YN as NUMBER(3)) as FMLY_HDISE_PATIEN_YN,cast(FMLY_DIABML_PATIEN_YN as NUMBER(3)) as FMLY_DIABML_PATIEN_YN,cast(FMLY_CANCER_PATIEN_YN as NUMBER(3)) as FMLY_CANCER_PATIEN_YN,cast(SMK_STAT_TYPE_RSPS_CD as NUMBER(3)) as SMK_STAT_TYPE_RSPS_CD,			  cast(null as number(3))as SMK_TERM_RSPS_CD,		   cast(null as number(3))as DSQTY_RSPS_CD,cast(DRNK_HABIT_RSPS_CD as NUMBER(3)) as DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,				   cast(null as number(3))as EXERCI_FREQ_RSPS_CD,  						    PAST_SMK_TERM_RSPS_CD,       					 PAST_DSQTY_RSPS_CD,						   CUR_SMK_TERM_RSPS_CD,						   CUR_DSQTY_RSPS_CD,cast(MOV20_WEK_FREQ_ID as NUMBER(3)) as MOV20_WEK_FREQ_ID,cast(MOV30_WEK_FREQ_ID as NUMBER(3)) as MOV30_WEK_FREQ_ID,cast(WLK30_WEK_FREQ_ID as NUMBER(3)) as WLK30_WEK_FREQ_ID from NHID_GJ_2012 UNION ALL
	SELECT HCHK_YEAR,PERSON_ID,YKIHO_GUBUN_CD,HEIGHT,WEIGHT,						  WAIST,BP_HIGH,BP_LWST,BLDS,TOT_CHOLE,							 TRIGLYCERIDE,							HDL_CHOLE,							LDL_CHOLE,HMG,	 cast(null as number(3))as GLY_CD,	  	   cast(null as number(3))as OLIG_OCCU_CD,cast(null as NUMBER(3))as OLIG_PH,cast(OLIG_PROTE_CD as NUMBER(3)) as OLIG_PROTE_CD,							CREATININE,SGOT_AST,SGPT_ALT,GAMMA_GTP,			cast(null as number(3))as HCHK_PMH_CD1,			cast(null as number(3))as HCHK_PMH_CD2,			cast(null as number(3))as HCHK_PMH_CD3,						 cast(null as number(3))as FMLY_LIVER_DISE_PATIEN_YN,cast(HCHK_APOP_PMH_YN as NUMBER(3)) as HCHK_APOP_PMH_YN,cast(HCHK_HDISE_PMH_YN as NUMBER(3)) as HCHK_HDISE_PMH_YN,cast(HCHK_HPRTS_PMH_YN as NUMBER(3)) as HCHK_HPRTS_PMH_YN,cast(HCHK_DIABML_PMH_YN as NUMBER(3)) as HCHK_DIABML_PMH_YN,cast(HCHK_HPLPDM_PMH_YN as NUMBER(3)) as HCHK_HPLPDM_PMH_YN,cast(HCHK_PHSS_PMH_YN as NUMBER(3)) as HCHK_PHSS_PMH_YN,cast(HCHK_ETCDSE_PMH_YN as NUMBER(3)) as HCHK_ETCDSE_PMH_YN,cast(FMLY_HPRTS_PATIEN_YN as NUMBER(3)) as FMLY_HPRTS_PATIEN_YN,cast(FMLY_APOP_PATIEN_YN as NUMBER(3)) as FMLY_APOP_PATIEN_YN,cast(FMLY_HDISE_PATIEN_YN as NUMBER(3)) as FMLY_HDISE_PATIEN_YN,cast(FMLY_DIABML_PATIEN_YN as NUMBER(3)) as FMLY_DIABML_PATIEN_YN,cast(FMLY_CANCER_PATIEN_YN as NUMBER(3)) as FMLY_CANCER_PATIEN_YN,cast(SMK_STAT_TYPE_RSPS_CD as NUMBER(3)) as SMK_STAT_TYPE_RSPS_CD,			  cast(null as number(3))as SMK_TERM_RSPS_CD,		   cast(null as number(3))as DSQTY_RSPS_CD,cast(DRNK_HABIT_RSPS_CD as NUMBER(3)) as DRNK_HABIT_RSPS_CD,cast(TM1_DRKQTY_RSPS_CD as NUMBER(3)) as TM1_DRKQTY_RSPS_CD,				   cast(null as number(3))as EXERCI_FREQ_RSPS_CD,  						    PAST_SMK_TERM_RSPS_CD,       					 PAST_DSQTY_RSPS_CD,						   CUR_SMK_TERM_RSPS_CD,						   CUR_DSQTY_RSPS_CD,cast(MOV20_WEK_FREQ_ID as NUMBER(3)) as MOV20_WEK_FREQ_ID,cast(MOV30_WEK_FREQ_ID as NUMBER(3)) as MOV30_WEK_FREQ_ID,cast(WLK30_WEK_FREQ_ID as NUMBER(3)) as WLK30_WEK_FREQ_ID from NHID_GJ_2013
) g ;  
ALTER TABLE NHIS.NHIS_GJ RENAME COLUMN VISIT_OCCURRENCE_ID TO MASTER_SEQ;

/**************************************																																							   
 1. 행을 열로 전환
***************************************/ 
CREATE TABLE NHIS.GJ_VERTICAL
parallel 8
nologging
pctfree 0
as
SELECT p.master_seq, p.hchk_year, p.person_id, p.ykiho_gubun_cd, p.meas_type, p.meas_value 
FROM NHIS.NHIS_GJ 
unpivot (meas_value for meas_type in ( -- 47 검진 항목
	height, weight, waist, bp_high, bp_lwst,
	blds, tot_chole, triglyceride, hdl_chole, ldl_chole,
	hmg, gly_cd, olig_occu_cd, olig_ph, olig_prote_cd,
	creatinine, sgot_ast, sgpt_alt, gamma_gtp, hchk_pmh_cd1,
	hchk_pmh_cd2, hchk_pmh_cd3, hchk_apop_pmh_yn, hchk_hdise_pmh_yn, hchk_hprts_pmh_yn,
	hchk_diabml_pmh_yn, hchk_hplpdm_pmh_yn, hchk_etcdse_pmh_yn, hchk_phss_pmh_yn, fmly_liver_dise_patien_yn, 
	fmly_hprts_patien_yn, fmly_apop_patien_yn, fmly_hdise_patien_yn, fmly_diabml_patien_yn, fmly_cancer_patien_yn, 
	smk_stat_type_rsps_cd, smk_term_rsps_cd, cur_smk_term_rsps_cd, cur_dsqty_rsps_cd, past_smk_term_rsps_cd, 
	past_dsqty_rsps_cd, dsqty_rsps_cd, drnk_habit_rsps_Cd, tm1_drkqty_rsps_cd, exerci_freq_rsps_cd, 
	mov20_wek_freq_id, mov30_wek_freq_id, wlk30_wek_freq_id
))p ;


/**************************************
 2. 수치형 데이터 입력  
***************************************/ 
INSERT INTO CDM_ONE_MIL.MEASUREMENT (measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id,			
											unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value)

	select	case	when a.meas_type = 'HEIGHT' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'WEIGHT' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'WAIST' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'BP_HIGH' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'BP_LWST' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'BLDS' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'TOT_CHOLE' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'TRIGLYCERIDE' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'HDL_CHOLE' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'LDL_CHOLE' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'HMG' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'OLIG_PH' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'CREATININE' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'SGOT_AST' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'SGPT_ALT' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'GAMMA_GTP' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					end as measurement_id,
			a.person_id as person_id,
			b.measurement_concept_id as measurement_concept_id,
			to_date(a.hchk_year||'0101','yyyy-mm-dd') as measurement_date,
			null as measurement_datetime,
			b.measurement_type_concept_id as measurement_type_concept_id,
			null as operator_concept_id,
			b.value_as_number as value_as_number,
			b.value_as_concept_id as value_as_concept_id,
			b.measurement_unit_concept_id as unit_concept_id ,
			null as range_low,
            null as range_high,
			null as provider_id ,
			a.master_seq as visit_occurrence_id,
			a.meas_value as measurement_source_value,
			null as measurement_source_concept_id,
			null as unit_source_value,
			a.meas_value as value_source_value

	from (select master_seq, hchk_year, person_id, ykiho_gubun_cd, meas_type, meas_value 			
			from NHIS.GJ_VERTICAL) a
		JOIN measurement_mapping b 
        on nvl(a.meas_type,'') = nvl(b.meas_type,'') 
        and nvl(cast(a.meas_value as number(8)),0) >= nvl(cast(b.answer as number(8)),0)
	where (a.meas_value is not null and a.meas_type in ('HEIGHT', 'WEIGHT',	'WAIST', 'BP_HIGH', 'BP_LWST', 'BLDS', 'TOT_CHOLE', 'TRIGLYCERIDE',	'HDL_CHOLE',		
																	'LDL_CHOLE', 'HMG', 'OLIG_PH', 'CREATININE', 'SGOT_AST', 'SGPT_ALT', 'GAMMA_GTP'))
;


/**************************************
 2. 코드형 데이터 입력  
***************************************/ 
INSERT INTO CDM_ONE_MIL.MEASUREMENT (measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id,			
											unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value)


	select	case	when a.meas_type = 'GLY_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'OLIG_OCCU_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					when a.meas_type = 'OLIG_PROTE_CD' then cast(concat(a.master_seq, b.id_value) as INTEGER)
					end as measurement_id,
			a.person_id as person_id,
			b.measurement_concept_id as measurement_concept_id,
			to_date(a.hchk_year||'0101','yyyy-mm-dd') as measurement_date,
			null as measurement_datetime,
			b.measurement_type_concept_id as measurement_type_concept_id,
			null as operator_concept_id,
			b.value_as_number as value_as_number,
			b.value_as_concept_id as value_as_concept_id,
			b.measurement_unit_concept_id as unit_concept_id ,
			null as range_low,
            null as range_high,
			null as provider_id ,
			a.master_seq as visit_occurrence_id,
			a.meas_value as measurement_source_value,
			null as measurement_source_concept_id,
			null as unit_source_value,
			a.meas_value as value_source_value

	from (select master_seq, hchk_year, person_id, ykiho_gubun_cd, meas_type, meas_value 			
			from NHIS.GJ_VERTICAL) a
		JOIN measurement_mapping b 
        on nvl(a.meas_type,'') = nvl(b.meas_type,'') 
        and nvl(cast(a.meas_value as number(8)),0) >= nvl(cast(b.answer as number(8)),0)
	where (a.meas_value is not null and a.meas_type in ('GLY_CD', 'OLIG_OCCU_CD', 'OLIG_PROTE_CD'));

/**************************************
 3.source_value의 값을 value_as_number에도 입력
***************************************/ 
UPDATE CDM_ONE_MIL.MEASUREMENT
SET value_as_number = measurement_source_value
where measurement_source_value is not null; 
