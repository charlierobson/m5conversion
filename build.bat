@echo off
setlocal

del /q *.bin 2>nul
brass -s colecobios.asm -l colecobios.html

call :build %1
goto :eof


NOTHING TO SEE HERE


:build
set target=%1

if not exist %target% (
	echo target %target% does not exist
	exit /b 0
)

pushd %target%

del /q *.bin 2>nul
del /q *.zx0 2>nul

copy /y ..\_bins\%target%.bin .

brass -s %target%.patch.asm

patcher %target%.bin %target%.patch.bin %target%.patched.bin
if errorlevel 1 exit /b

zx0 -f -q %target%.patched.bin
if errorlevel 1 exit /b

brass -s %target%.asm  %target%-m5.rom -l %target%.html

call install.bat

copy /y %target%-m5.rom ..\..\mamebuild\roms\m5_cart\cheg\m5cheg.bin >nul
if errorlevel 1 exit /b

del /q *.bin 2>nul
del /q *.zx0 2>nul

popd
goto :eof
