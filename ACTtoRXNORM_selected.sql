drop table ACTtoRXNORM_SELECTED_EXT;
SELECT * FROM ACTtoRXNORM_SELECTED_EXT;
		create table ACTtoRXNORM_SELECTED_EXT
			(CONCEPT_ID_1 NUMBER(38),
			 CONCEPT_ID_1_CONCEPT_CODE VARCHAR2(100),
			 CONCEPT_ID_2_CONCEPT_CODE NUMBER(38),
			 CONCEPT_ID_2 NUMBER(38)
			 )
			ORGANIZATION EXTERNAL
			(
			TYPE oracle_loader
			DEFAULT DIRECTORY MAPTABLE
			ACCESS PARAMETERS
			(
			RECORDS DELIMITED BY NEWLINE
             FIELDS TERMINATED BY ','
			(
                CONCEPT_ID_1,
                CONCEPT_ID_1_CONCEPT_CODE,
                CONCEPT_ID_2_CONCEPT_CODE,
                CONCEPT_ID_2 
            )
            )
			LOCATION ('ACTtoRXNORM.csv')
			)REJECT LIMIT UNLIMITED;

create table ACTtoRXNORM_SELECTED as select * from ACTtoRXNORM_SELECTED_EXT;

select * from ACTtoRXNORM_SELECTED_EXT;

--drop table ACTtoRXNORM_SELECTED_EXT;
--DROP TABLE ACTtoRXNORM_SELECTED;
--alter table NHID_GY20_T1_2004 rename to NHID_GY20_T1_2004_ext;
--select * from NHID_GJ_2002;
--select * from NHID_GJ_2013;

/* see the list of tables
--select table_name from user_tables;
*/

