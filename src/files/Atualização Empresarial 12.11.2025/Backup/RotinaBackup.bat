@echo off
setlocal enabledelayedexpansion
for /f %%i in ('powershell ^(get-date^).DayOfWeek') do set dow=%%i

if %dow% == Sunday goto domingo
if %dow% == Monday goto segunda
if %dow% == Tuesday goto terca
if %dow% == Wednesday goto quarta
if %dow% == Thursday goto quinta
if %dow% == Friday goto sexta
if %dow% == Saturday goto sabado

set caminho=C:\Temp
set email=email@exemplo.com
set empresa=Empresa Exemplo

exit


:domingo

del /f /s /q "C:\Bitmax\BitmaxEmpresarial\Backup\Temp"
del /f /s /q "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp"
del /f /s /q "C:\Temp"

mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFCe"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFe"

IF not EXIST "C:\Temp" mkdir "C:\Temp"
IF not EXIST "D:\Backup Bitmax" mkdir "D:\Backup Bitmax"


COPY C:\Bitmax\BitmaxEmpresarial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarial\Backup\Temp

robocopy "C:\Bitmax\BitmaxEmpresarial\Bin\Arquivos NFCe\NFCE" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFCe" /E /COPYALL /Z /R:3 /W:10 /XO /NP

robocopy "C:\Bitmax\BitmaxEmpresarial\Bin\Arquivos NFe\NFE" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFe" /E /COPYALL /Z /R:3 /W:10 /XO /NP

cd c:\arquiv~1\winrar

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO Banco#########################
rar a "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Domingo.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\BITMAX.FDB"

COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Domingo.rar C:\Bitmax\BitmaxEmpresarial\Backup
COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Domingo.rar C:\Temp

if %errorlevel% equ 0 (
    for %%A in ("C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Domingo.rar") do (
        set filesize=%%~zA
        if !filesize! gtr 47185920 (
            del "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Domingo.rar"
            del "C:\Temp\Backup_Bitmax_Domingo.rar"
            rar a -v45m "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Domingo.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\BITMAX.FDB"
            move /y "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\*.rar" "C:\Temp\"
        )
    )
)

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO XML#########################

rar a "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Domingo.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"

COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Domingo.rar C:\Bitmax\BitmaxEmpresarial\Backup
COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Domingo.rar C:\Temp

if %errorlevel% equ 0 (
    for %%A in ("C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Domingo.rar") do (
        set filesize=%%~zA
        if !filesize! gtr 47185920 (
            del "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Domingo.rar"
            del /f /s /q "C:\Temp\XML_Bitmax_Domingo.rar"
            rar a -v45m "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Domingo.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"
            move /y "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\*.rar" "C:\Temp\"
        )
    )
)


rd /s /q "C:\Bitmax\BitmaxEmpresarial\Backup\Temp" & echo Arquivo Foi Criada. )

@echo off
xcopy "C:\Bitmax\BitmaxEmpresarial\Backup\*" "D:\Backup Bitmax" /D /E /C /I /Y

timeout /t 20

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFCe"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFe"
)


if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    robocopy "C:\Bitmax\BitmaxEmpresarialGerencial\Bin\Arquivos NFCe\NFCE" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFCe" /E /COPYALL /Z /R:3 /W:10 /XO /NP
    robocopy "C:\Bitmax\BitmaxEmpresarialGerencial\Bin\Arquivos NFe\NFE" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFe" /E /COPYALL /Z /R:3 /W:10 /XO /NP
)

cd c:\arquiv~1\winrar

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO Banco#########################
if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rar a "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Domingo.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\BITMAX.FDB"
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Domingo.rar C:\Bitmax\BitmaxEmpresarialGerencial\Backup
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Domingo.rar C:\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    if %errorlevel% equ 0 (
        for %%A in ("C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Domingo.rar") do (
            set filesize=%%~zA
            if !filesize! gtr 47185920 (
                del "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Domingo.rar"
                del "C:\Temp\Backup_Gerencial_Domingo.rar"
                rar a -v45m "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Domingo.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\BITMAX.FDB"
                move /y "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\*.rar" "C:\Temp\"
            )
        )
    )
)

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO XML#########################
if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rar a "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Domingo.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Domingo.rar C:\Bitmax\BitmaxEmpresarialGerencial\Backup
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Domingo.rar C:\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    if %errorlevel% equ 0 (
        for %%A in ("C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Domingo.rar") do (
            set filesize=%%~zA
            if !filesize! gtr 47185920 (
                del "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Domingo.rar"
                del /f /s /q "C:\Temp\XML_Gerencial_Domingo.rar"
                rar a -v45m "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Domingo.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
                move /y "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\*.rar" "C:\Temp\"
            )
        )
    )
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rd /s /q "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp" 
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    xcopy "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\*" "D:\Backup Bitmax" /D /E /C /I /Y
)

@echo off
C:\Windows\System32\schtasks.exe /run /tn "Envio_Backup_Bitmax"

C:\Windows\System32\envio_telegram.exe

exit


:segunda

del /f /s /q "C:\Bitmax\BitmaxEmpresarial\Backup\Temp"
del /f /s /q "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp"
del /f /s /q "C:\Temp"

mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFCe"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFe"

IF not EXIST "C:\Temp" mkdir "C:\Temp"
IF not EXIST "D:\Backup Bitmax" mkdir "D:\Backup Bitmax"


COPY C:\Bitmax\BitmaxEmpresarial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarial\Backup\Temp

robocopy "C:\Bitmax\BitmaxEmpresarial\Bin\Arquivos NFCe\NFCE" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFCe" /E /COPYALL /Z /R:3 /W:10 /XO /NP

robocopy "C:\Bitmax\BitmaxEmpresarial\Bin\Arquivos NFe\NFE" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFe" /E /COPYALL /Z /R:3 /W:10 /XO /NP

cd c:\arquiv~1\winrar

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO Banco#########################
rar a "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Segunda.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\BITMAX.FDB"

COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Segunda.rar C:\Bitmax\BitmaxEmpresarial\Backup
COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Segunda.rar C:\Temp

if %errorlevel% equ 0 (
    for %%A in ("C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Segunda.rar") do (
        set filesize=%%~zA
        if !filesize! gtr 47185920 (
            del "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Segunda.rar"
            del "C:\Temp\Backup_Bitmax_Segunda.rar"
            rar a -v45m "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Segunda.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\BITMAX.FDB"
            move /y "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\*.rar" "C:\Temp\"
        )
    )
)

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO XML#########################

rar a "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Segunda.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"

COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Segunda.rar C:\Bitmax\BitmaxEmpresarial\Backup
COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Segunda.rar C:\Temp

if %errorlevel% equ 0 (
    for %%A in ("C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Segunda.rar") do (
        set filesize=%%~zA
        if !filesize! gtr 47185920 (
            del "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Segunda.rar"
            del /f /s /q "C:\Temp\XML_Bitmax_Segunda.rar"
            rar a -v45m "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Segunda.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"
            move /y "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\*.rar" "C:\Temp\"
        )
    )
)


rd /s /q "C:\Bitmax\BitmaxEmpresarial\Backup\Temp" & echo Arquivo Foi Criada. )

@echo off
xcopy "C:\Bitmax\BitmaxEmpresarial\Backup\*" "D:\Backup Bitmax" /D /E /C /I /Y

timeout /t 20

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFCe"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFe"
)


if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    robocopy "C:\Bitmax\BitmaxEmpresarialGerencial\Bin\Arquivos NFCe\NFCE" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFCe" /E /COPYALL /Z /R:3 /W:10 /XO /NP
    robocopy "C:\Bitmax\BitmaxEmpresarialGerencial\Bin\Arquivos NFe\NFE" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFe" /E /COPYALL /Z /R:3 /W:10 /XO /NP
)

cd c:\arquiv~1\winrar

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO Banco#########################
if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rar a "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Segunda.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\BITMAX.FDB"
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Segunda.rar C:\Bitmax\BitmaxEmpresarialGerencial\Backup
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Segunda.rar C:\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    if %errorlevel% equ 0 (
        for %%A in ("C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Segunda.rar") do (
            set filesize=%%~zA
            if !filesize! gtr 47185920 (
                del "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Segunda.rar"
                del "C:\Temp\Backup_Gerencial_Segunda.rar"
                rar a -v45m "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Segunda.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\BITMAX.FDB"
                move /y "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\*.rar" "C:\Temp\"
            )
        )
    )
)

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO XML#########################
if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rar a "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Segunda.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Segunda.rar C:\Bitmax\BitmaxEmpresarialGerencial\Backup
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Segunda.rar C:\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    if %errorlevel% equ 0 (
        for %%A in ("C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Segunda.rar") do (
            set filesize=%%~zA
            if !filesize! gtr 47185920 (
                del "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Segunda.rar"
                del /f /s /q "C:\Temp\XML_Gerencial_Segunda.rar"
                rar a -v45m "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Segunda.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
                move /y "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\*.rar" "C:\Temp\"
            )
        )
    )
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rd /s /q "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp" 
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    xcopy "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\*" "D:\Backup Bitmax" /D /E /C /I /Y
)

@echo off
C:\Windows\System32\schtasks.exe /run /tn "Envio_Backup_Bitmax"

C:\Windows\System32\envio_telegram.exe

exit

:terca


del /f /s /q "C:\Bitmax\BitmaxEmpresarial\Backup\Temp"
del /f /s /q "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp"
del /f /s /q "C:\Temp"

mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFCe"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFe"

IF not EXIST "C:\Temp" mkdir "C:\Temp"
IF not EXIST "D:\Backup Bitmax" mkdir "D:\Backup Bitmax"


COPY C:\Bitmax\BitmaxEmpresarial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarial\Backup\Temp

robocopy "C:\Bitmax\BitmaxEmpresarial\Bin\Arquivos NFCe\NFCE" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFCe" /E /COPYALL /Z /R:3 /W:10 /XO /NP

robocopy "C:\Bitmax\BitmaxEmpresarial\Bin\Arquivos NFe\NFE" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFe" /E /COPYALL /Z /R:3 /W:10 /XO /NP

cd c:\arquiv~1\winrar

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO Banco#########################
rar a "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Terca.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\BITMAX.FDB"

COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Terca.rar C:\Bitmax\BitmaxEmpresarial\Backup
COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Terca.rar C:\Temp

if %errorlevel% equ 0 (
    for %%A in ("C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Terca.rar") do (
        set filesize=%%~zA
        if !filesize! gtr 47185920 (
            del "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Terca.rar"
            del "C:\Temp\Backup_Bitmax_Terca.rar"
            rar a -v45m "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Terca.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\BITMAX.FDB"
            move /y "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\*.rar" "C:\Temp\"
        )
    )
)

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO XML#########################

rar a "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Terca.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"

COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Terca.rar C:\Bitmax\BitmaxEmpresarial\Backup
COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Terca.rar C:\Temp

if %errorlevel% equ 0 (
    for %%A in ("C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Terca.rar") do (
        set filesize=%%~zA
        if !filesize! gtr 47185920 (
            del "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Terca.rar"
            del /f /s /q "C:\Temp\XML_Bitmax_Terca.rar"
            rar a -v45m "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Terca.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"
            move /y "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\*.rar" "C:\Temp\"
        )
    )
)


rd /s /q "C:\Bitmax\BitmaxEmpresarial\Backup\Temp" & echo Arquivo Foi Criada. )

@echo off
xcopy "C:\Bitmax\BitmaxEmpresarial\Backup\*" "D:\Backup Bitmax" /D /E /C /I /Y

timeout /t 20

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFCe"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFe"
)


if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    robocopy "C:\Bitmax\BitmaxEmpresarialGerencial\Bin\Arquivos NFCe\NFCE" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFCe" /E /COPYALL /Z /R:3 /W:10 /XO /NP
    robocopy "C:\Bitmax\BitmaxEmpresarialGerencial\Bin\Arquivos NFe\NFE" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFe" /E /COPYALL /Z /R:3 /W:10 /XO /NP
)

cd c:\arquiv~1\winrar

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO Banco#########################
if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rar a "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Terca.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\BITMAX.FDB"
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Terca.rar C:\Bitmax\BitmaxEmpresarialGerencial\Backup
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Terca.rar C:\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    if %errorlevel% equ 0 (
        for %%A in ("C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Terca.rar") do (
            set filesize=%%~zA
            if !filesize! gtr 47185920 (
                del "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Terca.rar"
                del "C:\Temp\Backup_Gerencial_Terca.rar"
                rar a -v45m "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Terca.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\BITMAX.FDB"
                move /y "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\*.rar" "C:\Temp\"
            )
        )
    )
)

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO XML#########################
if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rar a "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Terca.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Terca.rar C:\Bitmax\BitmaxEmpresarialGerencial\Backup
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Terca.rar C:\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    if %errorlevel% equ 0 (
        for %%A in ("C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Terca.rar") do (
            set filesize=%%~zA
            if !filesize! gtr 47185920 (
                del "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Terca.rar"
                del /f /s /q "C:\Temp\XML_Gerencial_Terca.rar"
                rar a -v45m "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Terca.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
                move /y "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\*.rar" "C:\Temp\"
            )
        )
    )
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rd /s /q "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp" 
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    xcopy "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\*" "D:\Backup Bitmax" /D /E /C /I /Y
)

@echo off
C:\Windows\System32\schtasks.exe /run /tn "Envio_Backup_Bitmax"

C:\Windows\System32\envio_telegram.exe

exit

:quarta


del /f /s /q "C:\Bitmax\BitmaxEmpresarial\Backup\Temp"
del /f /s /q "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp"
del /f /s /q "C:\Temp"

mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFCe"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFe"

IF not EXIST "C:\Temp" mkdir "C:\Temp"
IF not EXIST "D:\Backup Bitmax" mkdir "D:\Backup Bitmax"


COPY C:\Bitmax\BitmaxEmpresarial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarial\Backup\Temp

robocopy "C:\Bitmax\BitmaxEmpresarial\Bin\Arquivos NFCe\NFCE" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFCe" /E /COPYALL /Z /R:3 /W:10 /XO /NP

robocopy "C:\Bitmax\BitmaxEmpresarial\Bin\Arquivos NFe\NFE" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFe" /E /COPYALL /Z /R:3 /W:10 /XO /NP

cd c:\arquiv~1\winrar

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO Banco#########################
rar a "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Quarta.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\BITMAX.FDB"

COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Quarta.rar C:\Bitmax\BitmaxEmpresarial\Backup
COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Quarta.rar C:\Temp

if %errorlevel% equ 0 (
    for %%A in ("C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Quarta.rar") do (
        set filesize=%%~zA
        if !filesize! gtr 47185920 (
            del "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Quarta.rar"
            del "C:\Temp\Backup_Bitmax_Quarta.rar"
            rar a -v45m "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Quarta.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\BITMAX.FDB"
            move /y "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\*.rar" "C:\Temp\"
        )
    )
)

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO XML#########################

rar a "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Quarta.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"

COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Quarta.rar C:\Bitmax\BitmaxEmpresarial\Backup
COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Quarta.rar C:\Temp

if %errorlevel% equ 0 (
    for %%A in ("C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Quarta.rar") do (
        set filesize=%%~zA
        if !filesize! gtr 47185920 (
            del "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Quarta.rar"
            del /f /s /q "C:\Temp\XML_Bitmax_Quarta.rar"
            rar a -v45m "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Quarta.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"
            move /y "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\*.rar" "C:\Temp\"
        )
    )
)


rd /s /q "C:\Bitmax\BitmaxEmpresarial\Backup\Temp" & echo Arquivo Foi Criada. )

@echo off
xcopy "C:\Bitmax\BitmaxEmpresarial\Backup\*" "D:\Backup Bitmax" /D /E /C /I /Y

timeout /t 20

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFCe"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFe"
)


if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    robocopy "C:\Bitmax\BitmaxEmpresarialGerencial\Bin\Arquivos NFCe\NFCE" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFCe" /E /COPYALL /Z /R:3 /W:10 /XO /NP
    robocopy "C:\Bitmax\BitmaxEmpresarialGerencial\Bin\Arquivos NFe\NFE" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFe" /E /COPYALL /Z /R:3 /W:10 /XO /NP
)

cd c:\arquiv~1\winrar

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO Banco#########################
if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rar a "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Quarta.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\BITMAX.FDB"
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Quarta.rar C:\Bitmax\BitmaxEmpresarialGerencial\Backup
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Quarta.rar C:\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    if %errorlevel% equ 0 (
        for %%A in ("C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Quarta.rar") do (
            set filesize=%%~zA
            if !filesize! gtr 47185920 (
                del "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Quarta.rar"
                del "C:\Temp\Backup_Gerencial_Quarta.rar"
                rar a -v45m "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Quarta.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\BITMAX.FDB"
                move /y "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\*.rar" "C:\Temp\"
            )
        )
    )
)

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO XML#########################
if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rar a "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Quarta.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Quarta.rar C:\Bitmax\BitmaxEmpresarialGerencial\Backup
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Quarta.rar C:\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    if %errorlevel% equ 0 (
        for %%A in ("C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Quarta.rar") do (
            set filesize=%%~zA
            if !filesize! gtr 47185920 (
                del "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Quarta.rar"
                del /f /s /q "C:\Temp\XML_Gerencial_Quarta.rar"
                rar a -v45m "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Quarta.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
                move /y "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\*.rar" "C:\Temp\"
            )
        )
    )
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rd /s /q "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp" 
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    xcopy "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\*" "D:\Backup Bitmax" /D /E /C /I /Y
)

@echo off
C:\Windows\System32\schtasks.exe /run /tn "Envio_Backup_Bitmax"

C:\Windows\System32\envio_telegram.exe

exit

:quinta


del /f /s /q "C:\Bitmax\BitmaxEmpresarial\Backup\Temp"
del /f /s /q "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp"
del /f /s /q "C:\Temp"

mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFCe"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFe"

IF not EXIST "C:\Temp" mkdir "C:\Temp"
IF not EXIST "D:\Backup Bitmax" mkdir "D:\Backup Bitmax"


COPY C:\Bitmax\BitmaxEmpresarial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarial\Backup\Temp

robocopy "C:\Bitmax\BitmaxEmpresarial\Bin\Arquivos NFCe\NFCE" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFCe" /E /COPYALL /Z /R:3 /W:10 /XO /NP

robocopy "C:\Bitmax\BitmaxEmpresarial\Bin\Arquivos NFe\NFE" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFe" /E /COPYALL /Z /R:3 /W:10 /XO /NP

cd c:\arquiv~1\winrar

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO Banco#########################
rar a "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Quinta.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\BITMAX.FDB"

COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Quinta.rar C:\Bitmax\BitmaxEmpresarial\Backup
COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Quinta.rar C:\Temp

if %errorlevel% equ 0 (
    for %%A in ("C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Quinta.rar") do (
        set filesize=%%~zA
        if !filesize! gtr 47185920 (
            del "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Quinta.rar"
            del "C:\Temp\Backup_Bitmax_Quinta.rar"
            rar a -v45m "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Quinta.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\BITMAX.FDB"
            move /y "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\*.rar" "C:\Temp\"
        )
    )
)

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO XML#########################

rar a "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Quinta.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"

COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Quinta.rar C:\Bitmax\BitmaxEmpresarial\Backup
COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Quinta.rar C:\Temp

if %errorlevel% equ 0 (
    for %%A in ("C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Quinta.rar") do (
        set filesize=%%~zA
        if !filesize! gtr 47185920 (
            del "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Quinta.rar"
            del /f /s /q "C:\Temp\XML_Bitmax_Quinta.rar"
            rar a -v45m "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Quinta.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"
            move /y "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\*.rar" "C:\Temp\"
        )
    )
)


rd /s /q "C:\Bitmax\BitmaxEmpresarial\Backup\Temp" & echo Arquivo Foi Criada. )

@echo off
xcopy "C:\Bitmax\BitmaxEmpresarial\Backup\*" "D:\Backup Bitmax" /D /E /C /I /Y

timeout /t 20

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFCe"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFe"
)


if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    robocopy "C:\Bitmax\BitmaxEmpresarialGerencial\Bin\Arquivos NFCe\NFCE" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFCe" /E /COPYALL /Z /R:3 /W:10 /XO /NP
    robocopy "C:\Bitmax\BitmaxEmpresarialGerencial\Bin\Arquivos NFe\NFE" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFe" /E /COPYALL /Z /R:3 /W:10 /XO /NP
)

cd c:\arquiv~1\winrar

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO Banco#########################
if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rar a "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Quinta.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\BITMAX.FDB"
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Quinta.rar C:\Bitmax\BitmaxEmpresarialGerencial\Backup
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Quinta.rar C:\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    if %errorlevel% equ 0 (
        for %%A in ("C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Quinta.rar") do (
            set filesize=%%~zA
            if !filesize! gtr 47185920 (
                del "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Quinta.rar"
                del "C:\Temp\Backup_Gerencial_Quinta.rar"
                rar a -v45m "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Quinta.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\BITMAX.FDB"
                move /y "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\*.rar" "C:\Temp\"
            )
        )
    )
)

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO XML#########################
if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rar a "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Quinta.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Quinta.rar C:\Bitmax\BitmaxEmpresarialGerencial\Backup
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Quinta.rar C:\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    if %errorlevel% equ 0 (
        for %%A in ("C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Quinta.rar") do (
            set filesize=%%~zA
            if !filesize! gtr 47185920 (
                del "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Quinta.rar"
                del /f /s /q "C:\Temp\XML_Gerencial_Quinta.rar"
                rar a -v45m "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Quinta.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
                move /y "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\*.rar" "C:\Temp\"
            )
        )
    )
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rd /s /q "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp" 
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    xcopy "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\*" "D:\Backup Bitmax" /D /E /C /I /Y
)

@echo off
C:\Windows\System32\schtasks.exe /run /tn "Envio_Backup_Bitmax"

C:\Windows\System32\envio_telegram.exe

exit

:sexta


del /f /s /q "C:\Bitmax\BitmaxEmpresarial\Backup\Temp"
del /f /s /q "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp"
del /f /s /q "C:\Temp"

mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFCe"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFe"

IF not EXIST "C:\Temp" mkdir "C:\Temp"
IF not EXIST "D:\Backup Bitmax" mkdir "D:\Backup Bitmax"


COPY C:\Bitmax\BitmaxEmpresarial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarial\Backup\Temp

robocopy "C:\Bitmax\BitmaxEmpresarial\Bin\Arquivos NFCe\NFCE" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFCe" /E /COPYALL /Z /R:3 /W:10 /XO /NP

robocopy "C:\Bitmax\BitmaxEmpresarial\Bin\Arquivos NFe\NFE" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFe" /E /COPYALL /Z /R:3 /W:10 /XO /NP

cd c:\arquiv~1\winrar

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO Banco#########################
rar a "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Sexta.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\BITMAX.FDB"

COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Sexta.rar C:\Bitmax\BitmaxEmpresarial\Backup
COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Sexta.rar C:\Temp

if %errorlevel% equ 0 (
    for %%A in ("C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Sexta.rar") do (
        set filesize=%%~zA
        if !filesize! gtr 47185920 (
            del "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Sexta.rar"
            del "C:\Temp\Backup_Bitmax_Sexta.rar"
            rar a -v45m "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Sexta.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\BITMAX.FDB"
            move /y "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\*.rar" "C:\Temp\"
        )
    )
)

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO XML#########################

rar a "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Sexta.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"

COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Sexta.rar C:\Bitmax\BitmaxEmpresarial\Backup
COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Sexta.rar C:\Temp

if %errorlevel% equ 0 (
    for %%A in ("C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Sexta.rar") do (
        set filesize=%%~zA
        if !filesize! gtr 47185920 (
            del "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Sexta.rar"
            del /f /s /q "C:\Temp\XML_Bitmax_Sexta.rar"
            rar a -v45m "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Sexta.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"
            move /y "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\*.rar" "C:\Temp\"
        )
    )
)


rd /s /q "C:\Bitmax\BitmaxEmpresarial\Backup\Temp" & echo Arquivo Foi Criada. )

@echo off
xcopy "C:\Bitmax\BitmaxEmpresarial\Backup\*" "D:\Backup Bitmax" /D /E /C /I /Y

timeout /t 20

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFCe"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFe"
)


if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    robocopy "C:\Bitmax\BitmaxEmpresarialGerencial\Bin\Arquivos NFCe\NFCE" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFCe" /E /COPYALL /Z /R:3 /W:10 /XO /NP
    robocopy "C:\Bitmax\BitmaxEmpresarialGerencial\Bin\Arquivos NFe\NFE" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFe" /E /COPYALL /Z /R:3 /W:10 /XO /NP
)

cd c:\arquiv~1\winrar

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO Banco#########################
if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rar a "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Sexta.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\BITMAX.FDB"
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Sexta.rar C:\Bitmax\BitmaxEmpresarialGerencial\Backup
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Sexta.rar C:\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    if %errorlevel% equ 0 (
        for %%A in ("C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Sexta.rar") do (
            set filesize=%%~zA
            if !filesize! gtr 47185920 (
                del "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Sexta.rar"
                del "C:\Temp\Backup_Gerencial_Sexta.rar"
                rar a -v45m "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Sexta.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\BITMAX.FDB"
                move /y "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\*.rar" "C:\Temp\"
            )
        )
    )
)

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO XML#########################
if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rar a "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Sexta.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Sexta.rar C:\Bitmax\BitmaxEmpresarialGerencial\Backup
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Sexta.rar C:\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    if %errorlevel% equ 0 (
        for %%A in ("C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Sexta.rar") do (
            set filesize=%%~zA
            if !filesize! gtr 47185920 (
                del "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Sexta.rar"
                del /f /s /q "C:\Temp\XML_Gerencial_Sexta.rar"
                rar a -v45m "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Sexta.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
                move /y "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\*.rar" "C:\Temp\"
            )
        )
    )
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rd /s /q "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp" 
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    xcopy "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\*" "D:\Backup Bitmax" /D /E /C /I /Y
)

@echo off
C:\Windows\System32\schtasks.exe /run /tn "Envio_Backup_Bitmax"

C:\Windows\System32\envio_telegram.exe

exit

:sabado


del /f /s /q "C:\Bitmax\BitmaxEmpresarial\Backup\Temp"
del /f /s /q "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp"
del /f /s /q "C:\Temp"

mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFCe"
mkdir "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFe"

IF not EXIST "C:\Temp" mkdir "C:\Temp"
IF not EXIST "D:\Backup Bitmax" mkdir "D:\Backup Bitmax"


COPY C:\Bitmax\BitmaxEmpresarial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarial\Backup\Temp

robocopy "C:\Bitmax\BitmaxEmpresarial\Bin\Arquivos NFCe\NFCE" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFCe" /E /COPYALL /Z /R:3 /W:10 /XO /NP

robocopy "C:\Bitmax\BitmaxEmpresarial\Bin\Arquivos NFe\NFE" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML\NFe" /E /COPYALL /Z /R:3 /W:10 /XO /NP

cd c:\arquiv~1\winrar

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO Banco#########################
rar a "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Sabado.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\BITMAX.FDB"

COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Sabado.rar C:\Bitmax\BitmaxEmpresarial\Backup
COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Sabado.rar C:\Temp

if %errorlevel% equ 0 (
    for %%A in ("C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Sabado.rar") do (
        set filesize=%%~zA
        if !filesize! gtr 47185920 (
            del "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Sabado.rar"
            del "C:\Temp\Backup_Bitmax_Sabado.rar"
            rar a -v45m "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\Backup_Bitmax_Sabado.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\BITMAX.FDB"
            move /y "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\*.rar" "C:\Temp\"
        )
    )
)

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO XML#########################

rar a "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Sabado.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"

COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Sabado.rar C:\Bitmax\BitmaxEmpresarial\Backup
COPY C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Sabado.rar C:\Temp

if %errorlevel% equ 0 (
    for %%A in ("C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Sabado.rar") do (
        set filesize=%%~zA
        if !filesize! gtr 47185920 (
            del "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Sabado.rar"
            del /f /s /q "C:\Temp\XML_Bitmax_Sabado.rar"
            rar a -v45m "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML_Bitmax_Sabado.rar" "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\XML"
            move /y "C:\Bitmax\BitmaxEmpresarial\Backup\Temp\*.rar" "C:\Temp\"
        )
    )
)


rd /s /q "C:\Bitmax\BitmaxEmpresarial\Backup\Temp" & echo Arquivo Foi Criada. )

@echo off
xcopy "C:\Bitmax\BitmaxEmpresarial\Backup\*" "D:\Backup Bitmax" /D /E /C /I /Y

timeout /t 20

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFCe"
    mkdir "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFe"
)


if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    robocopy "C:\Bitmax\BitmaxEmpresarialGerencial\Bin\Arquivos NFCe\NFCE" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFCe" /E /COPYALL /Z /R:3 /W:10 /XO /NP
    robocopy "C:\Bitmax\BitmaxEmpresarialGerencial\Bin\Arquivos NFe\NFE" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML\NFe" /E /COPYALL /Z /R:3 /W:10 /XO /NP
)

cd c:\arquiv~1\winrar

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO Banco#########################
if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rar a "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Sabado.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\BITMAX.FDB"
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Sabado.rar C:\Bitmax\BitmaxEmpresarialGerencial\Backup
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Sabado.rar C:\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    if %errorlevel% equ 0 (
        for %%A in ("C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Sabado.rar") do (
            set filesize=%%~zA
            if !filesize! gtr 47185920 (
                del "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Sabado.rar"
                del "C:\Temp\Backup_Gerencial_Sabado.rar"
                rar a -v45m "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\Backup_Gerencial_Sabado.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\BITMAX.FDB"
                move /y "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\*.rar" "C:\Temp\"
            )
        )
    )
)

rem ####################TRECHO PARA COMPRESSÃO DO ARQUIVO XML#########################
if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rar a "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Sabado.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Sabado.rar C:\Bitmax\BitmaxEmpresarialGerencial\Backup
    COPY C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Sabado.rar C:\Temp
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    if %errorlevel% equ 0 (
        for %%A in ("C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Sabado.rar") do (
            set filesize=%%~zA
            if !filesize! gtr 47185920 (
                del "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Sabado.rar"
                del /f /s /q "C:\Temp\XML_Gerencial_Sabado.rar"
                rar a -v45m "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML_Gerencial_Sabado.rar" "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\XML"
                move /y "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp\*.rar" "C:\Temp\"
            )
        )
    )
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    rd /s /q "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\Temp" 
)

if exist "C:\Bitmax\BitmaxEmpresarialGerencial\" (
    xcopy "C:\Bitmax\BitmaxEmpresarialGerencial\Backup\*" "D:\Backup Bitmax" /D /E /C /I /Y
)

@echo off
C:\Windows\System32\schtasks.exe /run /tn "Envio_Backup_Bitmax"

C:\Windows\System32\envio_telegram.exe

exit



