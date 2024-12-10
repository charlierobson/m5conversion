rem @echo off
setlocal

del /q *.bin 2>nul
brass -s colecobios.asm -l colecobios.html
copy /y colecobios.bin ..\m5multi\_roms_\bios\

call build.bat antaradv
call build.bat bdash
call build.bat btime
call build.bat carnival
call build.bat centiped
call build.bat dkong
call build.bat dragonfire
call build.bat flipslip
call build.bat frogger
call build.bat gorf
call build.bat hero
call build.bat keystone
call build.bat ladybug
call build.bat montezum
call build.bat moonsweep
call build.bat oilswell
call build.bat pacman
call build.bat qbert
call build.bat qbertqube
call build.bat spectron
call build.bat starwars
call build.bat tutankham
call build.bat video
call build.bat zenji
