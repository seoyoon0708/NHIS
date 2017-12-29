/**************************************
 2. ������ �Է�
	: 5�� ������ ���ɴ븦 �̿��� ����⵵�� �����ؾ� ��.
	  �� 8���� ���� ����Ʈ�� ���� 8���� ������ ���� ����
***************************************/

/**
	1) 1�� �̻� ���� + 5�� Ǯ ���� ����
*/

INSERT INTO PERSON
	(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth,
	time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id,
	care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value,
	race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id)
select
	m.person_id as person_id,
	case when o.sex=1 then 8507
		 when o.sex=2 then 8532 end as gender_concept_id,
	m.stnd_y - ((m.age_group-1) * 5) as year_of_birth,
	null as month_of_birth,
	null as day_of_birth,
	null as time_of_birth,
	38003585 as race_concept_id, --����
	38003564 as ethnicity_concept_id, --������
	o.sgg as location_id,
	null as provider_id,
	null as care_site_id,
	m.person_id as person_source_value,
	o.sex as gender_source_value,
	null as gender_source_concept_id,
	null as race_source_value,
	null as race_source_concept_id,
	null as ethnicity_source_value,
	null as ethnicity_source_concept_id
from NHIS.NHIS_JK m, --����⵵ ������ ���Ǵ� person ������
	(select x.person_id, min(x.stnd_y) as stnd_y
	from NHIS.NHIS_JK x, (
	select person_id, max(age_group) as age_group
	from (
		select distinct person_id, age_group
		from NHIS.NHIS_JK
		where person_id in (
			select distinct person_id
			from (
				select person_id, age_group, count(age_group) as age_group_cnt, min(year) as min_year, max(year) as max_year
				from NHIS.NHIS_JK
				group by person_id, age_group
			) a
			group by person_id
			having count(person_id)>1
		)
		group by person_id, age_group
		having count(age_group) = 5
	) b
	group by person_id) y
	where x.person_id=y.person_id
	and x.age_group=y.age_group
	group by x.person_id, y.person_id, x.age_group, y.age_group) n, --��������Ʈ ���ǿ� �´� person ��� ����
	(select w.person_id, w.stnd_y, q.sex, q.sgg
	from NHIS.NHIS_JK q, (
		select person_id, max(stnd_y) as stnd_y
		from NHIS.NHIS_JK
		group by person_id) w
	where q.person_id=w.person_id
	and q.stnd_y=w.stnd_y) o --�ֽ� ���� �����͸� �������� ���� ����
where m.person_id=n.PERSON_ID
and m.stnd_y=n.stnd_y
and m.person_id=o.person_id;

/**
	2) 1�� �̻� ���� + 5�� Ǯ ���� ���� + 0���� ����
		: �ڰ� ���̺� ��ü�� 0������ 2�� �̻��� ����� 12�� ����. �̿� 0���� �� min(stnd_y)�� �������� ����⵵�� ����
*/
INSERT INTO PERSON
	(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth,
	time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id,
	care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value,
	race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id)
select
	m.person_id as person_id,
	case when o.sex=1 then 8507
		 when o.sex=2 then 8532 end as gender_concept_id,
	m.stnd_y as year_of_birth,
	null as month_of_birth,
	null as day_of_birth,
	null as time_of_birth,
	38003585 as race_concept_id, --����
	38003564 as ethnicity_concept_id, --������
	o.sgg as location_id,
	null as provider_id,
	null as care_site_id,
	m.person_id as person_source_value,
	o.sex as gender_source_value,
	null as gender_source_concept_id,
	null as race_source_value,
	null as race_source_concept_id,
	null as ethnicity_source_value,
	null as ethnicity_source_concept_id
from NHIS.NHIS_JK m, --����⵵ ������ ���Ǵ� person ������
	(select x.person_id, min(x.stnd_y) as stnd_y
	from NHIS.NHIS_JK x, (
		select distinct person_id
		from NHIS.NHIS_JK
		where age_group=0
		and person_id in (
		select person_id
		from (
		select person_id, age_group, count(age_group) as age_group_cnt
		from NHIS.NHIS_JK
		where person_id in (
			select distinct person_id
			from (
				select distinct person_id
				from (
					select person_id, age_group, count(age_group) as age_group_cnt, min(year) as min_year, max(year) as max_year
					from NHIS.NHIS_JK
					group by person_id, age_group
				) a
				group by person_id
				having count(person_id)>1
			) b
			where b.person_id not in (
				select person_id
				from NHIS.NHIS_JK
				where person_id =b.person_id
				group by person_id, age_group
				having count(age_group) = 5
			)
		)
		group by person_id, age_group
		) x
		group by x.person_id
		having max(x.age_group_cnt) < 5
		) ) y
	where x.person_id=y.person_id
	and x.age_group=0
	group by x.person_id) n, --��������Ʈ ���ǿ� �´� person ��� ����
	(select w.person_id, w.stnd_y, q.sex, q.sgg
	from NHIS.NHIS_JK q, (
		select person_id, max(stnd_y) as stnd_y
		from NHIS.NHIS_JK
		group by person_id) w
	where q.person_id=w.person_id
	and q.stnd_y=w.stnd_y) o --�ֽ� ���� �����͸� �������� ���� ����
where m.person_id=n.person_id
and m.stnd_y=n.stnd_y
and m.person_id=o.person_id


/**
	3-1) 1�� �̻� ���� + 5�� Ǯ ���� ���� + 0���� ������ + ���� ���� ������ �⵵�� ����
	: �� 76,594 ��
*/
-- ���� ���� ������
INSERT INTO PERSON
	(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth,
	time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id,
	care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value,
	race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id)
select
	d1.person_id as person_id,
	case when d3.sex=1 then 8507
		 when d3.sex=2 then 8532 end as gender_concept_id,
	d1.stnd_y - ((d1.age_group-1) * 5) as year_of_birth,
	null as month_of_birth,
	null as day_of_birth,
	null as time_of_birth,
	38003585 as race_concept_id, --����
	38003564 as ethnicity_concept_id, --������
	d3.sgg as location_id,
	null as provider_id,
	null as care_site_id,
	d1.person_id as person_source_value,
	d3.sex as gender_source_value,
	null as gender_source_concept_id,
	null as race_source_value,
	null as race_source_concept_id,
	null as ethnicity_source_value,
	null as ethnicity_source_concept_id
from NHIS.NHIS_JK d1, --����⵵ ������ ���Ǵ� person ������
(select x.person_id, min(y.min_stnd_y) as stnd_y
from

(
select distinct m.person_id, m.age_group, min(m.stnd_y) as min_stnd_y, max(m.stnd_y) as max_stnd_y
from NHIS.NHIS_JK m,
(select distinct person_id, min_age_group
from (
	select person_id, min(age_group) as min_age_group
	from (
	select person_id, age_group, count(age_group) as age_group_cnt
	from NHIS.NHIS_JK
	where person_id in (
		select distinct person_id
		from (
			select distinct person_id
			from (
				select person_id, age_group, count(age_group) as age_group_cnt, min(year) as min_year, max(year) as max_year
				from NHIS.NHIS_JK
				group by person_id, age_group
			) a
			group by person_id
			having count(person_id)>1
		) b
		where b.person_id not in (
			select person_id
			from NHIS.NHIS_JK
			where person_id =b.person_id
			group by person_id, age_group
			having count(age_group) = 5
		)
	)
	group by person_id, age_group
	) x
	group by x.person_id
	having max(x.age_group_cnt) < 5
) y
where y.person_id not in (
select distinct person_id
from NHIS.NHIS_JK
where person_id=y.person_id
and age_group=0)) n
where m.person_id=n.person_id
group by m.person_id, m.age_group
) x,

(
select distinct m.person_id, m.age_group, min(m.stnd_y) as min_stnd_y, max(m.stnd_y) as max_stnd_y
from NHIS.NHIS_JK m,
(select distinct person_id, min_age_group
from (
	select person_id, min(age_group) as min_age_group
	from (
	select person_id, age_group, count(age_group) as age_group_cnt
	from NHIS.NHIS_JK
	where person_id in (
		select distinct person_id
		from (
			select distinct person_id
			from (
				select person_id, age_group, count(age_group) as age_group_cnt, min(year) as min_year, max(year) as max_year
				from NHIS.NHIS_JK
				group by person_id, age_group
			) a
			group by person_id
			having count(person_id)>1
		) b
		where b.person_id not in (
			select person_id
			from NHIS.NHIS_JK
			where person_id =b.person_id
			group by person_id, age_group
			having count(age_group) = 5
		)
	)
	group by person_id, age_group
	) x
	group by x.person_id
	having max(x.age_group_cnt) < 5
) y
where y.person_id not in (
select distinct person_id
from NHIS.NHIS_JK
where person_id=y.person_id
and age_group=0)) n
where m.person_id=n.person_id
group by m.person_id, m.age_group
) y

where x.person_id=y.person_id
and x.age_group + 1=y.age_group
and x.max_stnd_y + 1=y.min_stnd_y

group by x.person_id) d2, --��������Ʈ ���ǿ� �´� person ��� ����
	(select w.person_id, w.stnd_y, q.sex, q.sgg
	from NHIS.NHIS_JK q, (
		select person_id, max(stnd_y) as stnd_y
		from NHIS.NHIS_JK
		group by person_id) w
	where q.person_id=w.person_id
	and q.stnd_y=w.stnd_y) d3 --�ֽ� ���� �����͸� �������� ���� ����
where d1.person_id=d2.person_id
and d1.stnd_y=d2.stnd_y
and d1.person_id=d3.person_id


/**
	3-2) 1�� �̻� ���� + 5�� Ǯ ���� ���� + 0���� ������ + ���� ���� ������ �⵵�� �񿬼�
	: �� ���� ���۳⵵�� �����밡 ���۵� ������ ������
	: �� 2,862 ��
*/
-- ���� ���� ������
INSERT INTO PERSON
	(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth,
	time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id,
	care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value,
	race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id)
select
	d1.person_id as person_id,
	case when d3.sex=1 then 8507
		 when d3.sex=2 then 8532 end as gender_concept_id,
	d1.stnd_y - ((d1.age_group-1) * 5) as year_of_birth,
	null as month_of_birth,
	null as day_of_birth,
	null as time_of_birth,
	38003585 as race_concept_id, --����
	38003564 as ethnicity_concept_id, --������
	d3.sgg as location_id,
	null as provider_id,
	null as care_site_id,
	d1.person_id as person_source_value,
	d3.sex as gender_source_value,
	null as gender_source_concept_id,
	null as race_source_value,
	null as race_source_concept_id,
	null as ethnicity_source_value,
	null as ethnicity_source_concept_id
from NHIS.NHIS_JK d1, --����⵵ ������ ���Ǵ� person ������
	(
	select s1.person_id, s1.age_group, min(s1.stnd_y) as stnd_y
	from NHIS.NHIS_JK s1,
	(
	select distinct person_id, max_age_group, min_age_group
	from (
	select distinct person_id, max_age_group, min_age_group
	from (
		select person_id, max(age_group) as max_age_group, min(age_group) as min_age_group
		from (
		select person_id, age_group, count(age_group) as age_group_cnt
		from NHIS.NHIS_JK
		where person_id in (
			select distinct person_id
			from (
				select distinct person_id
				from (
					select person_id, age_group, count(age_group) as age_group_cnt, min(year) as min_year, max(year) as max_year
					from NHIS.NHIS_JK
					group by person_id, age_group
				) a
				group by person_id
				having count(person_id)>1
			) b
			where b.person_id not in (
				select person_id
				from NHIS.NHIS_JK
				where person_id =b.person_id
				group by person_id, age_group
				having count(age_group) = 5
			)
		)
		group by person_id, age_group
		) x
		group by x.person_id
		having max(x.age_group_cnt) < 5
	) y
	where y.person_id not in (
	select distinct person_id
	from NHIS.NHIS_JK
	where person_id=y.person_id
	and age_group=0)) x
	where person_id not in (


	--
	select distinct x.person_id
	from

	(
	select distinct m.person_id, m.age_group, min(m.stnd_y) as min_stnd_y, max(m.stnd_y) as max_stnd_y
	from NHIS.NHIS_JK m,
	(select distinct person_id, min_age_group
	from (
		select person_id, min(age_group) as min_age_group
		from (
		select person_id, age_group, count(age_group) as age_group_cnt
		from NHIS.NHIS_JK
		where person_id in (
			select distinct person_id
			from (
				select distinct person_id
				from (
					select person_id, age_group, count(age_group) as age_group_cnt, min(year) as min_year, max(year) as max_year
					from NHIS.NHIS_JK
					group by person_id, age_group
				) a
				group by person_id
				having count(person_id)>1
			) b
			where b.person_id not in (
				select person_id
				from NHIS.NHIS_JK
				where person_id =b.person_id
				group by person_id, age_group
				having count(age_group) = 5
			)
		)
		group by person_id, age_group
		) x
		group by x.person_id
		having max(x.age_group_cnt) < 5
	) y
	where y.person_id not in (
	select distinct person_id
	from NHIS.NHIS_JK
	where person_id=y.person_id
	and age_group=0)) n
	where m.person_id=n.person_id
	group by m.person_id, m.age_group
	) x,

	(
	select distinct m.person_id, m.age_group, min(m.stnd_y) as min_stnd_y, max(m.stnd_y) as max_stnd_y
	from NHIS.NHIS_JK m,
	(select distinct person_id, min_age_group
	from (
		select person_id, min(age_group) as min_age_group
		from (
		select person_id, age_group, count(age_group) as age_group_cnt
		from NHIS.NHIS_JK
		where person_id in (
			select distinct person_id
			from (
				select distinct person_id
				from (
					select person_id, age_group, count(age_group) as age_group_cnt, min(year) as min_year, max(year) as max_year
					from NHIS.NHIS_JK
					group by person_id, age_group
				) a
				group by person_id
				having count(person_id)>1
			) b
			where b.person_id not in (
				select person_id
				from NHIS.NHIS_JK
				where person_id =b.person_id
				group by person_id, age_group
				having count(age_group) = 5
			)
		)
		group by person_id, age_group
		) x
		group by x.person_id
		having max(x.age_group_cnt) < 5
	) y
	where y.person_id not in (
	select distinct person_id
	from NHIS.NHIS_JK
	where person_id=y.person_id
	and age_group=0)) n
	where m.person_id=n.person_id
	group by m.person_id, m.age_group
	) y

	where x.person_id=y.person_id
	and x.age_group + 1=y.age_group
	and x.max_stnd_y + 1=y.min_stnd_y
	)
	) s2
	where s1.person_id=s2.person_id
	and s1.age_group=s2.min_age_group
	group by s1.person_id, s1.age_group
	) d2, --��������Ʈ ���ǿ� �´� person ��� ����

	(select w.person_id, w.stnd_y, q.sex, q.sgg
	from NHIS.NHIS_JK q, (
		select person_id, max(stnd_y) as stnd_y
		from NHIS.NHIS_JK
		group by person_id) w
	where q.person_id=w.person_id
	and q.stnd_y=w.stnd_y) d3 --�ֽ� ���� �����͸� �������� ���� ����

where d1.person_id=d2.person_id
and d1.stnd_y=d2.stnd_y
and d1.person_id=d3.person_id



/**
	4) 1�� �̻� ���� + 5�� Ǯ ���� ���� + �ƽ� ���� ������ �Ǽ��� 5������ ����
		: �ƽ� ������ �ְ�� �����밡 �ƴ� �����Ͱ� 236��
		: �����ϰ� �ƽ� ������ min(stnd_y)�� �������� ����⵵ ����
*/
INSERT INTO PERSON
	(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth,
	time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id,
	care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value,
	race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id)
select
	m.person_id as person_id,
	case when o.sex=1 then 8507
		 when o.sex=2 then 8532 end as gender_concept_id,
	m.stnd_y - ((m.age_group-1) * 5) as year_of_birth,
	null as month_of_birth,
	null as day_of_birth,
	null as time_of_birth,
	38003585 as race_concept_id, --����
	38003564 as ethnicity_concept_id, --������
	o.sgg as location_id,
	null as provider_id,
	null as care_site_id,
	m.person_id as person_source_value,
	o.sex as gender_source_value,
	null as gender_source_concept_id,
	null as race_source_value,
	null as race_source_concept_id,
	null as ethnicity_source_value,
	null as ethnicity_source_concept_id
from NHIS.NHIS_JK m, --����⵵ ������ ���Ǵ� person ������
	(select x.person_id, min(stnd_y) as stnd_y
	from NHIS.NHIS_JK x, (
		select distinct person_id, age_group
		from (
		select person_id, age_group, count(age_group) as age_group_cnt
		from NHIS.NHIS_JK
		where person_id in (
			select distinct person_id
			from (
				select distinct person_id
				from (
					select person_id, age_group, count(age_group) as age_group_cnt, min(year) as min_year, max(year) as max_year
					from NHIS.NHIS_JK
					group by person_id, age_group
				) a
				group by person_id
				having count(person_id)>1
			) b
			where b.person_id not in (
				select person_id
				from NHIS.NHIS_JK
				where person_id =b.person_id
				group by person_id, age_group
				having count(age_group) = 5
			)
		)
		group by person_id, age_group
		) x
		group by x.person_id, age_group
		having max(x.age_group_cnt) > 5
	) y
	where x.PERSON_ID=y.PERSON_ID
	and x.age_group=y.age_group
	group by x.person_id, x.age_group
	) n, --��������Ʈ ���ǿ� �´� person ��� ����
	(select w.person_id, w.stnd_y, q.sex, q.sgg
	from NHIS.NHIS_JK q, (
		select person_id, max(stnd_y) as stnd_y
		from NHIS.NHIS_JK
		group by person_id) w
	where q.person_id=w.person_id
	and q.stnd_y=w.stnd_y) o --�ֽ� ���� �����͸� �������� ���� ����
where m.person_id=n.person_id
and m.stnd_y=n.stnd_y
and m.person_id=o.person_id


/**
	5) 1�� ���� + 5�� Ǯ ������
	: 2002�⿡ �ְ�� ������ ���ԵǾ� 5��° ����� ��� ������ ����. ��Ȯ�� ���� �Ұ���
*/
INSERT INTO PERSON
	(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth,
	time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id,
	care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value,
	race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id)
select
	m.person_id as person_id,
	case when o.sex=1 then 8507
		 when o.sex=2 then 8532 end as gender_concept_id,
	m.stnd_y - ((m.age_group-1) * 5) as year_of_birth,
	null as month_of_birth,
	null as day_of_birth,
	null as time_of_birth,
	38003585 as race_concept_id, --����
	38003564 as ethnicity_concept_id, --������
	o.sgg as location_id,
	null as provider_id,
	null as care_site_id,
	m.person_id as person_source_value,
	o.sex as gender_source_value,
	null as gender_source_concept_id,
	null as race_source_value,
	null as race_source_concept_id,
	null as ethnicity_source_value,
	null as ethnicity_source_concept_id
from NHIS.NHIS_JK m, --����⵵ ������ ���Ǵ� person ������
(select person_id, age_group, min(stnd_y) as stnd_y
from NHIS.NHIS_JK
where person_id in (
	select distinct person_id
	from (
		select person_id, age_group, count(age_group) as age_group_cnt, min(year) as min_year, max(year) as max_year
		from NHIS.NHIS_JK
		group by person_id, age_group
	) a
	group by person_id
	having count(person_id)=1
)
group by person_id, age_group
having count(age_group) = 5) n, --��������Ʈ ���ǿ� �´� person ��� ����
(select w.person_id, w.stnd_y, q.sex, q.sgg
	from NHIS.NHIS_JK q, (
		select person_id, max(stnd_y) as stnd_y
		from NHIS.NHIS_JK
		group by person_id) w
	where q.person_id=w.person_id
	and q.stnd_y=w.stnd_y) o --�ֽ� ���� �����͸� �������� ���� ����
where m.person_id=n.person_id
and m.stnd_y=n.stnd_y
and m.person_id=o.person_id


/**
	6) 1�� ���� + 5�� Ǯ ���� �ƴ� + 0���� ����
	: 0 ���� �����Ͱ� 2���� ������ 1�� ����
*/
INSERT INTO PERSON
	(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth,
	time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id,
	care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value,
	race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id)
select
	m.person_id as person_id,
	case when o.sex=1 then 8507
		 when o.sex=2 then 8532 end as gender_concept_id,
	m.stnd_y as year_of_birth,
	null as month_of_birth,
	null as day_of_birth,
	null as time_of_birth,
	38003585 as race_concept_id, --����
	38003564 as ethnicity_concept_id, --������
	o.sgg as location_id,
	null as provider_id,
	null as care_site_id,
	m.person_id as person_source_value,
	o.sex as gender_source_value,
	null as gender_source_concept_id,
	null as race_source_value,
	null as race_source_concept_id,
	null as ethnicity_source_value,
	null as ethnicity_source_concept_id
from NHIS.NHIS_JK m, --����⵵ ������ ���Ǵ� person ������
	(select person_id, min(stnd_y) as stnd_y
	from NHIS.NHIS_JK
	where age_group=0
	and person_id in (
	select person_id
	from (
	select person_id, age_group, count(age_group) as age_group_cnt
	from NHIS.NHIS_JK
	where person_id in (
		select distinct person_id
		from (
			select distinct person_id
			from (
				select person_id, age_group, count(age_group) as age_group_cnt, min(year) as min_year, max(year) as max_year
				from NHIS.NHIS_JK
				group by person_id, age_group
			) a
			group by person_id
			having count(person_id)=1
		) b
		where b.person_id not in (
			select person_id
			from NHIS.NHIS_JK
			where person_id =b.person_id
			group by person_id, age_group
			having count(age_group) = 5
		)
	)
	group by person_id, age_group
	) x
	group by x.person_id
	having max(x.age_group_cnt) < 5
	)
	group by person_id) n, --��������Ʈ ���ǿ� �´� person ��� ����
	(select w.person_id, w.stnd_y, q.sex, q.sgg
	from NHIS.NHIS_JK q, (
		select person_id, max(stnd_y) as stnd_y
		from NHIS.NHIS_JK
		group by person_id) w
	where q.person_id=w.person_id
	and q.stnd_y=w.stnd_y) o --�ֽ� ���� �����͸� �������� ���� ����
where m.person_id=n.person_id
and m.stnd_y=n.stnd_y
and m.person_id=o.person_id


/**
	7) 1�� ���� + 5�� Ǯ ���� �ƴ� + 0���� ������
	: ��Ȯ�� ���� �Ұ�
	: ���� ���� �⵵�� �������� �ּҰ��� ������ ������ (��: 2002�⿡ 20~24�� �����̸�, 2002�⿡ 22���� ����)
*/
INSERT INTO PERSON
	(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth,
	time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id,
	care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value,
	race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id)
select
	m.person_id as person_id,
	case when o.sex=1 then 8507
		 when o.sex=2 then 8532 end as gender_concept_id,
	m.stnd_y - ((m.age_group-1) * 5) as year_of_birth,
	null as month_of_birth,
	null as day_of_birth,
	null as time_of_birth,
	38003585 as race_concept_id, --����
	38003564 as ethnicity_concept_id, --������
	o.sgg as location_id,
	null as provider_id,
	null as care_site_id,
	m.person_id as person_source_value,
	o.sex as gender_source_value,
	null as gender_source_concept_id,
	null as race_source_value,
	null as race_source_concept_id,
	null as ethnicity_source_value,
	null as ethnicity_source_concept_id
from NHIS.NHIS_JK m, --����⵵ ������ ���Ǵ� person ������
	(select x.person_id, x.age_group, min(x.stnd_y) as stnd_y
	from NHIS.NHIS_JK x,
	(select person_id, age_group
	from (
		select person_id, min(age_group) as age_group
		from (
		select person_id, age_group, count(age_group) as age_group_cnt
		from NHIS.NHIS_JK
		where person_id in (
			select distinct person_id
			from (
				select distinct person_id
				from (
					select person_id, age_group, count(age_group) as age_group_cnt, min(year) as min_year, max(year) as max_year
					from NHIS.NHIS_JK
					group by person_id, age_group
				) a
				group by person_id
				having count(person_id)=1
			) b
			where b.person_id not in (
				select person_id
				from NHIS.NHIS_JK
				where person_id =b.person_id
				group by person_id, age_group
				having count(age_group) = 5
			)
		)
		group by person_id, age_group
		) x
		group by x.person_id
		having max(x.age_group_cnt) < 5
	) y
	where y.person_id not in (
	select distinct person_id
	from NHIS.NHIS_JK
	where person_id=y.person_id
	and age_group=0)) y
	where x.person_id=y.person_id
	and x.age_group=y.age_group
	group by x.person_id, x.age_group) n, --��������Ʈ ���ǿ� �´� person ��� ����
	(select w.person_id, w.stnd_y, q.sex, q.sgg
	from NHIS.NHIS_JK q, (
		select person_id, max(stnd_y) as stnd_y
		from NHIS.NHIS_JK
		group by person_id) w
	where q.person_id=w.person_id
	and q.stnd_y=w.stnd_y) o --�ֽ� ���� �����͸� �������� ���� ����
where m.person_id=n.person_id
and m.stnd_y=n.stnd_y
and m.person_id=o.person_id


/**
	8) 1�� ���� + 5�� Ǯ ���� �ƴ� + ���� �Ǽ��� 5������ ����
	: ��Ȯ�� ���� �Ұ�
	: ���� ���� �⵵�� �������� �߰����� ������ ������ (��: 2002�⿡ 20~24�� �����̸�, 2002�⿡ 22���� ����)
*/
INSERT INTO PERSON
	(person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth,
	time_of_birth, race_concept_id, ethnicity_concept_id, location_id, provider_id,
	care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value,
	race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id)
select
	m.person_id as person_id,
	case when o.sex=1 then 8507
		 when o.sex=2 then 8532 end as gender_concept_id,
	m.stnd_y - ((m.age_group-1) * 5) as year_of_birth,
	null as month_of_birth,
	null as day_of_birth,
	null as time_of_birth,
	38003585 as race_concept_id, --����
	38003564 as ethnicity_concept_id, --������
	o.sgg as location_id,
	null as provider_id,
	null as care_site_id,
	m.person_id as person_source_value,
	o.sex as gender_source_value,
	null as gender_source_concept_id,
	null as race_source_value,
	null as race_source_concept_id,
	null as ethnicity_source_value,
	null as ethnicity_source_concept_id
from NHIS.NHIS_JK m, --����⵵ ������ ���Ǵ� person ������
	(select m.person_id, min(m.age_group) as age_group, min(m.stnd_y) as stnd_y
	from NHIS.NHIS_JK m,
		(select distinct person_id
		from (
		select person_id, age_group, count(age_group) as age_group_cnt
		from NHIS.NHIS_JK
		where person_id in (
			select distinct person_id
			from (
				select distinct person_id
				from (
					select person_id, age_group, count(age_group) as age_group_cnt, min(year) as min_year, max(year) as max_year
					from NHIS.NHIS_JK
					group by person_id, age_group
				) a
				group by person_id
				having count(person_id)=1
			) b
			where b.person_id not in (
				select person_id
				from NHIS.NHIS_JK
				where person_id =b.person_id
				group by person_id, age_group
				having count(age_group) = 5
			)
		)
		group by person_id, age_group
		) x
		group by x.person_id
		having max(x.age_group_cnt) > 5) n
	where m.person_id=n.person_id
	group by m.person_id) n, --��������Ʈ ���ǿ� �´� person ��� ����
	(select w.person_id, w.stnd_y, q.sex, q.sgg
	from NHIS.NHIS_JK q, (
		select person_id, max(stnd_y) as stnd_y
		from NHIS.NHIS_JK
		group by person_id) w
	where q.person_id=w.person_id
	and q.stnd_y=w.stnd_y) o --�ֽ� ���� �����͸� �������� ���� ����
where m.person_id=n.person_id
and m.stnd_y=n.stnd_y
and m.person_id=o.person_id;
