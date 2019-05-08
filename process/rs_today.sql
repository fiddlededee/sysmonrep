select --Module, sys_list.system_name, 
    sys_list.system_name as "Система"
    --,case when sys_list.system_name = sys_list.system_module then sys_list.system_name else concat(sys_list.system_name, ': ', sys_list.system_module) end as "Система (модуль)"
    , count(distinct Login, EventDate,system_module) as "Количество заходов (без учета повторных заходов в течение дня)"
    , count(*) as "Количество заходов (всего)"
from logs.login 
    ANY inner join logs.sys_list USING Module
where EventDate between today() and today() 
group by sys_list.system_name
order by count(distinct Login, EventDate) desc
