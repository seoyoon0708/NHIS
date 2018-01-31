create table death_mapping (
KCDCODE VARCHAR2(100),
NAME    VARCHAR2(100),
CONCEPT_ID VARCHAR2(100),
CONCEPT_NAME VARCHAR2(100));

insert into death_mapping(KCDCODE,CONCEPT_ID)
select * from TS_MAP_ICD2SNOMED;

commit;

insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('A00-A09', 'infectious enteritis', 4134887, 'Infectious disease of digestive tract')                               ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('A15-A19', 'tuberculosis', 434557, 'Tuberculosis')                                                                 ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('A30-A49', '기타 박테리아 감염', 432545, 'Bacterial infectious disease')                                                  ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('A50-A64', 'sexually tranmitted disease', 440647, 'Sexually transmitted infectious disease')                       ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('A75-A79', '열성질환(typhus, tsutsugamushi, spotted fever....)', 432545, 'Bacterial infectious disease')              ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('A80-A89', 'CNS 감염 질환', 4028070, 'Infectious disease of central nervous system')                                  ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('A90-A99', 'viral hemorrhagic fever', 4347554, 'Viral hemorrhagic fever')                                          ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('B00-B09',	'viral infection', 440029, 'Viral disease')                                                            ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('B15-B19',	'viral liver disease', 4291005, 'Viral hepatitis')                                                     ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('B20-B24',	'AIDS-associated disorder', 4221489, 'AIDS-associated disorder')                                       ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('B25-B34',	'viral infection', 440029, 'Viral disease')                                                            ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('B35-B49',	'진균증', 433701, 'Mycosis')                                                                             ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('B50-B64',	'원충증', 442176, 'Protozoan infection')                                                                 ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('B65-B83',	'기생충병', 432251, 'Disease caused by parasite')                                                         ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('B90-B94',	'감염질환에 의한 후유증', 444201, 'Post-infectious disorder')                                                  ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('F00-F09',	'정신과 질환 (기질성)', 374009, 'Organic mental disorder')                                                    ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('F10-F19',	'약물 오남용 관련 질환', 40483111, 'Mental disorder due to drug')                                             ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('F20-F29',	'조현병 관련 질환', 436073, 'Psychotic disorder')                                                            ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('F30-F39',	'우울증/ 조증 관련 질환', 444100, 'Mood disorder')                                                            ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('F40-F48',	'neurosis', 444243, 'Neurosis')                                                                        ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('F50-F59',	'행동장애', 4333000, 'Behavioral syndrome associated with physiological disturbance and physical factors');
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('F70-F79',	'정신 지체', 440389, 'Mental retardation')                                                                ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('F80-F89',	'발달 장애', 435244, 'Developmental disorder')                                                            ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('F99-F99',	'Mental disorder', 432586, 'Mental disorder')                                                          ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('J46',	'Status asthmaticus', 4145356, 'Severe persistent asthma')                                                 ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('S00-S09',	'두부 외상', 375415, 'Injury of head')                                                                    ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('S10-S19',	'목부위 외상', 24818, 'Injury of neck')                                                                    ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('S20-S29',	'흉부 외상', 4094683, 'Chest injury')                                                                     ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('S30-S39',	'복부/골반 외상', 200588, 'Injury of abdomen')                                                              ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('S40-S49',	'위팔/어깨 외상', 4130851, 'Injury of upper extremity')                                                     ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('S50-S59',	'forearm 외상', 136779, 'Disorder of forearm')                                                          ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('S60-S69',	'수부 외상', 80004, 'Injury of hand')                                                                     ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('S70-S79',	'hip/thigh 외상', 4130852, 'Injury of lower extremity')                                                 ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('S80-S89',	'무릎/lower leg 외상', 444131, 'Injury of lower leg')                                                     ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('T00-T07',	'다발성 외상', 440921, 'Traumatic injury')                                                                 ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('T08-T14',	'척추 및 사지 손상', 4022201, 'Injury of musculoskeletal system')                                            ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('T15-T19',	'foreign body', 4053838, 'Foreign body')                                                               ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('T20-T25',	'화상 (피부)', 4123196, 'Burn of skin of body region')                                                    ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('T26-T28',	'화상 (내부기관)', 198030, 'Burn of internal organ')                                                        ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('T29-T32',	'기타 화상', 442013, 'Burn')                                                                              ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('T33-T35',	'동상', 441487, 'Frostbite')                                                                            ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('T36-T50',	'poisoning (마약/약물)', 438028, 'Poisoning by drug AND/OR medicinal substance')                          ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('T51-T65',	'기타 중독', 40481346, 'Poisoning due to chemical substance')                                             ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('T66-T78',	'외부 환경에 의한 영향', 4167864, 'Effect of exposure to physical force')                                      ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('T79-T79',	'달리 분류되지 않은 외상의 특정 조기합병증', 4211546, 'Traumatic complication of injury')                             ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('T80-T88',	'의료 행위에 대한 합병증', 442019, 'Complication of procedure')                                                ;
insert into death_mapping (KCDCODE, NAME, CONCEPT_ID, CONCEPT_NAME) values ('T90-T98',	'기타 후유증', 443403, 'Sequela')            

;

commit;

TRUNCATE TABLE DEATH;

INSERT INTO DEATH (person_id, death_date, death_type_concept_id, cause_concept_id, 
cause_source_value, cause_source_concept_id)
SELECT a.person_id AS PERSON_ID,
	--convert(varchar, DATEADD(DAY,-DATEPART(DD,DATEADD(MONTH,1,convert(VARCHAR, a.dth_ym + '01' ,23))),DATEADD(MONTH,1,convert(VARCHAR, a.dth_ym + '01' ,23))), 23) AS DEATH_DATE,
  --  COALESCE(LAST_DAY(TO_DATE(DTH_YM||'01','YYYYMMDD')),TO_DATE(STND_Y||'1231','YYYYMMDD')) AS DEATH_DATE,
    --TO_CHAR(COALESCE(LAST_DAY(TO_DATE(DTH_YM||'01','YYYYMMDD')),TO_DATE(STND_Y||'1231','YYYYMMDD')),'YYYYMMDD')AS DEATH_DATE,
    LAST_DAY(TO_DATE(NVL(DTH_YM,STND_Y||'12')||'01','YYYYMMDD'))death_date,    
	38003618 as death_type_concept_id,
	b.concept_id as cause_concept_id,
	dth_code1 as cause_source_value,
	NULL as cause_source_concept_id
FROM NHIS.NHIS_JK a 
LEFT JOIN death_mapping b on a.dth_code1=b.kcdcode
WHERE DTH_YM IS NOT NULL OR DTH_CODE1 IS NOT NULL
;

commit;
