@echo off
setlocal

del /q *.bin 2>nul
del /q *.zx0 2>nul
brass -s colecobios.asm -l colecobios.html

zx0 -f colecobios.bin
if errorlevel 1 exit /b

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

copy /y ..\xbins\%target%.bin .

brass -s %target%.patch.asm

patcher %target%.bin %target%.patch.bin %target%.patched.bin
if errorlevel 1 exit /b

zx0 -f %target%.patched.bin
if errorlevel 1 exit /b

brass -s %target%-m5.asm  %target%-m5.rom -l %target%-m5.html

del /q *.bin 2>nul
del /q *.zx0 2>nul

copy /y %target%-m5.rom ..\..\m5multi\cart-binaries\sirmorris\ >nul
if errorlevel 1 exit /b

copy /y %target%-m5.rom ..\..\mamebuild\roms\m5_cart\cheg\m5cheg.bin >nul
if errorlevel 1 exit /b

copy /y %target%-m5.rom ..\..\mamebuild\roms\m5_cart\cheg24\m5cheg24.bin >nul
if errorlevel 1 exit /b

popd
goto:eof
