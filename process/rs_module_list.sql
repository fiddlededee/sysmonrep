select
    case when sys_list.system_name = sys_list.system_module then sys_list.system_name else concat(sys_list.system_name, ': ', sys_list.system_module) end as module_full_name
    ,sys_list.system_name
    ,Module as module
    ,ls_id
from logs.login
    ANY inner join logs.sys_list USING Module 
where EventDate between today()-1 and today() 
group by Module, sys_list.system_name, sys_list.system_module, sys_list.ls_id
order by sys_list.system_name, sys_list.system_module
