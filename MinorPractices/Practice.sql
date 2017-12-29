--create directory T140 as 'D:\NHIS_DATA\04.T140_T';

select * from NHID_GY40_T1_2002_test_ext;

select * from dual;

--define dir=D:\NHIS_DATA\04.T140_T as T140;

drop table NHID_GY40_T1_2002_test_ext;

  create table NHID_GY40_T1_2002_test_ext
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
			RECORDS DELIMITED BY '\n'
			CHARACTERSET KO16KSC5601
			FIELDS TERMINATED BY '|' OPTIONALLY ENCLOSED BY '"' LRTRIM
			MISSING FIELD VALUES ARE NULL
			)
			LOCATION
			(
			'NHID_GY40_T1_2002_test.txt'
			)
			)REJECT LIMIT UNLIMITED;

begin
	for idx in 2002..2013
	loop
		execute immediate(
			'create table NHID_GY40_T1_'||idx||'
			as
			select * from NHID_GY40_T1_'||idx||'_ext');
	end loop;
end;

begin
	for idx in 2002..2013
	loop
		execute immediate(
			'select * from NHID_GY40_T1_'||idx);
	end loop;
end;
			--drop table NHID_GY40_T1_2004_ext;
			--alter table NHID_GY40_T1_2004 rename to NHID_GY40_T1_2004_ext;

