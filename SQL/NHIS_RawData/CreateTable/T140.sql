--create directory T140 as 'D:\NHIS_DATA\04.T140_T';

--define dir=D:\NHIS_DATA\04.T140_T as T140;

--declare idx number;

begin
	for idx in 2002..2013
	loop
	execute immediate(
		'create table NHID_GY40_T1_'||idx||'_ext
		( KEY_SEQ	varchar2(12)
			,SEQ_NO	number(4)
			,RECU_FR_DT	varchar2(8)
			,DSBJT_CD	varchar2(2)
			,SICK_SYM	varchar2(6)
		)
		ORGANIZATION EXTERNAL
		(
		TYPE oracle_loader
		DEFAULT DIRECTORY T140
		ACCESS PARAMETERS
		(
		RECORDS DELIMITED BY ''\r\n''
		CHARACTERSET KO16KSC5601
		FIELDS TERMINATED BY ''|'' OPTIONALLY ENCLOSED BY ''"'' LRTRIM
		MISSING FIELD VALUES ARE NULL
		)
		LOCATION
		(
		''NHID_GY40_T1_'||idx||'.TXT''
		)
		)REJECT LIMIT UNLIMITED');
	end loop;

	for idx in 2002..2013
	loop
		execute immediate(
			'create table NHID_GY40_T1_'||idx||'
			as
			select * from NHID_GY40_T1_'||idx||'_ext');
	end loop;

/*
	for idx in 2002..2013
	loop
		execute immediate(
			'select * from NHID_GY40_T1_'||idx||'
			WHERE ROWNUM<=100');
	end loop;
*/
end;
			--drop table NHID_GY40_T1_2004_ext;
			--alter table NHID_GY40_T1_2004 rename to NHID_GY40_T1_2004_ext;

--select * from NHID_GY40_T1_2005;
/*
-- see the list of tables --
select table_name from user_tables;
*/              

/*
-- SEE TABLESPACE INFORMATION
SELECT TABLESPACE_NAME, STATUS, CONTENTS, SEGMENT_SPACE_MANAGEMENT, EXTENT_MANAGEMENT, MAX_EXTENTS, MIN_EXTENTS, MIN_EXTLEN, BLOCK_SIZE
	FROM USER_TABLESPACES;

-- CREATE ANOTHER TEMPORARY TABLESPACE	
	CREATE TEMPORARY TABLESPACE TEMP2
		TEMPFILE 'temp02.dbf' size 500M AUTOEXTEND ON;
	
-- SHOW FREE SPACE	
SELECT TABLESPACE_NAME, FILE_ID, BYTES
	FROM USER_FREE_SPACE;           

--ERROR	
select * from NHID_GY40_T1_2005_ext_TEMP_FILES where tablespace_name='TEMP';
SELECT MAX(blocks), MAX(bytes)
	FROM NHID_GY40_T1_2005_ext
	WHERE TABLESPACE_NAME = 'TS_NHIS';
*/
