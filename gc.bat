pushd ..\mamebuild
start mame coleco -debug -nomaximize -uimodekey HOME -debugscript ..\m5conversion\dbscript.txt %1%
popd
exit /b
