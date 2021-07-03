:: Change active title bar color to black
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "4278190080" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "4278190080" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "3288334336" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationAfterglow" /t REG_DWORD /d "3288334336" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Change inactive title bar color to grey
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorInactive" /t REG_DWORD /d "4280953386" /f 1>NUL 2>NUL
