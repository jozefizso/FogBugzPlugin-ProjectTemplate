@echo off

set _name=FogBugzPluginProject
set _target=out\%_name%.zip

set _7z=.build\7za.exe

echo Building project package

if exist "%_target%" (
    echo   Deleting existing package %_target%
    del /s /q "%_target%" >nul
)

echo   Zipping package
%_7z% a -tzip "%_target%" ".\src\%_name%\*" >nul

echo "src\%_name%" -^> %_target%

copy /y "%_target%" "%USERPROFILE%\Documents\Visual Studio 2017\Templates\ProjectTemplates\Visual C#" >nul
echo %_target% -^> "%USERPROFILE%\Documents\Visual Studio 2017\Templates\ProjectTemplates\Visual C#\%_name%.zip"

echo Done.
