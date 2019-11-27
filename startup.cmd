@echo Off
set DelayTime=10
set Minimize=TRUE
set KillExplorer=TRUE

if %Minimize%==TRUE (
 if not "%~0"=="%~dp0.\%~nx0" (
      start /min cmd /c,"%~dp0.\%~nx0" %*
      exit
 )
)

timeout %DelayTime%

for %%* in (.) do set appname=%%~nx*
set logfile=%appname%_Data\output_log
SETLOCAL enabledelayedexpansion
for /L %%i in (10,-1,1) do (
		call set /A j=%%i+1
		if exist %logfile%_%%i.txt move /Y %logfile%_%%i.txt %logfile%_!j!.txt
		)
if exist %logfile%.txt move /Y %logfile%.txt %logfile%_1.txt
ENDLOCAL
 
if %KillExplorer%==TRUE ( taskkill /f /IM explorer.exe )

%appname%.exe -logFile %appname%_Data\output_log.txt

if %KillExplorer%==TRUE ( Start explorer.exe )
