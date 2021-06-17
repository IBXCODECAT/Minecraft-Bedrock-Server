@echo off

title Automated Server Backups
prompt task: 
echo note this file must be ran as admin

:file-operation

cd %~dp0

if exist backups\ (
  echo backups directory found
) else (
  mkdir backups
)

echo entering backups directory...
cd backups

mkdir %date:~10%%date:~4,2%%date:~7,2%%time:~0,2%%time:~3,2%

robocopy %~dp0src %~dp0backups/%date:~10%%date:~4,2%%date:~7,2%%time:~0,2%%time:~3,2% /COPYALL /E /IS /IT

timeout /t 86400 /nobreak

goto file-operation