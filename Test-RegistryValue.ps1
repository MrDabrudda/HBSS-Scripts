#Usage...
#$reg = Test-RegistryValue -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Value 'DisableWindowsConsumerFeatures'
#write-host $reg

function Test-RegistryValue {

param (

 [parameter(Mandatory=$true)]
 [ValidateNotNullOrEmpty()]$Path,

[parameter(Mandatory=$true)]
 [ValidateNotNullOrEmpty()]$Value
)

try {

Get-ItemProperty -Path $Path | Select-Object -ExpandProperty $Value -ErrorAction Stop | Out-Null
 return $true
 }

catch {

return $false

}

}


<#
$Search = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Value 'AllowCloudSearch'
if (Test-Path $Search) {
Write-Output "Reboot Needed"
}
#>
