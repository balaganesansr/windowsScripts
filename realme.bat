@echo off
echo CHANGING THE TCPIP PORT TO 5555
adb tcpip 5555
echo CONECTING........
adb connect 192.168.0.3


pause
