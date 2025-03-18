@echo off
setlocal enabledelayedexpansion

REM configure and build each downloaded sample
REM Set the base directory to the current directory
set base_dir=..

REM Define directories to exclude
set excluded_dirs=build_all downloaded_resources nvpro_core bin_x64 vk_video_samples

REM Store the current directory to return later
set current_dir=%cd%

REM Iterate over subdirectories
for /D %%d in ("%base_dir%\*") do (
    REM Get directory name without path
    set "dir_name=%%~nxd"
    REM Check if directory is in the excluded list
    call :CheckExcluded "!dir_name!"
    if "!excluded!"=="false" (
        echo Processing Directory: !dir_name!
        
        REM Change into the directory
        pushd "%base_dir%\!dir_name!" || (
            echo Failed to enter %base_dir%\!dir_name!
            exit /b 1
        )

        REM configure into build subdir
        cmake -S . -B build
        
        REM compile
        cmake --build build --config Release
        
        REM Move back to the original directory
		popd
        
    ) else (
        echo Skipping Directory: !dir_name!
    )
)

exit /b 0

:CheckExcluded
set excluded=false
for %%i in (%excluded_dirs%) do (
    if /I "%~1"=="%%i" set excluded=true
)
exit /b
