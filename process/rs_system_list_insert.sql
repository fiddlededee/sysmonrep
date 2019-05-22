drop table if exists logs.sys_list
;;
create table logs.sys_list (
    Module String,
    system_name String,
    system_module String,
    ls_id String
) ENGINE = Join(any, inner, Module)
;;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('АИС_РПТ', 'АИС РПТ', 'АИС РПТ', 'a010_aisrpt');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('rostrans_avia', 'АС «Мониторинг»', 'Статистическая отчетность -- Госавианадзор', 'a020010_rostrans_avia')    ;;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('rostrans_avto', 'АС «Мониторинг»', 'Статистическая отчетность -- Госавтодорнадзор', 'a020020_rostrans_avto');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('rostrans_zhd', 'АС «Мониторинг»', 'Статистическая отчетность -- Госжелдорнадзор', 'a020030_rostrans_zhd');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('rostrans_morrech', 'АС «Мониторинг»', 'Статистическая отчетность -- Госморречнадзор', 'a020040_rostrans_morrech');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('rostrans_utb', 'АС «Мониторинг»', 'Статистическая отчетность -- УТБ', 'a020050_rostrans_utb');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('aoffense', 'АС «Мониторинг»', 'Единый реестр дел об АП', 'a020060_aoffense');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('rostrans', 'АС «Мониторинг»', 'Сводная отчетность', 'a020070_rostrans');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('plan2018', 'АС «Мониторинг»', 'План проверок на 2018 год', 'a020080_plan2018');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('plan2019', 'АС «Мониторинг»', 'План проверок на 2019 год', 'a020090_plan2019');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('reestr', 'АС «Мониторинг»', 'Реестр поднадздорных субъектов', 'a020100_reestr');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('PreventiveActionPlan', 'АС «Мониторинг»', 'Профилактические мероприятия', 'a020110_preventive_action_plan');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('incidentsZHD', 'АС «Мониторинг»', 'Учет пожаров на ЖДТ', 'a020120_incidents_zhd');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('ЕРРД', 'ЕРРД', 'ЕРРД', 'a030010_errd');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('СКАТ-ДИР', 'СКАТ-ДИР', 'СКАТ-ДИР', 'a040010_skatdir');;
insert into logs.sys_list (Module, system_name, system_module, ls_id) values ('СКАТ-ТК-ЦОД', 'СКАТ-ТК-ЦОД', 'СКАТ-ТК-ЦОД', 'a050010_skattk');;
 


