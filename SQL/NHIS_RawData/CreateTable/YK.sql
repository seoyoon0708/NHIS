--create directory YK as 'D:\NHIS_DATA\13.T';

--declare idx number;

begin
	for idx in 2002..2013
	loop
	execute immediate(
		'create table NHID_YK_'||idx||'_ext
			(STND_Y 			VARCHAR2(4)
			,YKIHO_ID 			NUMBER(6)
			,YKIHO_GUBUN_CD 	VARCHAR2(2)
			,ORG_TYPE 			VARCHAR2(2)
			,YKIHO_SIDO 		VARCHAR2(2)
			,SICKBED_CNT 		NUMBER(5)
			,DR_CNT 			NUMBER(5)
			,CT_YN 				VARCHAR2(1)
			,MRI_YN 			VARCHAR2(1)
			,PET_YN 			VARCHAR2(1)
			)
			ORGANIZATION EXTERNAL
			(
			TYPE oracle_loader
			DEFAULT DIRECTORY YK
			ACCESS PARAMETERS
			(
			RECORDS DELIMITED BY ''\r\n''
			CHARACTERSET KO16KSC5601
			FIELDS TERMINATED BY ''|'' OPTIONALLY ENCLOSED BY ''"'' LRTRIM
			MISSING FIELD VALUES ARE NULL
			)
			LOCATION
			(
			''NHID_YK_'||idx||'.TXT''
			)
			)REJECT LIMIT UNLIMITED');
		end loop;

	for idx in 2002..2013
	loop
		execute immediate(
			'create table NHID_YK_'||idx||'
			as
			select * from NHID_YK_'||idx||'_ext');
	end loop;
      /*
	for idx in 2002..2013
	loop
		execute immediate(
			'select * from NHID_YK_'||idx);
	end loop;   
	  */
end;
                 



--drop table NHID_YK_2002_EXT;
--alter table NHID_YK_2004 rename to NHID_YK_2004_ext;  \
--select * from NHID_YK_2013;

/* see the list of tables
--select table_name from user_tables;
*/
