declare idx number;

begin

    for idx in 2002..2010
    loop
    	dbms_output.put_line(idx);
    	execute immediate 'drop table NHID_GY40_T1_'||idx     ;
    end loop;
    end;
       begin
	for i in 2002..2013
    loop
    dbms_output.put_line(i);
			execute immediate ('drop table NHID_GY30_T2_'||i||'_ext');
    end loop;

end;

        --    select * from NHID_GY20_T1_2013_ext;

--select * from NHID_GY20_T1_2006;


