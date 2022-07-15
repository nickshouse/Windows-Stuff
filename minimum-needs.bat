@echo off

:: Disable automatic updates
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f

:: Disable Windows Defender SmartScreen Filter
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable User Account Control prompts
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable "Windows protected your PC" dialogue
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable Open File security warning
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t "REG_DWORD" /d "00000001" /f 1>NUL 2>NUL

:: Hide PerfLogs folder
attrib "C:\PerfLogs" +h

:: Reveal Public Desktop folder
attrib "C:\Users\Public\Desktop" -h

:: Remove "- Shortcut" text from shortcuts
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates" /v "ShortcutNameTemplate" /t REG_SZ /d "\"%%s.lnk\"" /f

:: Enable Peak at desktop
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisablePreviewDesktop" /t REG_DWORD /d "0" /f

:: Disable mouse acceleration
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_DWORD /d "0" /f

:: Disable Network Location Wizard prompts
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Network\NewNetworkWindowOff" /f

:: Change Performance Options to Adjust for best appearence
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "1" /f

:: File Explorer opens to This PC
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f

:: Disable Aero Shake
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f

:: Disable Automatic Maintenance
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f

:: Disable Error Reporting
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f

:: Keep thumbnail cache upon Restart
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v "Autorun" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v "Autorun" /t REG_DWORD /d "0" /f

:: Increase System Restore point frequency
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d "0" /f

:: Disable JPEG wallpaper quality reducion
reg add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "100" /f

:: Increase 15 file selection limit that hides context menu items
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "MultipleInvokePromptMinimum" /t REG_DWORD /d "999" /f

:: Set "Do this for all current items" checked by default
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v "ConfirmationCheckBoxDoForAll" /t REG_DWORD /d "1" /f

:: Add ".bat" to "New" submenu of Desktop context menu
reg add "HKLM\Software\Classes\.bat\ShellNew" /v "NullFile" /t REG_SZ /d "1" /f
reg add "HKLM\Software\Classes\.bat\ShellNew" /v "ItemName" /t REG_EXPAND_SZ /d "@C:\Windows\System32\acppage.dll,-6002" /f

:: Add ".reg" to "New" submenu of Desktop context menu
reg add "HKLM\Software\Classes\.reg\ShellNew" /v "NullFile" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\.reg\ShellNew" /v "ItemName" /t REG_EXPAND_SZ /d "@C:\WINDOWS\regedit.exe,-309" /f

:: Disable search history in File Explorer
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f

:: Set File Explorer starting folder to This PC
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f

:: Hide frequently used folders in "Quick access"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "0" /f

:: Hide recent files in "Quick access"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "0" /f

:: Enable clipboard history
reg add "HKEY_CURRENT_USER\Software\Microsoft\Clipboard" /v "EnableClipboardHistory" /t REG_DWORD /d "1" /f

:: Allow signed scripts to run
powershell.exe Set-ExecutionPolicy RemoteSigned

:: Remove external drives from Navigation Pane
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}" /f

:: Disable first login animation
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableFirstLogonAnimation" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Enable Num-lock at login screen
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2147483650" /f

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

:: Remove "Open PowerShell window here" from Shift+Right-click context menus
SetACL.exe -silent -on "HKCR\Directory\shell\Powershell" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\shell\Powershell" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\Directory\shell\Powershell\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\shell\Powershell\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\Directory\shell\Powershell" /f 1>NUL 2>NUL
SetACL.exe -silent -on "HKCR\Directory\Background\shell\Powershell" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\Powershell" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\Powershell\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\Powershell\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\Directory\Background\shell\Powershell" /f 1>NUL 2>NUL

pause