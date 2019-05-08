select ascii from
(select Module as "ModuleName"
    , concat('3+|*', case when sys_list.system_name = sys_list.system_module then sys_list.system_name else concat(sys_list.system_name, ': ', sys_list.system_module) end, '*') as ascii
    , today() as EventDate
    , 1 as sort
from logs.login 
    ANY inner join logs.sys_list USING Module 
group by login.Module,sys_list.system_module, sys_list.system_name

union all

select --Module, sys_list.system_name, 
    login.Module as "ModuleName"
    , concat( 
        '|',toString(formatDateTime(toDate(EventDate), '%d.%m')) 
        ,' |', toString(count(distinct Login, EventDate))
        ,' |', toString(count(*))
    ) as ascii
    ,EventDate
    ,2 as sort
from logs.login 
    ANY inner join logs.sys_list USING Module
where EventDate between toMonday(today()-7) and today()
group by Module, formatDateTime(toDate(EventDate), '%d.%m'), EventDate, sys_list.system_name, sys_list.system_module
) order by ModuleName asc, sort, EventDate desc 
