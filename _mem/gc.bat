pushd ..\..\mamebuild
mame coleco -debug -debugscript ..\m5conversion\xmem\dbscript.txt m5port%1%
popd
exit /b
