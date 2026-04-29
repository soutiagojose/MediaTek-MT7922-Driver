@echo off
:: Verifica se ja esta como admin e ajusta o diretorio
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :main
) else (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

:main
:: Garante que o script rode de dentro da pasta onde esta o arquivo
cd /d "%~dp0"

title MediaTek MT7922 Driver
echo Instalando drivers WiFi e Bluetooth...
echo.

pnputil /add-driver "WIFI\*.inf" /subdirs /install
pnputil /add-driver "BT\*.inf" /subdirs /install

echo.
echo Instalacao concluida! Reinicie o PC.
pause