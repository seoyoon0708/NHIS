
select * from drug_exposure_ex_ext;

insert into death select * from death_ex;
insert into person select * from person_ex;
/*insert into drug_exposure select * from drug_exposure_ex_;*/
insert into care_site select * from care_site_ex;
insert into provider select * from provider_ex;
/*insert into specimen select * from specimen_ex;*/
insert into location select * from location_ex;
insert into observation select * from observation_ex;
insert into payer_plan_period select * from payer_plan_period_ex;
insert into measurement select * from measurement_ex;
insert into visit_occurrence select * from visit_occurrence_ex;
insert into condition_occurrence select * from condition_occurrence_ex;
insert into device_exposure select * from device_exposure_ex;
insert into observation_period select * from observation_period_ex;
insert into procedure_occurrence select * from procedure_occurrence_ex;

select * from all_tables where owner='CDM_ONE_MIL';
