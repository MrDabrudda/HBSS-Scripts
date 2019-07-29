cd\
cd C:\temp
cls
$CompName = Read-Host -Prompt 'Input computer name or ip'
echo $CompName

taskkill /S $CompName /F /IM TaniumClient.exe
taskkill /S $CompName /F /IM TaniumDetectEngine.exe
taskkill /S $CompName /F /IM TaniumEndpointIndex.exe
taskkill /S $CompName /F /IM OneDriveSetup.exe
taskkill /S $CompName /F /IM acrotray.exe
taskkill /S $CompName /F /IM armsvc.exe
taskkill /S $CompName /F /IM AFEMNS.exe
taskkill /S $CompName /F /IM AtHocUSAF.exe
taskkill /S $CompName /F /IM athocamc.exe
taskkill /S $CompName /F /IM CcmExec.exe
taskkill /S $CompName /F /IM CmRcService.exe
taskkill /S $CompName /F /IM wermgr.exe
taskkill /S $CompName /F /IM OneDrive.exe
taskkill /S $CompName /F /IM java.exe
taskkill /S $CompName /F /IM GoogleUpdate.exe
taskkill /S $CompName /F /IM lplatsvc.exe
taskkill /S $CompName /F /IM pfssmon.exe
taskkill /S $CompName /F /IM SCNotification.exe
taskkill /S $CompName /F /IM WerFault.exe
taskkill /S $CompName /F /IM DVService.exe
taskkill /S $CompName /F /IM DVTrayApp.exe
taskkill /S $CompName /F /IM ac.activclient.exe
taskkill /S $CompName /F /IM ac.autoupdate.exe
taskkill /S $CompName /F /IM acevents.exe
taskkill /S $CompName /F /IM AGSService.exe
taskkill /S $CompName /F /IM atiesrxx.exe
taskkill /S $CompName /F /IM atieclxx.exe
taskkill /S $CompName /F /IM lumidvcsvc.exe
taskkill /S $CompName /F /IM MOM.exe
taskkill /S $CompName /F /IM CCC.exe
taskkill /S $CompName /F /IM iexplore.exe
taskkill /S $CompName /F /IM outlook.exe
taskkill /S $CompName /F /IM chrome.exe
taskkill /S $CompName /F /IM acrobat.exe
taskkill /S $CompName /F /IM acrocef.exe
taskkill /S $CompName /F /IM excel.exe
taskkill /S $CompName /F /IM winword.exe
taskkill /S $CompName /F /IM msaccess.exe
taskkill /S $CompName /F /IM onenotem.exe
taskkill /S $CompName /F /IM powerpnt.exe
taskkill /S $CompName /F /IM microsoftedge.exe
taskkill /S $CompName /F /IM microsoftedgecp.exe
taskkill /S $CompName /F /IM sqlwriter.exe
taskkill /S $CompName /F /IM igfxCUIService.exe
taskkill /S $CompName /F /IM igfxEM.exe
taskkill /S $CompName /F /IM igfxhk.exe
taskkill /S $CompName /F /IM igfxtray.exe
taskkill /S $CompName /F /IM ibmpmsvc.exe
taskkill /S $CompName /F /IM IntelCpHDCPSvc.exe
taskkill /S $CompName /F /IM cxutilsvc.exe
taskkill /S $CompName /F /IM fjtwmksv.exe
taskkill /S $CompName /F /IM fjtwmkup.exe
taskkill /S $CompName /F /IM faxctrl.exe
taskkill /S $CompName /F /IM pacjsworker.exe
taskkill /S $CompName /F /IM hp3ddgservice.exe
taskkill /S $CompName /F /IM netbanner
taskkill /S $CompName /F /IM ac.activclient.gui.scagent.exe
taskkill /S $CompName /F /IM enstart64.exe
taskkill /S $CompName /F /IM mpcmdrun.exe
taskkill /S $CompName /F /IM sysmon64.exe
taskkill /S $CompName /F /IM smartscreen.exe

#logoff 1 /server:$CompName
#logoff 2 /server:$CompName
#logoff 3 /server:$CompName
#tasklist /NH /S $CompName |sort
