@echo off
start "arma3" /min /high "arma3server.exe" -port=2302 "-config=Config\cfg\Config.cfg" "-profiles=Config\log" "-cfg=Config\cfg\basic.cfg" -name=Exile "-mod=@Exile;@ExileServer;" -world=empty -nosplash -noSound -noPause -enableHT -malloc=system -autoinit
exit
