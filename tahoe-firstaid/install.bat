@echo off
echo This will install the new (0.10.1) dependencies List for the Installer, 
echo it may not work after installation already failed
echo press the anykey button
pause
If Exist ..\Tahoe.home. goto usage

echo please copy the WinLAFS-FirstAid directory tahoe-FirstAid
echo in the home directory of Tahoe-Lafs 0.10.0
echo first aid installation failed
echo press the anykey button
pause
goto exit

:usage
echo we are in the right directory
echo i copy now the new dependencies list on the right place
pause 
echo on
copy _auto_deps.py ..\src\allmydata\
echo press the anykey button
pause 
:exit
