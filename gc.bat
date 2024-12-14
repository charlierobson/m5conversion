rem tracereg,tracemode,remap67,remapIn,remapOut,remapAll,logVDP
set m5opts="tracereg"

pushd ..\mamebuild
rem start mame coleco -debug -nomaximize -uimodekey HOME -debugscript ..\m5conversion\dbscript.txt %1
start mame coleco -debug -nomaximize -uimodekey HOME -m5c %m5opts%  %1
popd
exit /b
