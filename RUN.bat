@echo off

cd %~dp0
C:\Windows\System32\WindowsPowerShell\v1.0.\PowerShell.exe -executionpolicy bypass -file .\TKFinder.ps1

PAUSE