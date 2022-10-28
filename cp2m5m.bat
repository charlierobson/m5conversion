rem used by install scripts

setlocal
set m5m=..\..\m5multi\cart-binaries\sirmorris
set "src=%~1"
set "dst=%~2"
del /q "%m5m%\%dst%.rom" 2>nul
copy /y "%src%-m5.rom" "%m5m%\%dst%.rom"
