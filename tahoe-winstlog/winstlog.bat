@echo off
cls
color 0F
echo This will install Tahoe-LAFS 1.10.0b
echo it may not work after installation already failed
echo press the anykey button
pause
color 07
rem test home-directory location
If Exist ..\Tahoe.home. goto usage
cls
color 0E
echo please copy the tahoe-winstlog directory 
echo in the home directory of Tahoe-Lafs 1.10.0b
echo installation failed
echo press the anykey button
pause
color 07
goto exit

:usage
cls
color F0
echo we are in the right directory
echo i start now the installscript of 
echo Tahoe-LAFS 1.10.0b
echo will last 3-5 Min
echo press the anykey button
pause 
color 07
rem goto the home-directory
cd..
python setup.py build | .\tahoe-winstlog\wtee -a .\tahoe-winstlog\tahoe-install.log
echo press the anykey button
pause 
cls
color 0E
echo i make a short test of the tahoe binary
pause
color 07
bin\tahoe --version | .\tahoe-winstlog\wtee -a .\tahoe-winstlog\tahoe-install.log
pause
cls
color 0E
echo i ask testgrid. are you online ? and start extendet test 15-20 min.
ping publictestgrid.e271.net | find "TTL" || goto gridoffline
pause
color 07
python setup.py trial | .\tahoe-winstlog\wtee -a .\tahoe-winstlog\tahoe-install.log

goto exit
:gridoffline
cls
color 0E
echo sorry public test grid of tahoe-lafs seams not reachable
echo didn't execute extented test
echo  i open a browser then you can see its true
pause
color 07
start " " http://stats.pingdom.com/cvvac5t8l4fv/1300061
echo wait
pause
:exit
