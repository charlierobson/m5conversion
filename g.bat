set target=%1

copy /y %target%\%target%-m5.rom ..\mamebuild\roms\m5_cart\cheg\m5cheg.bin

pushd ..\mamebuild
taskkill /IM mame.exe 
start mame m5p -debug -nomaximize -uimodekey HOME -debugscript ..\m5conversion\dbscript.txt cheg
popd
exit /b
