@echo off
if "%~1"=="" (set file_name="Shop.exe") else (set file_name=%1)
del %file_name%_bak.exe > nul
ren %file_name% %file_name%_bak.exe > nul
ren Shop_tmp.exe %file_name% > nul
start "" "%file_name%"