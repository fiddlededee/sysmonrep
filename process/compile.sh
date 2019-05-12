#!/bin/bash
rm ../out/*
cp *.adoc ../out
cat rs_system_list.sql | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"../out/rs_today.csv"   
cat rs_today.sql | sed 's/today() and today()/today() and today()/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"../out/rs_today.csv"   
cat rs_today.sql | sed 's/today() and today()/today()-1 and today()-1/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"../out/rs_yesterday.csv"   
cat rs_today.sql | sed 's/today() and today()/toMonday(today()) and today()/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"../out/rs_week.csv"   
cat rs_today.sql | sed 's/today() and today()/toMonday(today()-7) and toMonday(today()-7) + 6/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"../out/rs_prevweek.csv"   
cat rs_today.sql | sed 's/today() and today()/toMonday(today()-7) and toMonday(today()-7) + 6/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"../out/rs_prevweek.csv"   
cat rs_attributes.sql | clickhouse-client -mn --config-file config.xml -f "CSV" | sed 's/"//g' >"../out/attributes.adoc"
cat rs_days.sql | clickhouse-client -mn --config-file config.xml -f "CSV" | sed 's/"//g' >"../out/rs_days.adoc"
asciidoctor -b docbook -d book -a doctype=book ../out/report.adoc -D ../out
asciidoctor -b html5 -d book -a data-uri! ../out/report.adoc -D ../out
/home/asciidoctor-fopub/fopub ../out/report.xml
asciidoctor -b docbook -d book -a doctype=article ../out/readme.adoc -D ../out
asciidoctor -b html5 -d book -a data-uri! ../out/readme.adoc -D ../out
/home/asciidoctor-fopub/fopub ../out/readme.xml
echo converted


