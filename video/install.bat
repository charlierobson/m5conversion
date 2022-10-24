call :renrom video "Video Hustler"


goto :eof
:renrom
set m5m=..\..\m5multi\cart-binaries\sirmorris
set "src=%~1"
set "dst=%~2"
del /q "%m5m%\%dst%.rom"
copy /y %src%-m5.rom "%m5m%\%dst%.rom"
goto :eof
