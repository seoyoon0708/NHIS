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
    case when a.ykiho_gubun_cd='10' then 4068130 --���պ���(Tertiary care hospital)
         when a.ykiho_gubun_cd between '20' and '27' then 4318944 --�Ϲݺ���  Hospital
         when a.ykiho_gubun_cd='28' then 82020103 --��纴��
         when a.ykiho_gubun_cd='29' then 4268912 --���ſ�纴�� Psychiatric hospital
         when a.ykiho_gubun_cd between '30' and '39' then 82020105 --�ǿ�
         when a.ykiho_gubun_cd between '40' and '49' then 82020106 --ġ������
         when a.ykiho_gubun_cd between '50' and '59' then 82020107 --ġ���ǿ�
         when a.ykiho_gubun_cd between '60' and '69' then 82020108 --�����
         when a.ykiho_gubun_cd='70' then 82020109 --���Ǽ�
         when a.ykiho_gubun_cd between '71' and '72' then 82020110 --��������
         when a.ykiho_gubun_cd between '73' and '74' then 82020111 --���������
         when a.ykiho_gubun_cd between '75' and '76' then 82020112 --���ں��Ǽ���
         when a.ykiho_gubun_cd='77' then 82020113 --�����Ƿ��
         when a.ykiho_gubun_cd between '80' and '89' then 4131032 --�౹ Pharmacy
         when a.ykiho_gubun_cd='91' then 82020115 --�ѹ����պ���
         when a.ykiho_gubun_cd='92' then 82020116 --�ѹ溴��
         when a.ykiho_gubun_cd between '93' and '97' then 82020117 --���ǿ�
         when a.ykiho_gubun_cd between '98' and '99' then 82020118 --�Ѿ��
    end as place_of_service_concept_id,
    a.ykiho_sido as location_id,
    a.ykiho_id as care_site_source_value,
    (a.ykiho_gubun_cd || '/' || (case when length(a.org_type) = 1 then '0' || org_type else org_type end)) as place_of_service_source_value
FROM (select x.*
             ,row_number() over (partition by ykiho_id order by stnd_y desc) RN
        from NHIS.NHIS_YK x) a
where RN=1;

COMMIT;

SELECT * FROM CARE_SITE;
