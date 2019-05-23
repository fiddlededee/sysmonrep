drop table if exists RslHourly;
create table RslHourly (ls_id TEXT, hour TEXT, event_date TEXT, cnt INTEGER);

insert into RslHourly
select
	ls_id
	,strftime('%d.%m.%Y', datetime(event_time_stamp/1000, 'unixepoch', 'localtime')) || ' ' || strftime('%H', datetime(event_time_stamp/1000, 'unixepoch', 'localtime')) as hour
	,datetime(event_time_stamp/1000, 'unixepoch', 'localtime')
	,count(*) as cnt
	--, SysList.module_name
from 
	Login
	inner join SysList
	on SysList.module_id = login.module
group by login.event_date, module_name, hour	
order by ls_id, module_name asc, login.event_date desc, hour desc;

drop table if exists RslLsIdOnly;
create table RslLsIdOnly (ls_id TEXT);
insert into RslLsIdOnly
select distinct ls_id from RslHourly;

drop table if exists RslHourlyAdoc;
create table RslHourlyAdoc (adoc TEXT, ls_id TEXT);
insert into RslHourlyAdoc
select ':ls_id: ' || ls_id || char(10)  
	|| ':module_name: ' || module_name || char(10)
	|| ':records: ' || (select count(*) from RslHourly where RslHourly.ls_id = SysList.ls_id) || char(10)
	|| 'include::hourly_template.adoc[]' || char(10) || char(10)
	
	,ls_id
from SysList



-- select ls_id, hour, cnt from RsHourly order by ls_id asc, event_date desc, hour desc

--select * from SysList


