@echo off
cd src

set /A prevConnection=1

:check-connection

echo checking internet connection
ping www.google.nl -n 1 -w 1000

if errorlevel 1 (
    set prevConnection=0
    taskkill /F /im bedrock_server.exe
    echo no connection. task bedrock_server.exe has been killed.
) else (
    if %prevConnection%==0 (
        set prevConnection=1
        echo restarting bedrock_server.exe
        start bedrock_server.exe
    ) else (
        echo connection stable.
    )
)

timeout /t 5 /nobreak
goto check-connection