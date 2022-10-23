rem @echo off
setlocal

set m5m=..\m5multi\cart-binaries\sirmorris

del /q *.bin 2>nul
del /q *.zx0 2>nul
brass -s colecobios.asm -l colecobios.html
zx0 -f colecobios.bin
if errorlevel 1 exit /b

call :build antaradv
call :renrom antaradv "Antarctic Adventure"

call :build btime
call :renrom btime "Burger Time"

call :build carnival
call :renrom carnival Carnival

call :build centiped
call :renrom centiped Centipede

call :build dkong
call :renrom dkong "Donkey Kong"

call :build frogger
call :renrom frogger Frogger

call :build gorf
call :renrom gorf Gorf

call :build qbert
call :renrom qbert Q##Bert

call :build video
call :renrom video "Video Hustler"

goto :eof


NOTHING TO SEE HERE



:renrom
set "src=%~1"
set "dst=%~2"

del /q "%m5m%\%dst%.rom"
ren  "%m5m%\%src%-m5.rom" "%dst%.rom"
goto :eof



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

popd
goto:eof
