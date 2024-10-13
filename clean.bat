@echo off
set origfolder=%cd%

FOR /D /r %%G in ("XC95144XL\*") DO (
	cd %%G
	del /f /s /q build
)
cd /d %origfolder%
