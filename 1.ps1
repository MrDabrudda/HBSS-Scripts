Set-Location \Users\$env:UserName\Desktop\temp

Clear-Host
#Software Versions
$MAVersion = "5.6.1.308"
$ACCMVersion = "3.2.4.5"
$DLPVersion = "11.1.100.23"
$HIPSVersion = "8.0.0.4789"
$PAVersion = "6.3.0.194"
$ENSTPVersion = "10.6.1.1273"
$ENSPlatVersion = "10.6.1.1206"

$CompName = Read-Host -Prompt 'Input computer name or ip'
write-host $CompName

#Online Check
$Online = (Test-Connection $CompName -Count 2 -quiet)
if ($Online -eq $false){
Write-Host $CompName OFFLINE
} else {

#Check for old MA install location
 if (Test-Path -Path $CompName\c$\ProgramData\McAfee\'Common Framework'\cmdagent.exe)
        {
        write-host 'WRONG AGENT FOLDER PATH FOUND' -ForegroundColor Yellow
        
                .\PsExec64.exe -d -h -s \\$CompName "c:\program files\mcafee\host intrusion prevention\clientcontrol.exe" /stop "HIPS UNLOCK PASSWORD"
                New-Item -Path FileSystem::\\$CompName\c$\temp -type directory -Force
                robocopy C:\Users\$env:UserName\Desktop\temp\ePO_ProductRemovalTool_19.5.0.17 \\$CompName\c$\temp
                .\PsExec64.exe -h -s \\$CompName c:\temp\McAfeeEndpointProductRemoval.exe --accepteula --MA
                Restart-Computer -ComputerName $CompName -Force
                ping.exe -n 100 $CompName
                copy FramePKG.exe \\$CompName\c$\temp
                .\PsExec64.exe -h -s \\$CompName C:\temp\FramePKG.exe /Install=AGENT /FORCEINSTALL /SILENT
                Restart-Computer -ComputerName $CompName -Force
                ping.exe -n 100 $CompName
                
        }

#Force a check-in
.\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -c
if ($lastexitcode -ne 0)
    {
write-host $lastexitcode
                 write-host 'AGENT BROKEN -C' -ForegroundColor Yellow
                .\PsExec64.exe -d -h -s \\$CompName "c:\program files\mcafee\host intrusion prevention\clientcontrol.exe" /stop "HIPS UNLOCK PASSWORD"
                New-Item -Path FileSystem::\\$CompName\c$\temp -type directory -Force
                copy FramePKG.exe \\$CompName\c$\temp
                .\PsExec64.exe -h -s \\$CompName C:\temp\FramePKG.exe /Install=AGENT /FORCEINSTALL /SILENT
                Restart-Computer -ComputerName $CompName -Force
                ping.exe -n 100 $CompName
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -c
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -e
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -p
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -f

    }

.\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -e
if ($lastexitcode -ne 0)
    {
write-host $lastexitcode

                write-host 'AGENT BROKEN -E' -ForegroundColor Yellow
                .\PsExec64.exe -d -h -s \\$CompName "c:\program files\mcafee\host intrusion prevention\clientcontrol.exe" /stop "HIPS UNLOCK PASSWORD"
                New-Item -Path FileSystem::\\$CompName\c$\temp -type directory -Force
                copy FramePKG.exe \\$CompName\c$\temp
                .\PsExec64.exe -h -s \\$CompName C:\temp\FramePKG.exe /Install=AGENT /FORCEINSTALL /SILENT
                Restart-Computer -ComputerName $CompName -Force
                ping.exe -n 100 $CompName
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -c
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -e
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -p
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -f

    }

.\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -p
if ($lastexitcode -ne 0)
    {
write-host $lastexitcode

                write-host 'AGENT BROKEN -P' -ForegroundColor Yellow
                .\PsExec64.exe -d -h -s \\$CompName "c:\program files\mcafee\host intrusion prevention\clientcontrol.exe" /stop "HIPS UNLOCK PASSWORD"
                New-Item -Path FileSystem::\\$CompName\c$\temp -type directory -Force
                copy FramePKG.exe \\$CompName\c$\temp
                .\PsExec64.exe -h -s \\$CompName C:\temp\FramePKG.exe /Install=AGENT /FORCEINSTALL /SILENT
                Restart-Computer -ComputerName $CompName -Force
                ping.exe -n 100 $CompName
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -c
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -e
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -p
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -f

    }

.\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -f
if ($lastexitcode -ne 0)
    {
write-host $lastexitcode

                write-host 'AGENT BROKEN -F' -ForegroundColor Yellow
                .\PsExec64.exe -d -h -s \\$CompName "c:\program files\mcafee\host intrusion prevention\clientcontrol.exe" /stop "HIPS UNLOCK PASSWORD"
                New-Item -Path FileSystem::\\$CompName\c$\temp -type directory -Force
                copy FramePKG.exe \\$CompName\c$\temp
                .\PsExec64.exe -h -s \\$CompName C:\temp\FramePKG.exe /Install=AGENT /FORCEINSTALL /SILENT
                Restart-Computer -ComputerName $CompName -Force
                ping.exe -n 100 $CompName
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -c
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -e
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -p
                .\PsExec64.exe -h -s \\$CompName "C:\Program Files\McAfee\Agent\cmdagent.exe" -f

    }


$MARemote = (Get-Item \\$CompName\c$\'Program Files'\McAfee\Agent\cmdagent.exe).VersionInfo.FileVersion

if ($MARemote -ne $MAVersion) {

write-host 'MA Remote ='$MARemote -ForegroundColor Yellow
write-host "Outdated MA" -ForegroundColor Yellow

#Disable HIPS
.\PsExec64.exe -d -h -s \\$CompName "c:\program files\mcafee\host intrusion prevention\clientcontrol.exe" /stop "HIPS UNLOCK PASSWORD"

#Install MA
New-Item -Path FileSystem::\\$CompName\c$\temp -type directory -Force
copy FramePKG.exe \\$CompName\c$\temp
.\PsExec64.exe -h -s \\$CompName C:\temp\FramePKG.exe /Install=AGENT /FORCEINSTALL /SILENT

                            }

.\PsExec64.exe -d -h -s \\$CompName "C:\Program Files\McAfee\Endpoint Security\Threat Prevention\amcfg.exe" /update

if ($MARemote -ne $MAVersion)
{
Write-Host 'MA ='$MARemote -ForegroundColor Yellow
}

$ACCMRemote = (Get-Item \\$CompName\c$\'Program Files (x86)'\USAF\ACCM\ACCM_WATCH.exe).VersionInfo.FileVersion
if ($ACCMRemote -ne $ACCMVersion)
{
write-host 'ACCM ='$ACCMRemote -ForegroundColor Yellow
}

$DLPRemote = (Get-Item \\$CompName\c$\'Program Files'\McAfee\DLP\Agent\fcag.exe).VersionInfo.FileVersion
if ($DLPRemote -ne $DLPVersion)
{
write-host 'DLP ='$DLPRemote -ForegroundColor Yellow
}

$HIPSRemote = (Get-Item \\$CompName\c$\'Program Files\McAfee\Host Intrusion Prevention'\FireSvc.exe).VersionInfo.FileVersion
if ($HIPSRemote -ne $HIPSVersion)
{
write-host 'HIPS ='$HIPSRemote -ForegroundColor Yellow
}

$PARemote = (Get-Item \\$CompName\c$\'Program Files (x86)\McAfee\Policy Auditor Agent'\AuditManagerService.exe).VersionInfo.FileVersion
if ($PARemote -ne $PAVersion)
{
write-host 'PA ='$PARemote -ForegroundColor Yellow
}

$ENSTPRemote = (Get-Item \\$CompName\c$\'Program Files\McAfee\Endpoint Security\Threat Prevention'\amcfg.exe).VersionInfo.FileVersion
if ($ENSTPRemote -ne $ENSTPVersion)
{
write-host 'ENS TP ='$ENSTPRemote -ForegroundColor Yellow
}

$ENSPlatRemote = (Get-Item \\$CompName\c$\'Program Files\McAfee\Endpoint Security\Endpoint Security Platform'\ESConfigTool.exe).VersionInfo.FileVersion
if ($ENSPlatRemote -ne $ENSPlatVersion)
{
write-host 'ENS Platform ='$ENSPlatRemote -ForegroundColor Yellow
}

#Cleanup c:\windows\temp folder
Remove-Item \\$CompName\c$\windows\temp\*.* -Force -Recurse

#Cleanup c:\temp folder
Remove-Item \\$CompName\c$\temp\*.* -Force -Recurse

.\PsExec64.exe -h -s \\$CompName quser
$Pfro = reg query "\\$CompName\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager" /v PendingFileRenameOperations 

if ($LastExitCode -eq $true)
{
Write-Host $CompName 'DONE' -ForegroundColor Blue
} else {
write-host $CompName 'REQUIRES A REBOOT' -ForegroundColor Red
$LoggedOn = .\PsExec64.exe -h -s \\$CompName quser
write-host $LoggedOn -ForegroundColor Cyan
#if ($LastExitCode -eq 1){
Restart-Computer -ComputerName $CompName -Force
write-host 'REBOOTING' -ForegroundColor Yellow
ping.exe -n 100 $CompName
        }

}


