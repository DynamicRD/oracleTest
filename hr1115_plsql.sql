-- departments 에서 반복문을 이용해서 부서 10,20,30,40 정보를 출력하시오
select * from departments where department_id in(10,20,30,40);

declare
    row_type departments%rowtype;
begin
    for i in 1..9 loop
            select * into row_type from departments where department_id = i*10;
            dbms_output.put_line(row_type.department_id || ' ' ||row_type.department_name);
    end loop;
end;
/