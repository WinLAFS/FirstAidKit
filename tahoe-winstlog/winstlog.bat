@echo off
echo This will install Tahoe-LAFS 1.10.0b
echo it may not work after installation already failed
echo press the anykey button
pause
rem test home-directory location
If Exist ..\Tahoe.home. goto usage

echo please copy the tahoe-winstlog directory 
echo in the home directory of Tahoe-Lafs 1.10.0b
echo installation failed
echo press the anykey button
pause
goto exit

:usage
echo we are in the right directory
echo i start now the installscript of 
echo Tahoe-LAFS 1.10.0b
echo will last 3-5 Min
echo press the anykey button
pause 
rem goto the home-directory
cd..
python setup.py build | .\tahoe-winstlog\wtee -a .\tahoe-winstlog\tahoe-install.log
echo press the anykey button
pause 
echo i make a short test of the tahoe binary
pause
bin\tahoe --version | .\tahoe-winstlog\wtee -a .\tahoe-winstlog\tahoe-install.log
pause
echo i ask testgrid. are you online ? and start extendet test 15-20 min.
ping publictestgrid.e271.net | find "TTL" || goto gridoffline
python setup.py trial | .\tahoe-winstlog\wtee -a .\tahoe-winstlog\tahoe-install.log
echo i open now the logfile , save it if you read a fail
notepad .\tahoe-winstlog\tahoe-install.log
goto exit
:gridoffline
echo sorry public test grid of tahoe-lafs seams not reachable
echo didn't execute extented test
echo  i open a browser then you can see its true
pause
start " " http://stats.pingdom.com/cvvac5t8l4fv/1300061
:exit
