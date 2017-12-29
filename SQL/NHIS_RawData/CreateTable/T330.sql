--create directory T330 as 'D:\NHIS_DATA\11.T330_T';

--declare idx number;

begin
	for idx in 2002..2013
	loop
	execute immediate(
		'create table NHID_GY30_T3_'||idx||'_ext
		( KEY_SEQ	VARCHAR2(12)
		,SEQ_NO	NUMBER(4)
		,RECU_FR_DT	VARCHAR2(8)
		,CLAUSE_CD	VARCHAR2(2)
		,ITEM_CD	VARCHAR2(2)
		,DIV_TYPE_CD	VARCHAR2(1)
		,DIV_CD	VARCHAR2(9)
		,I_II_TYPE	VARCHAR2(1)
		,UN_COST	NUMBER(8)
		,AMT	NUMBER(8)
		,DD_MQTY_EXEC_FREQ	NUMBER(8)
		,MDCN_EXEC_FREQ	NUMBER(8)
		,DD_MQTY_FREQ	NUMBER(8)
		)
		ORGANIZATION EXTERNAL
		(
		TYPE oracle_loader
		DEFAULT DIRECTORY T330
		ACCESS PARAMETERS
		(
		RECORDS DELIMITED BY ''\r\n''
		CHARACTERSET KO16KSC5601
		FIELDS TERMINATED BY ''|'' OPTIONALLY ENCLOSED BY ''"'' LRTRIM
		MISSING FIELD VALUES ARE NULL
		)
		LOCATION
		(
		''NHID_GY30_T3_'||idx||'.TXT''
		)
		)REJECT LIMIT UNLIMITED');
	end loop;
 
	for idx in 2002..2013                           
	loop
		execute immediate(                                
			'create table NHID_GY30_T3_'||idx||'
			as
			select * from NHID_GY30_T3_'||idx||'_ext');
	end loop;
 
/*
	for idx in 2002..2013
	loop
		execute immediate(
			'select * from NHID_GY30_T3_'||idx);
	end loop;
*/
end;
			--drop table NHID_GY30_T3_2004_ext;
			--alter table NHID_GY30_T3_2004 rename to NHID_GY40_T1_2004_ext;
--select * from NHID_GY30_T3_2002;

/* see the list of tables
--select table_name from user_tables;
*/
