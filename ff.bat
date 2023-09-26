@echo off

:: find . | rg -i %*
:: dir /S /W /B . | rg -i %*
rg --files . | rg -i %*