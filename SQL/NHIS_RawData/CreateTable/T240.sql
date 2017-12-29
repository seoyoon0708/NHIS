--create directory T240 as 'D:\NHIS_DATA\08.T240_T';
--declare idx number;

begin
	for idx in 2002..2013
	loop
	execute immediate(
		'create table NHID_GY40_T2_'||idx||'_ext
		( KEY_SEQ	varchar2(12)
		,SEQ_NO	number(4)
		,RECU_FR_DT	varchar2(8)
		,DSBJT_CD	varchar2(2)
		,SICK_SYM	varchar2(6)
		)
		ORGANIZATION EXTERNAL
		(
		TYPE oracle_loader
		DEFAULT DIRECTORY T240
		ACCESS PARAMETERS
		(
		RECORDS DELIMITED BY ''\r\n''
		CHARACTERSET KO16KSC5601
		FIELDS TERMINATED BY ''|'' OPTIONALLY ENCLOSED BY ''"'' LRTRIM
		MISSING FIELD VALUES ARE NULL
		)
		LOCATION
		(
		''NHID_GY40_T2_'||idx||'.TXT''
		)
		)REJECT LIMIT UNLIMITED');
	end loop;
            
	for idx in 2002..2013
	loop
		execute immediate(
			'create table NHID_GY40_T2_'||idx||'
			as
			select * from NHID_GY40_T2_'||idx||'_ext');
	end loop;

/*
	for idx in 2002..2013
	loop
		execute immediate(
			'select * from NHID_GY40_T2_'||idx);
	end loop;
*/
end;
			--drop table NHID_GY40_T2_2004_ext;
			--alter table NHID_GY40_T2_2004 rename to NHID_GY40_T1_2004_ext;
--select * from NHID_GY40_T2_2002;

/* see the list of tables
--select table_name from user_tables;
*/
