set target=%1

rem tracereg,tracemode,remap67,remapIn,remapOut,remapAll
set m5opts="remapAll"

copy /y %target%\%target%-m5.rom ..\mamebuild\roms\m5_cart\cheg\m5cheg.bin

pushd ..\mamebuild
taskkill /IM mame.exe 
start mame m5p -debug -nomaximize -uimodekey HOME -m5c %m5opts% -debugscript ..\m5conversion\dbscript.txt cheg
popd
exit /b
