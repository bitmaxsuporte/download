@echo off
:: Definir intervalo de horários para o primeiro backup (08:01 a 09:50)
set /a MIN_HOUR_1=8
set /a MAX_HOUR_1=10
set /a RANDOM_HOUR_1=%MIN_HOUR_1% + (%RANDOM% %% (%MAX_HOUR_1% - %MIN_HOUR_1%))

set /a MIN_MINUTE_1=1
set /a MAX_MINUTE_1=50
set /a RANDOM_MINUTE_1=%MIN_MINUTE_1% + (%RANDOM% %% (%MAX_MINUTE_1% - %MIN_MINUTE_1% + 1))

:: Definir intervalo de horários para o segundo backup (15:01 a 17:50)
set /a MIN_HOUR_2=15
set /a MAX_HOUR_2=18
set /a RANDOM_HOUR_2=%MIN_HOUR_2% + (%RANDOM% %% (%MAX_HOUR_2% - %MIN_HOUR_2%))

set /a MIN_MINUTE_2=1
set /a MAX_MINUTE_2=50
set /a RANDOM_MINUTE_2=%MIN_MINUTE_2% + (%RANDOM% %% (%MAX_MINUTE_2% - %MIN_MINUTE_2% + 1))

:: Garantir dois dígitos nos minutos
if %RANDOM_MINUTE_1% LSS 10 set RANDOM_MINUTE_1=0%RANDOM_MINUTE_1%
if %RANDOM_MINUTE_2% LSS 10 set RANDOM_MINUTE_2=0%RANDOM_MINUTE_2%

:: Garantir dois dígitos nas horas
if %RANDOM_HOUR_1% LSS 10 set RANDOM_HOUR_1=0%RANDOM_HOUR_1%
if %RANDOM_HOUR_2% LSS 10 set RANDOM_HOUR_2=0%RANDOM_HOUR_2%

:: Definir horários formatados
set RANDOM_TIME_1=%RANDOM_HOUR_1%:%RANDOM_MINUTE_1%
set RANDOM_TIME_2=%RANDOM_HOUR_2%:%RANDOM_MINUTE_2%

:: Exibir horários sorteados
echo O primeiro backup sera agendado para %RANDOM_TIME_1%
echo O segundo backup sera agendado para %RANDOM_TIME_2%

:: Excluir tarefas agendadas antigas
schtasks.exe /Delete /TN "Backup_Bitmax_17hrs" /F
schtasks.exe /Delete /TN "Backup_Bitmax_8hrs" /F
schtasks.exe /Delete /TN "Envio_Backup_Bitmax" /F
schtasks.exe /Delete /TN "Envio_Telegram_Bitmax" /F

:: Criar tarefas com horários aleatórios
schtasks.exe /Create /ST %RANDOM_TIME_1% /SC DAILY /TN "Backup_Bitmax_8hrs" /TR "C:\Windows\System32\ExecutaBackup.vbs" /RL HIGHEST /F /RU "NT AUTHORITY\SYSTEM"
schtasks.exe /Create /ST %RANDOM_TIME_2% /SC DAILY /TN "Backup_Bitmax_17hrs" /TR "C:\Windows\System32\ExecutaBackup.vbs" /RL HIGHEST /F /RU "NT AUTHORITY\SYSTEM"

:: Criar tarefa para envio do backup
schtasks.exe /Create /ST 17:05 /SC ONCE /TN "Envio_Backup_Bitmax" /TR "C:\Windows\System32\envio_email.exe" /RL HIGHEST /F /RU "NT AUTHORITY\SYSTEM"

:: Configuração do caminho do WinRAR
set path="C:\Program Files\WinRAR\";%path%
move C:\Bitmax\Suporte\Backup\Rar.exe C:\Windows\System32

:: Executar manualmente o backup das 17h se necessário
C:\Windows\System32\schtasks.exe /run /tn "Backup_Bitmax_17hrs"

:: Abrir a pasta de backup
explorer.exe /e, /n,C:\Bitmax\BitmaxEmpresarial\Backup

:: Mover atalhos para o desktop
set d=%USERPROFILE%\Desktop
move C:\Bitmax\Suporte\Backup\FazerBackup.lnk %d%
move C:\Bitmax\Suporte\Backup\PegarBackup.lnk %d%

:: Substituir arquivos no System32
del C:\Windows\System32\ExecutaBackup.vbs
del C:\Windows\System32\RotinaBackup.bat
del C:\Windows\System32\envio_email.exe

move C:\Bitmax\Suporte\Backup\ExecutaBackup.vbs C:\Windows\System32
move C:\Bitmax\Suporte\Backup\RotinaBackup.bat C:\Windows\System32
move C:\Bitmax\Suporte\Backup\envio_email.exe C:\Windows\System32
move C:\Bitmax\Suporte\Backup\envio_telegram.exe C:\Windows\System32

:: Limpar arquivos temporários
cd /d "%~dp0"
del "Config.exe"
