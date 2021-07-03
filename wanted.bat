@echo off

title Optimization
echo Applying prerequisites...
echo Please wait a few minutes...

:: Kill Foreground
taskkill /F /IM "MicrosoftEdge.exe" 1>NUL 2>NUL
taskkill /F /IM "explorer.exe" 1>NUL 2>NUL

:: Disable metro boot menu
bcdedit /set {default} bootmenupolicy legacy 1>NUL 2>NUL

:: Add environmental variables
setx ProgramFiles "C:\Program Files" /m 1>NUL 2>NUL
setx ProgramFiles86 "C:\Program Files (x86)" /m 1>NUL 2>NUL
setx ProgramData "C:\ProgramData" /m 1>NUL 2>NUL

:: Hide PerfLogs folder
attrib "C:\PerfLogs" +h 1>NUL 2>NUL

:: Reveal Public Desktop folder
attrib "C:\Users\Public\Desktop" -h 1>NUL 2>NUL

:: Set Hibernation type to Reduced
powercfg /h /type reduced 1>NUL 2>NUL

:: Disable Services***
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushsvc" /v "Start" /t REG_DWORD /d "4" /f 1>NUL 2>NUL
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f 1>NUL 2>NUL
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PeerDistSvc" /v "Start" /t REG_DWORD /d "4" /f 1>NUL 2>NUL
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PcaSvc" /v "Start" /t REG_DWORD /d "4" /f 1>NUL 2>NUL

:: Remove Scheduled Tasks
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable 1>NUL 2>NUL
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable 1>NUL 2>NUL
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /disable 1>NUL 2>NUL
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /disable 1>NUL 2>NUL
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable 1>NUL 2>NUL
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable 1>NUL 2>NUL
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable 1>NUL 2>NUL
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable 1>NUL 2>NUL
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /disable 1>NUL 2>NUL
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /disable 1>NUL 2>NUL
schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable 1>NUL 2>NUL
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable 1>NUL 2>NUL
schtasks /Change /TN "\Microsoft\Windows\ApplicationData\DsSvcCleanup" /disable 1>NUL 2>NUL
schtasks /Change /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable 1>NUL 2>NUL
schtasks /Change /TN "\Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /disable 1>NUL 2>NUL
schtasks /Change /TN "\Microsoft\Windows\Diagnosis\Scheduled" /disable 1>NUL 2>NUL
schtasks /Change /TN "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable 1>NUL 2>NUL

:: Enable Developer mode
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v "AllowDevelopmentWithoutDevLicense" /t REG_DWORD /d "1" /f 1>NUL 2>NUL
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v "AllowAllTrustedApps" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Remove "- Shortcut" text from shortcuts
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates" /v "ShortcutNameTemplate" /t REG_SZ /d "\"%%s.lnk\"" /f 1>NUL 2>NUL

:: Disable all Content Delivery Manager features***
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RemediationRequired" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314563Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable all suggested apps
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "22StokedOnIt.NotebookPro_ffs55s3hze5sr" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "2FE3CB00.PicsArt-PhotoStudio_crhqpqs3x1ygc" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "41038Axilesoft.ACGMediaPlayer_wxjjre7dryqb6" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "5CB722CC.SeekersNotesMysteriesofDarkwood_ypk0bew5psyra" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "7458BE2C.WorldofTanksBlitz_x4tje2y229k00" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "828B5831.HiddenCityMysteryofShadows_ytsefhwckbdv6" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "828B5831.TheSecretSociety-HiddenMystery_ytsefhwckbdv6" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "89006A2E.AutodeskSketchBook_tf1gferkr813w" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "9E2F88E3.Twitter_wgeqdkkx372wm" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "A278AB0D.AsphaltStreetStormRacing_h6adky7gbf63m" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "A278AB0D.DisneyMagicKingdoms_h6adky7gbf63m" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "A278AB0D.DragonManiaLegends_h6adky7gbf63m" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "A278AB0D.MarchofEmpires_h6adky7gbf63m" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "AdobeSystemsIncorporated.PhotoshopElements2018_ynb6jyjzte8ga" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "CAF9E577.Plex_aam28m9va5cke" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "DolbyLaboratories.DolbyAccess_rz1tebttyb220" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Drawboard.DrawboardPDF_gqbn7fs4pywxm" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Expedia.ExpediaHotelsFlightsCarsActivities_0wbx8rnn4qk5c" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Facebook.317180B0BB486_8xx8rvfyw5nnt" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Facebook.Facebook_8xx8rvfyw5nnt" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Facebook.InstagramBeta_8xx8rvfyw5nnt" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Fitbit.FitbitCoach_6mqt6hf9g46tw" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "flaregamesGmbH.RoyalRevolt2_g0q0z3kw54rap" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "GAMELOFTSA.Asphalt8Airborne_0pp20fcewvvtj" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "king.com.BubbleWitch3Saga_kgqvnymyfvs32" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "king.com.CandyCrushSaga_kgqvnymyfvs32" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "king.com.CandyCrushSodaSaga_kgqvnymyfvs32" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.AgeCastles_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.BingNews_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.BingSports_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.BingWeather_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "microsoft.microsoftskydrive_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.MinecraftUWP_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.MSPaint_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "NAVER.LINEwin8_8ptj331gd3tyt" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Nordcurrent.CookingFever_m9bz608c1b9ra" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "SiliconBendersLLC.Sketchable_r2kxzpx527qgj" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "SpotifyAB.SpotifyMusic_zpdnekdrzrea0" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "ThumbmunkeysLtd.PhototasticCollage_nfy108tqq3p12" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "USATODAY.USATODAY_wy7mw3214mat8" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "WinZipComputing.WinZipUniversal_3ykzqggjzj4z0" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Network Location Wizard prompts
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Network\NewNetworkWindowOff" /f 1>NUL 2>NUL

:: Disable Aero Shake
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable Automatic Maintenance
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable Error Reporting
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Keep thumbnail cache upon Restart
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v "Autorun" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v "Autorun" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Increase System Restore point frequency
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable JPEG wallpaper quality reducion
reg add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "100" /f 1>NUL 2>NUL

:: Increase 15 file selection limit that hides context menu items
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "MultipleInvokePromptMinimum" /t REG_DWORD /d "999" /f 1>NUL 2>NUL

:: Replace "Personalize" with "Appearance" in desktop context menu
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Personalize" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Personalize" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Personalize\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Personalize\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\DesktopBackground\Shell\Personalize" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance" /v "Icon" /t REG_SZ /d "display.dll,-1" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance" /v "MUIVerb" /t REG_SZ /d "Appearance" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance" /v "Position" /t REG_SZ /d "Bottom" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance" /v "Subcommands" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\01Background" /v "Icon" /t REG_SZ /d "imageres.dll,-110" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\01Background" /v "MUIVerb" /t REG_SZ /d "Background" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\01Background" /v "SettingsURI" /t REG_SZ /d "ms-settings:personalization-background" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\01Background\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\02Colors" /v "Icon" /t REG_SZ /d "themecpl.dll" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\02Colors" /v "MUIVerb" /t REG_SZ /d "Colors" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\02Colors" /v "SettingsURI" /t REG_SZ /d "ms-settings:personalization-colors" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\02Colors\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\03DesktopIcons" /v "Icon" /t REG_SZ /d "desk.cpl" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\03DesktopIcons" /v "MUIVerb" /t REG_SZ /d "Desktop Icons" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\03DesktopIcons\command" /v "" /t REG_SZ /d "rundll32 shell32.dll,Control_RunDLL desk.cpl,,0" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\04LockScreen" /v "Icon" /t REG_SZ /d "imageres.dll,285" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\04LockScreen" /v "MUIVerb" /t REG_SZ /d "Lock Screen" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\04LockScreen" /v "SettingsURI" /t REG_SZ /d "ms-settings:lockscreen" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\04LockScreen\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\05MousePointers" /v "Icon" /t REG_SZ /d "main.cpl" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\05MousePointers" /v "MUIVerb" /t REG_SZ /d "Mouse Pointers" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\05MousePointers\command" /v "" /t REG_SZ /d "rundll32.exe shell32.dll,Control_RunDLL main.cpl,,1" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\06ScreenSaver" /v "Icon" /t REG_SZ /d "PhotoScreensaver.scr" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\06ScreenSaver" /v "MUIVerb" /t REG_SZ /d "Screen Saver" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\06ScreenSaver\command" /v "" /t REG_SZ /d "rundll32.exe shell32.dll,Control_RunDLL desk.cpl,screensaver,@screensaver" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\07Sounds" /v "Icon" /t REG_SZ /d "mmsys.cpl" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\07Sounds" /v "MUIVerb" /t REG_SZ /d "Sounds" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\07Sounds\command" /v "" /t REG_SZ /d "rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl ,2" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\08Taskbar" /v "Icon" /t REG_SZ /d "shell32.dll,-40" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\08Taskbar" /v "MUIVerb" /t REG_SZ /d "Taskbar" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\08Taskbar" /v "SettingsURI" /t REG_SZ /d "ms-settings:taskbar" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\08Taskbar\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL

:: Replace "Display Settings" with "Settings" in desktop context menu
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Display" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Display" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Display\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Display\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\DesktopBackground\Shell\Display" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings" /v "MUIVerb" /t REG_SZ /d "Settings" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings" /v "Position" /t REG_SZ /d "Bottom" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings" /v "Subcommands" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\01Accounts" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\01Accounts" /v "MUIVerb" /t REG_SZ /d "Accounts" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\01Accounts" /v "SettingsURI" /t REG_SZ /d "ms-settings:yourinfo" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\01Accounts\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\02Apps" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\02Apps" /v "MUIVerb" /t REG_SZ /d "Apps" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\02Apps" /v "SettingsURI" /t REG_SZ /d "ms-settings:appsfeatures" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\02Apps\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\03Devices" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\03Devices" /v "MUIVerb" /t REG_SZ /d "Devices" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\03Devices" /v "SettingsURI" /t REG_SZ /d "ms-settings:bluetooth" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\03Devices\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\04Display" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\04Display" /v "MUIVerb" /t REG_SZ /d "Display" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\04Display" /v "SettingsURI" /t REG_SZ /d "ms-settings:display" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\04Display\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\05Ease" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\05Ease" /v "MUIVerb" /t REG_SZ /d "Ease of Access" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\05Ease" /v "SettingsURI" /t REG_SZ /d "ms-settings:easeofaccess-narrator" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\05Ease\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\06Gaming" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\06Gaming" /v "MUIVerb" /t REG_SZ /d "Gaming" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\06Gaming" /v "SettingsURI" /t REG_SZ /d "ms-settings:gaming-gamebar" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\06Gaming\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\07Network" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\07Network" /v "MUIVerb" /t REG_SZ /d "Network && Internet" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\07Network" /v "SettingsURI" /t REG_SZ /d "ms-settings:network" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\07Network\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\08Personalization" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\08Personalization" /v "MUIVerb" /t REG_SZ /d "Personalization" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\08Personalization" /v "SettingsURI" /t REG_SZ /d "ms-settings:themes" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\08Personalization\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\09Phone" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\09Phone" /v "MUIVerb" /t REG_SZ /d "Phone" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\09Phone" /v "SettingsURI" /t REG_SZ /d "ms-settings:mobile-devices" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\09Phone\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\10Privacy" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\10Privacy" /v "MUIVerb" /t REG_SZ /d "Privacy" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\10Privacy" /v "SettingsURI" /t REG_SZ /d "ms-settings:privacy" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\10Privacy\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\11Search" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\11Search" /v "MUIVerb" /t REG_SZ /d "Search" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\11Search" /v "SettingsURI" /t REG_SZ /d "ms-settings:cortana" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\11Search\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\12Time" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\12Time" /v "MUIVerb" /t REG_SZ /d "Time && Language" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\12Time" /v "SettingsURI" /t REG_SZ /d "ms-settings:dateandtime" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\12Time\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\13Update" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\13Update" /v "MUIVerb" /t REG_SZ /d "Update && Security" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\13Update" /v "SettingsURI" /t REG_SZ /d "ms-settings:windowsupdate" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\13Update\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL

:: Add "Open Command Prompt here" to context menus
SetACL.exe -silent -on "HKCR\Directory\shell\cmd" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\shell\cmd" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\Directory\shell\cmd\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\shell\cmd\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\Directory\shell\cmd" /f 1>NUL 2>NUL
reg add "HKCR\Directory\shell\runas" /v "" /t REG_SZ /d "Open Command Prompt here" /f 1>NUL 2>NUL
reg add "HKCR\Directory\shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe" /f 1>NUL 2>NUL
reg add "HKCR\Directory\shell\runas" /v "NeverDefault" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\Directory\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\Directory\shell\runas" /v "Position" /t REG_SZ /d "Top" /f 1>NUL 2>NUL
reg add "HKCR\Directory\shell\runas\command" /v "" /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f 1>NUL 2>NUL
SetACL.exe -silent -on "HKCR\Directory\Background\shell\cmd" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\cmd" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\cmd\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\cmd\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\Directory\Background\shell\cmd" /f 1>NUL 2>NUL
reg add "HKCR\Directory\Background\shell\runas" /v "" /t REG_SZ /d "Open Command Prompt here" /f 1>NUL 2>NUL
reg add "HKCR\Directory\Background\shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe" /f 1>NUL 2>NUL
reg add "HKCR\Directory\Background\shell\runas" /v "NeverDefault" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\Directory\Background\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\Directory\Background\shell\runas" /v "Position" /t REG_SZ /d "Top" /f 1>NUL 2>NUL
reg add "HKCR\Directory\Background\shell\runas\command" /v "" /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\Shell\runas" /v "" /t REG_SZ /d "Open Command Prompt here" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\Shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\Shell\runas" /v "NeverDefault" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\Shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\Shell\runas" /v "Position" /t REG_SZ /d "Top" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\Shell\runas\command" /v "" /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\background\shell\runas" /v "" /t REG_SZ /d "Open Command Prompt here" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\background\shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\background\shell\runas" /v "NeverDefault" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\background\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\background\shell\runas" /v "Position" /t REG_SZ /d "Top" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\background\shell\runas\command" /v "" /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f 1>NUL 2>NUL

:: Enable Windows Installer in Safe Mode
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Network\MSIServer" /v "" /t REG_SZ /d "Service" /f 1>NUL 2>NUL
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Minimal\MSIServer" /v "" /t REG_SZ /d "Service" /f 1>NUL 2>NUL

:: Increase 3 pinned contacts limit on taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "TaskbarCapacity" /t REG_DWORD /d "999" /f 1>NUL 2>NUL

:: Set "Do this for all current items" checked by default
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v "ConfirmationCheckBoxDoForAll" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Add ".bat" to "New" submenu of Desktop context menu
reg add "HKLM\Software\Classes\.bat\ShellNew" /v "NullFile" /t REG_SZ /d "1" /f 1>NUL 2>NUL
reg add "HKLM\Software\Classes\.bat\ShellNew" /v "ItemName" /t REG_EXPAND_SZ /d "@C:\Windows\System32\acppage.dll,-6002" /f 1>NUL 2>NUL

:: Add ".reg" to "New" submenu of Desktop context menu
reg add "HKLM\Software\Classes\.reg\ShellNew" /v "NullFile" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKLM\Software\Classes\.reg\ShellNew" /v "ItemName" /t REG_EXPAND_SZ /d "@C:\WINDOWS\regedit.exe,-309" /f 1>NUL 2>NUL

:: Remove Desktop from This PC
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f 1>NUL 2>NUL

:: Remove Documents from This PC
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f 1>NUL 2>NUL

:: Remove Downloads from This PC
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f 1>NUL 2>NUL

:: Remove Music from This PC
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f 1>NUL 2>NUL

:: Remove Pictures from This PC
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f 1>NUL 2>NUL

:: Remove Videos from This PC
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f 1>NUL 2>NUL

:: Remove 3D Objects from This PC
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f 1>NUL 2>NUL
reg delete "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f 1>NUL 2>NUL

:: Remove OneDrive from Navigation Pane
reg add "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Remove Network from Navigation Pane
SetACL.exe -silent -on "HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" -ot reg -actn ace -ace "n:Administrators;p:full"
reg add "HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Remove external drives from Navigation Pane
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}" /f 1>NUL 2>NUL

:: Disable suggested apps Windows Ink WorkSpace
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceAppSuggestionsEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Classes\CLSID\{679f85cb-0220-4080-b29b-5540cc05aab6}" /v "AllowSuggestedAppsInWindowsInkWorkspace" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Advertising ID
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /f 1>NUL 2>NUL

:: Disable transmission of typing information
reg add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Microsoft conducting experiments with this machine
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable advertisements via Bluetooth
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\Bluetooth" /v "AllowAdvertising" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Windows Customer Experience Improvement Program
reg add "HKLM\Software\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable tracking of application startups
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable application access of diagnostic information
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}" /v "Value" /t REG_SZ /d "Deny" /f 1>NUL 2>NUL

:: Disable synchronization of all settings to Microsoft
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d "5" /f 1>NUL 2>NUL

:: Disable Input Personalization
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicyy" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable peer-to-peer functionality in Windows Update
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable ads in File Explorer and OneDrive
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable feedback reminders
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Open File security warning
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t "REG_DWORD" /d "00000000" /f 1>NUL 2>NUL
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t "REG_DWORD" /d "00000000" /f 1>NUL 2>NUL

:: Remove "Edit with photos" from context menus
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "ActivatableClassId" /t REG_SZ /d "App.AppX65n3t4j73ch7cremsjxn7q8bph1ma8jw.mca" /f 1>NUL 2>NUL
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "PackageId" /t REG_SZ /d "Microsoft.Windows.Photos_2017.18062.12990.0_x64__8wekyb3d8bbwe" /f 1>NUL 2>NUL
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "ContractId" /t REG_SZ /d "Windows.File" /f 1>NUL 2>NUL
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "DesiredInitialViewState" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "" /t REG_SZ /d "@{Microsoft.Windows.Photos_2017.18062.12990.0_x64__8wekyb3d8bbwe?ms-resource://Microsoft.Windows.Photos/Resources/EditWithPhotos}" /f 1>NUL 2>NUL
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit\command" /v "DelegateExecute" /t REG_SZ /d "{4ED3A719-CEA8-4BD9-910D-E252F997AFC2}" /f 1>NUL 2>NUL

:: Remove "Edit with Paint 3D" from context menus
reg delete "HKLM\Software\Classes\SystemFileAssociations\.bmp\Shell\3D Edit" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.jpeg\Shell\3D Edit" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.jpe\Shell\3D Edit" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.jpg\Shell\3D Edit" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.png\Shell\3D Edit" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.gif\Shell\3D Edit" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.tif\Shell\3D Edit" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.tiff\Shell\3D Edit" /f 1>NUL 2>NUL

:: Remove "Include in library" from context menus
reg delete "HKCR\Folder\ShellEx\ContextMenuHandlers\Library Location" /f 1>NUL 2>NUL

:: Delete startup shortcut***
del /f /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\startup.bat" 1>NUL 2>NUL

:: Countdown
cls
for %%r in (5 4 3 2 1) do (
echo Restarting in %%r...
timeout 1 1>NUL 2>NUL
cls
)

:: Force restart
shutdown /r /f /t 0
