drop table if exists logs.sys_list
;;
create table logs.sys_list (
    Module String,
    system_name String,
    system_module String,
    ls_id String
) ENGINE = Join(any, inner, Module)
;;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('СКАТ-ДИР', 'СКАТ-ДИР', 'СКАТ-ДИР', 'skatdir');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('aoffense', 'АС «Мониторинг»', 'Единый реестр дел об АП', 'aoffense');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('АИС_РПТ', 'АИС РПТ', 'АИС РПТ', 'aisrpt');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('plan2019', 'АС «Мониторинг»', 'План проверок на 2019 год', 'plan2019');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('rostrans_avto', 'АС «Мониторинг»', 'Статистическая отчетность -- Госавтодорнадзор', 'rostrans_avto');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('reestr', 'АС «Мониторинг»', 'Реестр поднадздорных субъектов', 'reestr');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('ЕРРД', 'ЕРРД', 'ЕРРД', 'errd');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('rostrans', 'АС «Мониторинг»', 'Сводная отчетность', 'rostrans');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('rostrans_morrech', 'АС «Мониторинг»', 'Статистическая отчетность -- Госморречнадзор', 'rostrans_morrech');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('rostrans_utb', 'АС «Мониторинг»', 'Статистическая отчетность -- УТБ', 'rostrans_utb');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('rostrans_zhd', 'АС «Мониторинг»', 'Статистическая отчетность -- Госжелдорнадзор', 'rostrans_zhd');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('rostrans_avia', 'АС «Мониторинг»', 'Статистическая отчетность -- Госавианадзор', 'rostrans_avia')    ;;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('PreventiveActionPlan', 'АС «Мониторинг»', 'Профилактические мероприятия', 'preventive_action_plan');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('plan2018', 'АС «Мониторинг»', 'План проверок на 2018 год', 'plan2018');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('incidentsZHD', 'АС «Мониторинг»', 'Учет пожаров на ЖДТ', 'incidents_zhd');;
 


