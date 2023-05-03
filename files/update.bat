@echo off
cls
:menu
cls
color 71
echo Usuario Logado:%username%                            Computador:%computername%
date /t  

echo  __________________________
echo     ESCOLHA UM APLICATIVO     
echo  1. INSTALADOR BITMAX          
echo  2. ATUALIZADOR BITMAX
echo  3. MODO AVANCADO
echo  4. SAIR               
echo __________________________ 
               
set /p opcao= Escolha uma opcao:
echo _______________________
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% GEQ 5 goto opcao5


:opcao1
cls
if exist "C:\Bitmax\Suporte" (
bitsadmin /transfer InstallBitmax /priority normal https://raw.githubusercontent.com/bitmaxsuporte/download/gh-pages/files/BitmaxInstall_Empresarial.rar C:\Bitmax\Suporte\BitmaxInstall_Empresarial.rar
cd C:\Bitmax\Suporte
cd c:\arquiv~1\winrar
rar x -ep -o+ C:\Bitmax\Suporte\BitmaxInstall_Empresarial.rar C:\Bitmax\Suporte
explorer.exe /e, /n,C:\Bitmax\Suporte
msg %username% /TIME:15 Download do instalador em C:\Bitmax\Suporte. 
goto menu
) else (
mkdir "C:\Bitmax\Suporte
bitsadmin /transfer InstallBitmax /priority normal https://raw.githubusercontent.com/bitmaxsuporte/download/gh-pages/files/BitmaxInstall_Empresarial.rar C:\Bitmax\Suporte\BitmaxInstall_Empresarial.rar
cd C:\Bitmax\Suporte
cd c:\arquiv~1\winrar
rar x -ep -o+ C:\Bitmax\Suporte\BitmaxInstall_Empresarial.rar C:\Bitmax\Suporte
explorer.exe /e, /n,C:\Bitmax\Suporte
msg %username% /TIME:15 Download do instalador em C:\Bitmax\Suporte. 
goto menu
)

:opcao2
cls
if exist "C:\Bitmax\Suporte" (
del /s /q "C:\Bitmax\Suporte\Backup.rar"
rd /s /q "C:\Bitmax\Suporte\Backup"
rd /s /q "C:\Bitmax\Suporte\Update"
bitsadmin /transfer AtualizadorBitmax /priority normal https://raw.githubusercontent.com/bitmaxsuporte/download/gh-pages/files/Atualizacao.rar C:\Bitmax\Suporte\Atualizacao.rar
bitsadmin /transfer BackupBitmax /priority normal https://bitmaxsuporte.github.io/download/files/Backup.rar C:\Bitmax\Suporte\Backup.rar
cd C:\Bitmax\Suporte
mkdir "C:\Bitmax\Suporte\Backup
mkdir "C:\Bitmax\Suporte\Update
cd c:\arquiv~1\winrar
rar x -ep -o+ C:\Bitmax\Suporte\Atualizacao.rar C:\Bitmax\Suporte\Update
rar x -ep -o+ C:\Bitmax\Suporte\Backup.rar C:\Bitmax\Suporte\Backup
explorer.exe /e, /n,C:\Bitmax\Suporte\Update
msg %username% /TIME:15 Download da atualizacao em C:\Bitmax\Suporte\Update. 
goto menu
) else (
del /s /q "C:\Bitmax\Suporte\Backup.rar"
rd /s /q "C:\Bitmax\Suporte\Backup"
rd /s /q "C:\Bitmax\Suporte\Update"
cd C:\Bitmax\Suporte
mkdir "C:\Bitmax\Suporte
bitsadmin /transfer AtualizadorBitmaxBitmax /priority normal https://raw.githubusercontent.com/bitmaxsuporte/download/gh-pages/files/Atualizacao.rar C:\Bitmax\Suporte\Atualizacao.rar
bitsadmin /transfer BackupBitmax /priority normal https://bitmaxsuporte.github.io/download/files/Backup.rar C:\Bitmax\Suporte\Backup.rar
cd C:\Bitmax\Suporte
mkdir "C:\Bitmax\Suporte\Backup
mkdir "C:\Bitmax\Suporte\Update
cd c:\arquiv~1\winrar
rar x -ep -o+ C:\Bitmax\Suporte\Atualizacao.rar C:\Bitmax\Suporte\Update
rar x -ep -o+ C:\Bitmax\Suporte\Backup.rar C:\Bitmax\Suporte\Backup
explorer.exe /e, /n,C:\Bitmax\Suporte\Update
msg %username% /TIME:15 Download da atualizacao em C:\Bitmax\Suporte\Update. 
goto menu
)

:opcao3
cls
if exist "C:\Bitmax\Suporte" (
del /s /q "C:\Bitmax\BitmaxEmpresarial\Bin\BitmaxNFe_backup.exe"
del /s /q "C:\Bitmax\BitmaxEmpresarial\Bin\BITMAXEMPRESARIAL_backup.exe"
del /s /q "C:\Bitmax\BitmaxEmpresarial\Bin\LoadOptions.xml"
rd /s /q "C:\Bitmax\BitmaxEmpresarial\Bin\Schemas"
del /s /q "C:\Bitmax\Suporte\Backup.rar"
rd /s /q "C:\Bitmax\Suporte\Backup"
rd /s /q "C:\Bitmax\Suporte\Update"
del /s /q "C:\Bitmax\BitmaxEmpresarial\Bin\Configuracoes.exe"
ren C:\Bitmax\BitmaxEmpresarial\Bin\BITMAXEMPRESARIAL.exe BITMAXEMPRESARIAL_backup.exe
ren C:\Bitmax\BitmaxEmpresarial\Bin\BitmaxNFe.exe BitmaxNFe_backup.exe
rd /s /q "C:\Bitmax\Suporte\Update"
bitsadmin /transfer AtualizadorBitmax /priority normal https://raw.githubusercontent.com/bitmaxsuporte/download/gh-pages/files/Atualizacao.rar C:\Bitmax\Suporte\Atualizacao.rar
bitsadmin /transfer BackupBitmax /priority normal https://bitmaxsuporte.github.io/download/files/Backup.rar C:\Bitmax\Suporte\Backup.rar
if exist "C:\Bitmax\Suporte\ibexpert.exe" (
echo Existe ibexpert jah existe!
) else (
bitsadmin /transfer Ibexpert /priority normal https://raw.githubusercontent.com/bitmaxsuporte/download/gh-pages/files/exe/ibexpert.exe C:\Bitmax\Suporte\ibexpert.exe
)
mkdir "C:\Bitmax\Suporte\Backup
mkdir "C:\Bitmax\Suporte\Update
cd C:\Bitmax\Suporte
cd c:\arquiv~1\winrar
rar x -ep -o+ C:\Bitmax\Suporte\Atualizacao.rar C:\Bitmax\Suporte\Update
rar x -ep -o+ C:\Bitmax\Suporte\Update\Backup.rar C:\Bitmax\Suporte\Backup
move C:\Bitmax\Suporte\Update\BITMAXEMPRESARIAL.exe C:\Bitmax\BitmaxEmpresarial\Bin
move C:\Bitmax\Suporte\Update\BitmaxNFe.exe C:\Bitmax\BitmaxEmpresarial\Bin
move C:\Bitmax\Suporte\Update\LoadOptions.xml C:\Bitmax\BitmaxEmpresarial\Bin
move C:\Bitmax\Suporte\Update\BitmaxSpedFiscal.exe C:\Bitmax\BitmaxEmpresarial\Bin
move C:\Bitmax\Suporte\Update\Configuracoes.exe C:\Bitmax\BitmaxEmpresarial\Bin
move C:\Bitmax\Suporte\Update\Backup.rar C:\Bitmax\Suporte
copy C:\Bitmax\BitmaxEmpresarial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarial\DB\BITMAX_backup.FDB
cd c:\arquiv~1\winrar
rar x -o+ C:\Bitmax\BitmaxEmpresarial\Bin\Configuracoes.exe C:\Bitmax\BitmaxEmpresarial\Bin
start C:\Bitmax\Suporte\ibexpert.exe
explorer.exe /e, /n,C:\Bitmax\Suporte\Update
msg %username% /TIME:30 O banco para compare esta dentro da pasta C:\Bitmax\Suporte\Update 
pause
goto menu
) else (
del /s /q "C:\Bitmax\BitmaxEmpresarial\Bin\BitmaxNFe_backup.exe"
del /s /q "C:\Bitmax\BitmaxEmpresarial\Bin\BITMAXEMPRESARIAL_backup.exe"
del /s /q "C:\Bitmax\BitmaxEmpresarial\Bin\LoadOptions.xml"
rd /s /q "C:\Bitmax\BitmaxEmpresarial\Bin\Schemas"
del /s /q "C:\Bitmax\BitmaxEmpresarial\Bin\Configuracoes.exe"
del /s /q "C:\Bitmax\Suporte\Backup.rar"
rd /s /q "C:\Bitmax\Suporte\Backup"
rd /s /q "C:\Bitmax\Suporte\Update"
ren C:\Bitmax\BitmaxEmpresarial\Bin\BITMAXEMPRESARIAL.exe BITMAXEMPRESARIAL_backup.exe
ren C:\Bitmax\BitmaxEmpresarial\Bin\BitmaxNFe.exe BitmaxNFe_backup.exe
rd /s /q "C:\Bitmax\Suporte\Update"
cd C:\Bitmax\Suporte
mkdir "C:\Bitmax\Suporte
bitsadmin /transfer AtualizadorBitmaxBitmax /priority normal https://raw.githubusercontent.com/bitmaxsuporte/download/gh-pages/files/Atualizacao.rar C:\Bitmax\Suporte\Atualizacao.rar
bitsadmin /transfer BackupBitmax /priority normal https://bitmaxsuporte.github.io/download/files/Backup.rar C:\Bitmax\Suporte\Backup.rar
if exist "C:\Bitmax\Suporte\ibexpert.exe" (
echo Existe ibexpert jah existe!
) else (
bitsadmin /transfer Ibexpert /priority normal https://raw.githubusercontent.com/bitmaxsuporte/download/gh-pages/files/exe/ibexpert.exe C:\Bitmax\Suporte\ibexpert.exe
)
mkdir "C:\Bitmax\Suporte\Backup
mkdir "C:\Bitmax\Suporte\Update
cd C:\Bitmax\Suporte
cd c:\arquiv~1\winrar
rar x -ep -o+ C:\Bitmax\Suporte\Atualizacao.rar C:\Bitmax\Suporte\Update
rar x -ep -o+ C:\Bitmax\Suporte\Update\Backup.rar C:\Bitmax\Suporte\Backup
move C:\Bitmax\Suporte\Update\BITMAXEMPRESARIAL.exe C:\Bitmax\BitmaxEmpresarial\Bin
move C:\Bitmax\Suporte\Update\BitmaxNFe.exe C:\Bitmax\BitmaxEmpresarial\Bin
move C:\Bitmax\Suporte\Update\LoadOptions.xml C:\Bitmax\BitmaxEmpresarial\Bin
move C:\Bitmax\Suporte\Update\BitmaxSpedFiscal.exe C:\Bitmax\BitmaxEmpresarial\Bin
move C:\Bitmax\Suporte\Update\Configuracoes.exe C:\Bitmax\BitmaxEmpresarial\Bin
move C:\Bitmax\Suporte\Update\Backup.rar C:\Bitmax\Suporte
copy C:\Bitmax\BitmaxEmpresarial\DB\BITMAX.FDB C:\Bitmax\BitmaxEmpresarial\DB\BITMAX_backup.FDB
cd c:\arquiv~1\winrar
rar x -o+ C:\Bitmax\BitmaxEmpresarial\Bin\Configuracoes.exe C:\Bitmax\BitmaxEmpresarial\Bin
start C:\Bitmax\Suporte\ibexpert.exe
explorer.exe /e, /n,C:\Bitmax\Suporte\Update
msg %username% /TIME:30 O banco para compare esta dentro da pasta C:\Bitmax\Suporte\Update 
goto menu
)



:opcao4
exit

:opcao5
cls
echo -----------------------------------
echo Opcao invalida! Escolha outra opcao
echo -----------------------------------
pause
goto menu




