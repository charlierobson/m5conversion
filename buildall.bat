rem @echo off
setlocal

del /q *.bin 2>nul
brass -s colecobios.asm -l colecobios.html

call build.bat antaradv
call build.bat bdash
call build.bat btime
call build.bat carnival
call build.bat centiped
call build.bat dkong
call build.bat frogger
call build.bat gorf
call build.bat montezum
call build.bat qbert
call build.bat starwars
call build.bat video
call build.bat zenji
