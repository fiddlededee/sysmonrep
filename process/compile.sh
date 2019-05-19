#!/bin/bash
cd "$(dirname "$0")"
mkdir -p ../out
rm ../out/*
cp *.adoc ../out
cat rs_system_list_insert.sql | clickhouse-client -mn --config-file config.xml -f "CSVWithNames"    
cat rs_today.sql | sed 's/today() and today()/today() and today()/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"../out/rs_today.csv"   
cat rs_today.sql | sed 's/today() and today()/today()-1 and today()-1/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"../out/rs_yesterday.csv"   
cat rs_today.sql | sed 's/today() and today()/toMonday(today()) and today()/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"../out/rs_week.csv"   
cat rs_today.sql | sed 's/today() and today()/toMonday(today()-7) and toMonday(today()-7) + 6/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"../out/rs_prevweek.csv"   
cat rs_today.sql | sed 's/today() and today()/toMonday(today()-7) and toMonday(today()-7) + 6/g' | clickhouse-client -mn --config-file config.xml -f "CSVWithNames" >"../out/rs_prevweek.csv"   
cat rs_attributes.sql | clickhouse-client -mn --config-file config.xml -f "CSV" | sed 's/"//g' >"../out/attributes.adoc"
cat rs_days.sql | clickhouse-client -mn --config-file config.xml -f "CSV" | sed 's/"//g' >"../out/rs_days.adoc"
#daily
cat rs_module_list.sql | clickhouse-client -mn --config-file config.xml -f "CSV" >"../out/rs_module_list.csv"   
cat rs_two_days.sql | clickhouse-client -mn --config-file config.xml -f "CSV" >"../out/rs_two_days.csv"
cat sql3run | sqlite3 
cat ../out/rsl_hourly_adoc.csv | sed 's/""/tyuuyt/g' | sed 's/"//g' | sed 's/tyuuyt/"/g' >../out/rsl_hourly.adoc
awk -F\, '{print > "../out/"$1".csv"}' ../out/rsl_hourly.csv 
IFS=$'\n'
for var in $(cat ../out/rsl_ls_id_only.csv)
do
	echo "Время, Заходов" >../out/c$var.csv
	csvcut -c 2,3 ../out/$var.csv >>../out/c$var.csv
	echo "fileName='../out/c$var.csv'"
	gnuplot -e "fileName='../out/c$var'" hourly.plot
done
#compile html and pdf
asciidoctor -b docbook -d book -a doctype=book ../out/report.adoc -D ../out
asciidoctor -b html5 -d book -a data-uri! ../out/report.adoc -D ../out
/home/asciidoctor-fopub/fopub -t ../docbook-xsl ../out/report.xml
echo converted
