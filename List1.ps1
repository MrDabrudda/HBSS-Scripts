cd\
cd C:\temp
Clear-Host
#Software Versions
$MAVersion = "5.6.1.209"

foreach ($CompName in (Get-Content List1.txt)) {

#Online Check
$Online = (Test-Connection $CompName -Count 1 -quiet)
if ($Online -eq $false){
Write-Host $CompName OFFLINE
}
else
{

#Force a checkin
.\PsExec64.exe -d -h -s \\$CompName "c:\program files\mcafee\host intrusion prevention\clientcontrol.exe" /stop "CHANGE THIS...HIPS_GUI_UNLOCK_PASSWORD"
.\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -c
if ($lastexitcode -ne 0){
#write-host $lastexitcode
.\PsExec64.exe -h -s \\$CompName msiexec /fa C:\ProgramData\McAfee\Agent\MFEagent_x64.msi  /forcerestart
}

.\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -e
.\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -p
.\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -f

$MARemote = (Get-Item \\$CompName\c$\'Program Files'\McAfee\Agent\cmdagent.exe).VersionInfo.FileVersion

if ($MARemote -ne $MAVersion) {

write-host 'MA Remote ='$MARemote
write-host "Outdated MA"

#Disable HIPS
.\PsExec64.exe -d -h -s \\$CompName "c:\program files\mcafee\host intrusion prevention\clientcontrol.exe" /stop "CHANGE THIS...HIPS_GUI_UNLOCK_PASSWORD"

#Install MA
New-Item -Path FileSystem::\\$CompName\c$\temp -type directory -Force
copy FramePKG.exe \\$CompName\c$\temp
.\PsExec64.exe -h -s \\$CompName C:\temp\FramePKG.exe /Install=AGENT /FORCEINSTALL /SILENT
Start-Sleep 10
.\PsExec64.exe -h -s \\$CompName msiexec /fa C:\ProgramData\McAfee\Agent\MFEagent_x64.msi /norestart

}

#Force ENS 10 DAT updates
.\PsExec64.exe -d -h -s \\$CompName "C:\Program Files\McAfee\Endpoint Security\Threat Prevention\amcfg.exe" /update
}
}