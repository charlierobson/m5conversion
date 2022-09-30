pushd ..\mamebuild
mame coleco -debug -debugscript ..\m5conversion\dbscript.txt %1%
popd
exit /b
