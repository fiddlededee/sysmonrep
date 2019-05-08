#!/bin/bash
cat rs_system_list.sql | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"rs_today.csv"   
cat rs_today.sql | sed 's/today() and today()/today() and today()/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"rs_today.csv"   
cat rs_today.sql | sed 's/today() and today()/today()-1 and today()-1/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"rs_yesterday.csv"   
cat rs_today.sql | sed 's/today() and today()/toMonday(today()) and today()/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"rs_week.csv"   
cat rs_today.sql | sed 's/today() and today()/toMonday(today()-7) and toMonday(today()-7) + 6/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"rs_prevweek.csv"   
cat rs_today.sql | sed 's/today() and today()/toMonday(today()-7) and toMonday(today()-7) + 6/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"rs_prevweek.csv"   
cat rs_attributes.sql | clickhouse-client -mn --config-file config.xml -f "CSV" | sed 's/"//g' >"attributes.adoc"
cat rs_days.sql | clickhouse-client -mn --config-file config.xml -f "CSV" | sed 's/"//g' >"rs_days.adoc"
asciidoctor -b docbook -d book -a data-uri! report.adoc
asciidoctor -b html5 -d book -a data-uri! report.adoc
/home/asciidoctor-fopub/fopub report.xml
echo converted


