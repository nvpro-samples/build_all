@echo off
:: Script to clone all existing samples

:: Clone the v1 and v2 nvpro_core repos
call :CLONEFOLDER nvpro_core .
:: call :CLONEFOLDER nvpro_core2 .

:: For each project listed in project_data.csv, clone it into the samples/ folder
for /F "tokens=1-2 delims=," %%a in (project_data.csv) do (
  call :CLONEFOLDER %%a samples
)

:: force execution to quit at the end of the "main" logic
exit /B %errorlevel%

:: CLONEFOLDER <project name> <directory> clones or pulls the nvpro-sample with
:: the given name to a folder with that name under the given directory.
:CLONEFOLDER
echo --------------------------------------------
if exist %2\%1 goto NOWINDIR
	git clone --recursive -- https://github.com/nvpro-samples/%1.git %2\%1
	goto DONE
:NOWINDIR
	echo %2\%1 already there... pulling
	git -C %2\%1 pull
	git -C %2\%1 submodule update --init --recursive
exit /B 0
:DONE
exit /B 0
