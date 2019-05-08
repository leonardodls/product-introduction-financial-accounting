@echo off
set ENVIRONMENT=%1
if "%ENVIRONMENT%"=="dev" (
	call npm run dev-build
    start chrome http://admin-staging1.comprodls.com./cosmatt/ingestion
) else if "%ENVIRONMENT%"=="stg" (
	call npm run stag-build
) else if "%ENVIRONMENT%"=="prod" (
	call npm run prod-build
) else (
	echo "invalid environment"
	exit 0
)