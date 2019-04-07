@echo off
TITLE Kafka
FOR /F "tokens=1,2 delims==" %%G IN (environment.properties) DO (set %%G=%%H)

set mypath=%cd%

echo %kafka%\bin\windows\

cd %kafka%\bin\windows\

Start "Zookeeper" zookeeper-server-start.bat ../../config/zookeeper.properties
Start "Kafka" kafka-server-start.bat ../../config/server.properties

REM wait for 5 seconds
ping 127.0.0.1 -n 16 > nul

kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic flowing-retail

cd %mypath%	