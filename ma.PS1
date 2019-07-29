cd\
cd C:\temp
cls
#Software Versions
$MAVersion = "5.6.1.209"

$CompName = Read-Host -Prompt 'Input computer name or ip'
write-host $CompName
ping -n 1 $CompName 
.\PsExec64.exe -d -h -s \\$CompName "c:\program files\mcafee\host intrusion prevention\clientcontrol.exe" /stop "CHANGE THIS...HIPS_GUI_UNLOCK_PASSWORD"
.\PsExec64.exe -h -s \\$CompName msiexec /fa C:\ProgramData\McAfee\Agent\MFEagent_x64.msi  /forcerestart
