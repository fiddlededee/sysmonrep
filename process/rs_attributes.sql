select * from (
    select concat(':today: ', toString(formatDateTime(today(),'%d.%m.%Y'))) as row
    union all select concat(':todaytime: ', toString(formatDateTime(now(),'%d.%m.%Y %H:%M', 'Europe/Moscow'))) as row
    union all select concat(':yesterday: ', toString(formatDateTime(today()-1,'%d.%m.%Y'))) as row
    union all select concat(':startweek: ', toString(formatDateTime(toMonday(today()),'%d.%m.%Y'))) as row
    union all select concat(':startprevweek: ', toString(formatDateTime(toMonday(today()-7),'%d.%m.%Y'))) as row
    union all select concat(':endprevweek: ', toString(formatDateTime(toMonday(today()-7)+6,'%d.%m.%Y'))) as row
)
