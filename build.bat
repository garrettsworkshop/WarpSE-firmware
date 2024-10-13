x@echo off
set origfolder=%cd%


FOR /D /r %%G in ("XC95144XL\*") DO (
	cd /d %%G
	if exist build del /f /s /q build
	if exist build rmdir /s /q build
	mkdir build
	cd /d build
	C:\Xilinx\14.7\ISE_DS\ise\bin\nt\xst -ifn ../../../WarpSE.xst
	C:\Xilinx\14.7\ISE_DS\ise\bin\nt\ngdbuild -uc ../../../WarpSE.ucf WarpSE.ngc -p XC95144XL-10-TQ100
	C:\Xilinx\14.7\ISE_DS\ise\bin\nt\cpldfit -p XC95144XL-10-TQ100 -ofmt verilog -optimize speed WarpSE
	C:\Xilinx\14.7\ISE_DS\ise\bin\nt\hprep6 -s IEEE1149 -n WarpSE -i WarpSE
	C:\Xilinx\14.7\ISE_DS\ise\bin\nt\impact -batch ../../../WarpSE-SVF.impact
	copy WarpSE.svf ..\
	copy WarpSE.jed ..\
	cd /d %origfolder%
)

cd /d %origfolder%
