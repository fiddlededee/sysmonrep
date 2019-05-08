drop table if exists logs.sys_list
;;
create table logs.sys_list (
    Module String,
    system_name String,
    system_module String
) ENGINE = Join(any, inner, Module)
;;
insert into logs.sys_list (Module, system_name, system_module) values ('СКАТ-ДИР', 'СКАТ-ДИР', 'СКАТ-ДИР');;
insert into logs.sys_list (Module, system_name, system_module) values ('aoffense', 'АС «Мониторинг»', 'Единый реестр дел об АП');;
insert into logs.sys_list (Module, system_name, system_module) values ('АИС_РПТ', 'АИС РПТ', 'АИС РПТ');;
insert into logs.sys_list (Module, system_name, system_module) values ('plan2019', 'АС «Мониторинг»', 'План проверок на 2019 год');;
insert into logs.sys_list (Module, system_name, system_module) values ('rostrans_avto', 'АС «Мониторинг»', 'Статистическая отчетность -- Госавтодорнадзор');;
insert into logs.sys_list (Module, system_name, system_module) values ('reestr', 'АС «Мониторинг»', 'Реестр поднадздорных субъектов');;
insert into logs.sys_list (Module, system_name, system_module) values ('ЕРРД', 'ЕРРД', 'ЕРРД');;
insert into logs.sys_list (Module, system_name, system_module) values ('rostrans', 'АС «Мониторинг»', 'Сводная отчетность');;
insert into logs.sys_list (Module, system_name, system_module) values ('rostrans_morrech', 'АС «Мониторинг»', 'Статистическая отчетность -- Госморречнадзор');;
insert into logs.sys_list (Module, system_name, system_module) values ('rostrans_utb', 'АС «Мониторинг»', 'Статистическая отчетность -- УТБ');;
insert into logs.sys_list (Module, system_name, system_module) values ('rostrans_zhd', 'АС «Мониторинг»', 'Статистическая отчетность -- Госжелдорнадзор');;
insert into logs.sys_list (Module, system_name, system_module) values ('rostrans_avia', 'АС «Мониторинг»', 'Статистическая отчетность -- Госавианадзор')    ;;
insert into logs.sys_list (Module, system_name, system_module) values ('PreventiveActionPlan', 'АС «Мониторинг»', 'Профилактические мероприятия');;
insert into logs.sys_list (Module, system_name, system_module) values ('plan2018', 'АС «Мониторинг»', 'План проверок на 2018 год');;
insert into logs.sys_list (Module, system_name, system_module) values ('incidentsZHD', 'АС «Мониторинг»', 'Учет пожаров на ЖДТ');;
 
