@echo off
rem Keep the server alive after the Jenkins build finishes
set JENKINS_NODE_COOKIE=dontKillMe
set BUILD_ID=dontKillMe

rem Stop any previous server on port 8081
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :8081 ^| findstr LISTENING') do taskkill /F /PID %%a >nul 2>&1

start /B cmd /c "npx http-server src -p 8081 -s"
echo Deployed to http://localhost:8081
