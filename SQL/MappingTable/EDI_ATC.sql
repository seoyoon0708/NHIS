--CDM_ONE_MIL

create table EDItoATC_EXT
			(PRODUCT_CODE VARCHAR2(20)
			 ,ATC_CODE VARCHAR2(20)
			)
			ORGANIZATION EXTERNAL
			(
			TYPE oracle_loader
			DEFAULT DIRECTORY MAPTABLE
			ACCESS PARAMETERS
			(
			RECORDS DELIMITED BY newline fields
			MISSING FIELD VALUES ARE NULL
			)
			LOCATION
			(
			'atc_code_book.csv'
			)
			)REJECT LIMIT UNLIMITED;

create table EDItoATC AS
(SELECT  * FROM    
    (
        SELECT    E.*, ROWNUM R
        FROM      editoatc_ext E
        )
WHERE   R > 1
);

SELECT COUNT(*) FROM EDItoATC;


--drop table EDItoATC_EXT;
--DROP TABLE EDItoATC;
--alter table NHID_GY20_T1_2004 rename to NHID_GY20_T1_2004_ext;
--select * from NHID_GJ_2002;
--select * from NHID_GJ_2013;

/* see the list of tables
--select table_name from user_tables;
*/

