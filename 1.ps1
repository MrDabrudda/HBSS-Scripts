cd\
cd C:\temp
Clear-Host
#Software Versions
$MAVersion = "5.6.1.209"
$ACCMVersion = "3.2.4.5"
$DLPVersion = "11.1.100.23"
$HIPSVersion = "8.0.0.4789"
$PAVersion = "6.3.0.194"
$ENSTPVersion = "10.6.1.1273"
$ENSPlatVersion = "10.6.1.1206"

$CompName = Read-Host -Prompt 'Input computer name or ip'
write-host $CompName

#Online Check
$Online = (Test-Connection $CompName -Count 1 -quiet)
if ($Online -eq $false){
Write-Host $CompName OFFLINE
}
else
{

#Force a checkin
.\PsExec64.exe -d -h -s \\$CompName "c:\program files\mcafee\host intrusion prevention\clientcontrol.exe" /stop "CHANGE THIS...HIPS_GUI_PASSWORD"
.\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -c
if ($lastexitcode -ne 0){
#write-host $lastexitcode
.\PsExec64.exe -h -s \\$CompName msiexec /fa C:\ProgramData\McAfee\Agent\MFEagent_x64.msi  /forcerestart
}
.\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -e
if ($lastexitcode -ne 0){
#write-host $lastexitcode
.\PsExec64.exe -h -s \\$CompName msiexec /fa C:\ProgramData\McAfee\Agent\MFEagent_x64.msi  /forcerestart
}
.\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -p
if ($lastexitcode -ne 0){
#write-host $lastexitcode
.\PsExec64.exe -h -s \\$CompName msiexec /fa C:\ProgramData\McAfee\Agent\MFEagent_x64.msi  /forcerestart
}
.\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -f
if ($lastexitcode -ne 0){
#write-host $lastexitcode
.\PsExec64.exe -h -s \\$CompName msiexec /fa C:\ProgramData\McAfee\Agent\MFEagent_x64.msi /forcerestart
}


$MARemote = (Get-Item \\$CompName\c$\'Program Files'\McAfee\Agent\cmdagent.exe).VersionInfo.FileVersion

if ($MARemote -ne $MAVersion) {

write-host 'MA Remote ='$MARemote
write-host "Outdated MA"

#Disable HIPS
.\PsExec64.exe -d -h -s \\$CompName "c:\program files\mcafee\host intrusion prevention\clientcontrol.exe" /stop "CHANGE THIS...HIPS_GUI_PASSWORD"

#Install MA
New-Item -Path FileSystem::\\$CompName\c$\temp -type directory -Force
copy FramePKG.exe \\$CompName\c$\temp
.\PsExec64.exe -h -s \\$CompName C:\temp\FramePKG.exe /Install=AGENT /FORCEINSTALL /SILENT
Start-Sleep 10
.\PsExec64.exe -h -s \\$CompName msiexec /fa C:\ProgramData\McAfee\Agent\MFEagent_x64.msi /forcerestart
}

.\PsExec64.exe -d -h -s \\$CompName "C:\Program Files\McAfee\Endpoint Security\Threat Prevention\amcfg.exe" /update

#Query Logged-on Users
.\PsExec64.exe -h -s \\$CompName quser

if ($MARemote -ne $MAVersion) {
Write-Host 'MA ='$MARemote
}

$ACCMRemote = (Get-Item \\$CompName\c$\'Program Files (x86)'\USAF\ACCM\ACCM_WATCH.exe).VersionInfo.FileVersion
if ($ACCMRemote -ne $ACCMVersion) {
write-host 'ACCM ='$ACCMRemote
}

$DLPRemote = (Get-Item \\$CompName\c$\'Program Files'\McAfee\DLP\Agent\fcag.exe).VersionInfo.FileVersion
if ($DLPRemote -ne $DLPVersion) {
write-host 'DLP ='$DLPRemote
}

$HIPSRemote = (Get-Item \\$CompName\c$\'Program Files\McAfee\Host Intrusion Prevention'\FireSvc.exe).VersionInfo.FileVersion
if ($HIPSRemote -ne $HIPSVersion) {
write-host 'HIPS ='$HIPSRemote
}

$PARemote = (Get-Item \\$CompName\c$\'Program Files (x86)\McAfee\Policy Auditor Agent'\AuditManagerService.exe).VersionInfo.FileVersion
if ($PARemote -ne $PAVersion) {
write-host 'PA ='$PARemote
}

$ENSTPRemote = (Get-Item \\$CompName\c$\'Program Files\McAfee\Endpoint Security\Threat Prevention'\amcfg.exe).VersionInfo.FileVersion
if ($ENSTPRemote -ne $ENSTPVersion) {
write-host 'ENS TP ='$ENSTPRemote
}

$ENSPlatRemote = (Get-Item \\$CompName\c$\'Program Files\McAfee\Endpoint Security\Endpoint Security Platform'\ESConfigTool.exe).VersionInfo.FileVersion
if ($ENSPlatRemote -ne $ENSPlatVersion) {
write-host 'ENS Platform ='$ENSPlatRemote
}

#Cleanup c:\windows\temp folder
#Remove-Item \\$CompName\c$\windows\temp\*.* -Force -Recurse
}
