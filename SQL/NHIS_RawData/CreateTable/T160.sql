--create directory T160 as 'D:\NHIS_DATA\05.T160_T';

--declare idx number;

begin
	for idx in 2002..2013
	loop
	execute immediate(
		'create table NHID_GY60_T1_'||idx||'_ext
		( KEY_SEQ	VARCHAR2(12)
		,SEQ_NO	NUMBER(4)
		,RECU_FR_DT	VARCHAR2(8)
		,DIV_TYPE_CD	VARCHAR2(1)
		,DIV_CD	VARCHAR2(9)
		,GNL_NM_CD	VARCHAR2(9)
		,DD_MQTY_FREQ	NUMBER(8)
		,DD_EXEC_FREQ	NUMBER(8)
		,MDCN_EXEC_FREQ	NUMBER(8)
		,UN_COST	NUMBER(8)
		,AMT	NUMBER(8)
		)
		ORGANIZATION EXTERNAL
		(
		TYPE oracle_loader
		DEFAULT DIRECTORY T160
		ACCESS PARAMETERS
		(
		RECORDS DELIMITED BY ''\r\n''
		CHARACTERSET KO16KSC5601
		FIELDS TERMINATED BY ''|'' OPTIONALLY ENCLOSED BY ''"'' LRTRIM
		MISSING FIELD VALUES ARE NULL
		)
		LOCATION
		(
		''NHID_GY60_T1_'||idx||'.TXT''
		)
		)REJECT LIMIT UNLIMITED');
	end loop;
                
	for idx in 2002..2013
	loop
		execute immediate(
			'create table NHID_GY60_T1_'||idx||'
			as
			select * from NHID_GY60_T1_'||idx||'_ext');
	end loop;

/*
	for idx in 2002..2013
	loop
		execute immediate(
			'select * from NHID_GY60_T1_'||idx);
	end loop;
*/
end;
			--drop table NHID_GY60_T1_2004_ext;
			--alter table NHID_GY60_T1_2004 rename to NHID_GY60_T1_2004_ext;
--select * from NHID_GY60_T1_2002;

/* see the list of tables
--select table_name from user_tables;
*/
