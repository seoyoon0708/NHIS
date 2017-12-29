--create directory T120 as 'D:\NHIS_DATA\02.T120';
CREATE OR REPLACE FUNCTION table_name( idx in number)  RETURN VARCHAR2 IS
--v_str varchar2(2000)   ;

begin
	if idx < 2011 then
		v_str := 'PERSON_ID	NUMBER(8)
		,KEY_SEQ			VARCHAR2(12)
		,YKIHO_ID			NUMBER(6)
		,RECU_FR_DT			VARCHAR2(8)
		,FORM_CD			VARCHAR2(2)
		,DSBJT_CD			VARCHAR2(2)
		,MAIN_SICK			VARCHAR2(6)
		,SUB_SICK			VARCHAR2(6)
		,IN_PAT_CORS_TYPE	VARCHAR2(2)
		,OFFC_INJ_TYPE		VARCHAR2(1)
		,RECN				NUMBER(3)
		,VSCN				NUMBER(3)
		,FST_IN_PAT_DT		VARCHAR2(8)
		,DMD_TRAMT			NUMBER(8)
		,DMD_SBRDN_AMT		NUMBER(8)
		,DMD_JBRDN_AMT		NUMBER(8)
		,DMD_CT_TOT_AMT		NUMBER(8)
		,DMD_MRI_TOT_AMT	NUMBER(8)
		,EDEC_ADD_RT		NUMBER(3)
		,EDEC_TRAMT			NUMBER(8)
		,EDEC_SBRDN_AMT		NUMBER(8)
		,EDEC_JBRDN_AMT		NUMBER(8)
		,EDEC_CT_TOT_AMT	NUMBER(8)
		,EDEC_MRI_TOT_AMT	NUMBER(8)
		,DMD_DRG_NO			VARCHAR2(10)
		,TOT_PRES_DD_CNT	NUMBER(3)';
		return v_str;
	else
		v_str := 'PERSON_ID	NUMBER(8)
		,KEY_SEQ			VARCHAR2(12)
		,YKIHO_ID			NUMBER(6)
		,RECU_FR_DT			VARCHAR2(8)
		,FORM_CD			VARCHAR2(2)
		,DSBJT_CD			VARCHAR2(2)
		,MAIN_SICK			VARCHAR2(6)
		,SUB_SICK			VARCHAR2(6)
		,IN_PAT_CORS_TYPE	VARCHAR2(2)
		,OFFC_INJ_TYPE		VARCHAR2(1)
		,RECN				NUMBER(3)
		,VSCN				NUMBER(3)
		,FST_IN_PAT_DT		VARCHAR2(8)
		,DMD_TRAMT			NUMBER(8)
		,DMD_SBRDN_AMT		NUMBER(8)
		,DMD_JBRDN_AMT		NUMBER(8)
		,DMD_CT_TOT_AMT		NUMBER(8)
		,DMD_MRI_TOT_AMT	NUMBER(8)
		,EDEC_ADD_RT		NUMBER(3)
		,EDEC_TRAMT			NUMBER(8)
		,EDEC_SBRDN_AMT		NUMBER(8)
		,EDEC_JBRDN_AMT		NUMBER(8)
		,EDEC_CT_TOT_AMT	NUMBER(8)
		,EDEC_MRI_TOT_AMT	NUMBER(8)
		,DMD_DRG_NO			VARCHAR2(10)
		,MPRSC_GRANT_NO	VARCHAR2(13)
		,TOT_PRES_DD_CNT	NUMBER(3)';
		return v_str;
	end if;
end;

begin
	for idx in 2002..2013
	loop
	dbms_output.put_line(idx);
	execute immediate(
		'create table NHID_GY20_T1_'||idx||'_ext
		(table_name('||idx||'))
		ORGANIZATION EXTERNAL
		(
		TYPE oracle_loader
		DEFAULT DIRECTORY T120
		ACCESS PARAMETERS
		(
		RECORDS DELIMITED BY ''\n''
		CHARACTERSET KO16KSC5601
		FIELDS TERMINATED BY ''|'' OPTIONALLY ENCLOSED BY ''"'' LRTRIM
		MISSING FIELD VALUES ARE NULL
		)
		LOCATION
		(
		''NHID_GY20_T1_'||idx||'.TXT''
		)
		)REJECT LIMIT UNLIMITED');
	end loop;

	for idx in 2002..2013
	loop
		execute immediate(
			'create table NHID_GY20_T1_'||idx||'
			as
			select * from NHID_GY20_T1_'||idx||'_ext');
	end loop;

	for idx in 2002..2013
	loop
		execute immediate(
			'select * from NHID_GY20_T1_'||idx);
	end loop;
end;


			--drop table NHID_GY20_T1_2004_ext;
			--alter table NHID_GY20_T1_2004 rename to NHID_GY20_T1_2004_ext;
/*



begin
	for idx in 2002..2010
	loop
		execute immediate(
			'drop table NHID_GY20_T1_'||idx||'_ext');
	end loop;
end;
			--drop table NHID_GY20_T1_2004_ext;
			--alter table NHID_GY20_T1_2004 rename to NHID_GY20_T1_2004_ext;



*/
