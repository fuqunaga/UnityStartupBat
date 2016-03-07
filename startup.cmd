@echo Off
set APPLITAION_PATH=
set DelayTime=10

timeout %DelayTime%

for %%* in (.) do set folder=%%~nx*
set logfile=%folder%_Data\output_log.txt
SETLOCAL enabledelayedexpansion
for /L %%i in (10,-1,1) do (
		call set /A j=%%i+1
		if exist %logfile%_%%i move /Y %logfile%_%%i %logfile%_!j!
		)
if exist %logfile% move /Y %logfile% %logfile%_1
ENDLOCAL

taskkill /f /IM explorer.exe
%APPLITAION_PATH%
Start explorer.exe
