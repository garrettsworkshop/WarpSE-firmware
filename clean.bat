@echo off
set origfolder=%cd%


FOR /D /r %%G in ("XC95144XL\*") DO (
	cd /d %%G
	del /f /s /q build
	rmdir /s /q build
)

cd /d %origfolder%
