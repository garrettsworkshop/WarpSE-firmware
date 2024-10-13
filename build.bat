@echo off
set origfolder=%cd%

FOR /D /r %%G in ("XC95144XL\*") DO (
	cd %%G
	if not exist "build" mkdir build
	cd build
	C:\Xilinx\14.7\ISE_DS\ise\bin\nt\xst -ifn ../WarpSE.xst
	rem C:\Xilinx\14.7\ISE_DS\ise\bin\nt\ngdbuild -uc $../../../WarpSE.ucf bin/WarpSE.ngc -p XC95144XL
	rem C:\Xilinx\14.7\ISE_DS\ise\bin\nt\cpldfit -p XC95144XL -ofmt verilog -optimize speed WarpSE
	rem C:\Xilinx\14.7\ISE_DS\ise\bin\nt\hprep6 -s IEEE1149 -n WarpSE -i WarpSE
)
cd /d %origfolder%
