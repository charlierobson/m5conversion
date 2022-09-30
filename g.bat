pushd ..\mamebuild
taskkill /IM mame.exe 
start mame m5p -debug -uimodekey HOME -debugscript ..\m5conversion\dbscript.txt cheg
popd
exit /b

