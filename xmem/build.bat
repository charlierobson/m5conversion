@echo off

set tgt=centiped

copy ..\xbins\%tgt%.bin

FOR /F "usebackq" %%A IN ('%tgt%.bin') DO set size=%%~zA

brass %tgt%.patch.asm
patcher %tgt%.bin %tgt%.patch.bin %tgt%.patched.bin

if %size% GTR 16384 goto build24
if %size% GTR 8192 goto build16

:build8
python split.py %tgt%.patched.bin
del /q m5port8k.zip
7z a m5port8k.zip m5port.1
copy m5port8k.zip ..\..\mamebuild\roms\coleco\
goto :eof

:build16
python split.py %tgt%.patched.bin
del /q m5port16k.zip
7z a m5port16k.zip m5port.1 m5port.2
copy m5port16k.zip ..\..\mamebuild\roms\coleco\
goto :eof

:build24
python split.py %tgt%.patched.bin
del /q m5port24k.zip
7z a m5port24k.zip m5port.1 m5port.2 m5port.3
copy m5port24k.zip ..\..\mamebuild\roms\coleco\
goto :eof
