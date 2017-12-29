--create directory JK as 'D:\NHIS_DATA\01.jk';

--declare idx number;

begin
	for idx in 2002..2013
	loop
	execute immediate(
		'create table NHID_JK_'||idx||'_ext
			(STND_Y 			VARCHAR2(4)
			,PERSON_ID 			NUMBER(8)
			,SEX 				VARCHAR2(1)
			,AGE_GROUP 			VARCHAR2(2)
			,DTH_YM 			VARCHAR2(6)
			,DTH_CODE1 			VARCHAR2(14)
			,DTH_CODE2 			VARCHAR2(14)
			,SIDO 				VARCHAR2(2)
			,SGG 				VARCHAR2(5)
			,IPSN_TYPE_CD 		VARCHAR2(1)
			,CTRB_PT_TYPE_CD 	VARCHAR2(2)
			,DFAB_GRD_CD 		VARCHAR2(1)
			,DFAB_PTN_CD 		VARCHAR2(1)
			,DFAB_REG_YM 		VARCHAR2(6)
			)
			ORGANIZATION EXTERNAL
			(
			TYPE oracle_loader
			DEFAULT DIRECTORY JK
			ACCESS PARAMETERS
			(
			RECORDS DELIMITED BY ''\n''
			CHARACTERSET KO16KSC5601
			FIELDS TERMINATED BY ''|'' OPTIONALLY ENCLOSED BY ''"'' LRTRIM
			MISSING FIELD VALUES ARE NULL
			)
			LOCATION
			(
			''NHID_JK_'||idx||'.TXT''
			)
			)REJECT LIMIT UNLIMITED');
		end loop;

	for idx in 2002..2013
	loop
		execute immediate(
			'create table NHID_JK_'||idx||'
			as
			select * from NHID_JK_'||idx||'_ext');
	end loop;

	for idx in 2002..2013
	loop
		execute immediate(
			'select * from NHID_JK_'||idx);
	end loop;
end;

--drop table NHID_JK_2004_ext;
--alter table NHID_JK_2004 rename to NHID_JK_2004_ext;  \
--select * from NHID_JK_2013;

/* see the list of tables
--select table_name from user_tables;
*/
