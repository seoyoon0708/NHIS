CREATE TABLE NHIS.NHIS_YK
AS
SELECT * FROM NHID_YK_2002 union all
SELECT * FROM NHID_YK_2003 union all
SELECT * FROM NHID_YK_2004 union all
SELECT * FROM NHID_YK_2005 union all
SELECT * FROM NHID_YK_2006 union all
SELECT * FROM NHID_YK_2007 union all
SELECT * FROM NHID_YK_2008 union all
SELECT * FROM NHID_YK_2009 union all
SELECT * FROM NHID_YK_2010 union all
SELECT * FROM NHID_YK_2011 union all
SELECT * FROM NHID_YK_2012 union all
SELECT * FROM NHID_YK_2013 ;


GRANT SELECT ON NHIS_YK TO CDM_ONE_MIL;

TRUNCATE TABLE CARE_SITE;

INSERT INTO CARE_SITE
SELECT a.ykiho_id,
    null as care_site_name,
    case when a.ykiho_gubun_cd='10' then 4068130 --종합병원(Tertiary care hospital)
         when a.ykiho_gubun_cd between '20' and '27' then 4318944 --일반병원  Hospital
         when a.ykiho_gubun_cd='28' then 82020103 --요양병원
         when a.ykiho_gubun_cd='29' then 4268912 --정신요양병원 Psychiatric hospital
         when a.ykiho_gubun_cd between '30' and '39' then 82020105 --의원
         when a.ykiho_gubun_cd between '40' and '49' then 82020106 --치과병원
         when a.ykiho_gubun_cd between '50' and '59' then 82020107 --치과의원
         when a.ykiho_gubun_cd between '60' and '69' then 82020108 --조산원
         when a.ykiho_gubun_cd='70' then 82020109 --보건소
         when a.ykiho_gubun_cd between '71' and '72' then 82020110 --보건지소
         when a.ykiho_gubun_cd between '73' and '74' then 82020111 --보건진료소
         when a.ykiho_gubun_cd between '75' and '76' then 82020112 --모자보건센터
         when a.ykiho_gubun_cd='77' then 82020113 --보건의료원
         when a.ykiho_gubun_cd between '80' and '89' then 4131032 --약국 Pharmacy
         when a.ykiho_gubun_cd='91' then 82020115 --한방종합병원
         when a.ykiho_gubun_cd='92' then 82020116 --한방병원
         when a.ykiho_gubun_cd between '93' and '97' then 82020117 --한의원
         when a.ykiho_gubun_cd between '98' and '99' then 82020118 --한약방
    end as place_of_service_concept_id,
    a.ykiho_sido as location_id,
    a.ykiho_id as care_site_source_value,
    (a.ykiho_gubun_cd || '/' || (case when length(a.org_type) = 1 then '0' || org_type else org_type end)) as place_of_service_source_value
FROM (select x.*
             ,row_number() over (partition by ykiho_id order by stnd_y desc) RN
        from NHIS.NHIS_YK x) a
where RN=1;

COMMIT;
