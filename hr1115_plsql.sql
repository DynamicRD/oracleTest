-- departments 에서 반복문을 이용해서 부서 10,20,30,40 정보를 출력하시오

begin
     for i in 2..9 loop
            dbms_output.put_line('---------'||i||'단---------');
            for j in 1..9 loop
                dbms_output.put_line(i || ' X ' || j || ' = ' || i*j);
            end loop;
     end loop;
end;
/