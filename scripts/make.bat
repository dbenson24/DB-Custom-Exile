SET ARMA="F:\SteamLibrary\SteamApps\common\Arma 3\
SET PBO="C:\Program Files (x86)\Bohemia Interactive\Tools\BinPBO Personal Edition\BinPBO.exe"
SET ProjectHome=%~dp0..\
SET Server=%~dp0..\@ExileServer\addons\
echo %ProjectHome%

call %PBO% %Server%exile_server
call %PBO% %Server%exile_server_config
call %PBO% %Server%a3_dms

call %PBO% %ProjectHome%\mpmissions\Exile.Altis

copy %Server%exile_server.pbo %ARMA%@ExileServer\addons\exile_server.pbo"
copy %Server%exile_server_config.pbo %ARMA%@ExileServer\addons\exile_server_config.pbo"
copy %Server%a3_dms.pbo %ARMA%@ExileServer\addons\a3_dms.pbo"

copy %ProjectHome%\mpmissions\Exile.Altis.pbo %ARMA%\mpmissions\Exile.Altis.pbo"
