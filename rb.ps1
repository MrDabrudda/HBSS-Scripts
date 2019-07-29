cd\
cd C:\temp
cls

$CompName = Read-Host -Prompt 'Input computer name or ip'
echo $CompName

Restart-Computer -ComputerName $CompName -Force

#.\psshutdown.exe -f -r -t 00 \\$CompName

ping.exe -n 90 $CompName