if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}
Add-Type -AssemblyName 'System.Drawing'
$Global:sizes = @('32','40','48','64','96','192','208','240','424','448','1080')
$Global:sid = (Get-LocalUser -Name $env:USERNAME).SID.Value
function Show-Menu {
    Clear-Host
	Write-Host "================================================================================"
	Write-Host "                        Custom Windows Profile Picture"
	Write-Host "================================================================================"
	Write-Host "                       [1]   Resize picture automatically"
	Write-Host "                       [2]   Resize picture manually"
	Write-Host "                       [X]   EXIT"
	Write-Host "================================================================================"
    while ($mode -ne '1' -or '2' -or 'x') {
        $mode = Read-Host "Please make a selection"
        switch ($mode) {
            '1' {
				Set-Auto
                Set-Registry
            }
            '2' {
				Set-Man
                Set-Registry
            }
            'x' {
                exit
            }
        }
        Show-Menu
    }
}
function Set-Man {
    $Global:paths = @{}
    foreach($size in $sizes) {
        Get-Imagepath
        if ($path -ne ""){
            $paths.add( $size, $path )
        }
    }
}
function Set-Auto {
    $Global:paths = @{}
    Get-Imagepath -auto
    foreach ($size in $sizes) {
      Resize-Image -ImagePath $path -Size $size
      $paths.add( $size, $OutputPath )
    }
}
function Get-Imagepath {
    param (
        [Parameter(Mandatory=$False)][Switch]$auto
    )

    Clear-Variable -Name "return" -ErrorAction SilentlyContinue
    if ($auto) {
        $msg = "Full path to image in double quotes"
    }
    else {
        $msg = "Full path to image ($size px.) in double quotes"
    }
    do {
        $Global:path = (Read-Host $msg).Trim('"')
        if (Test-Path -Path $path) {
            if ([System.IO.Path]::GetExtension($path) -in ('.jpg' , '.png' , '.gif' , '.tiff' , '.bmp'))   {
                Write-Host "Valid File found"
                $return = $true
            }
            else {
                Write-Host "Invalid Filetype"
                $return = $false
            }
        }
        else {
            Write-Host "Files doesnt exist"
            $return = $false
        }
    } until ($return)
}
function Resize-Image() {
    param (
        [Parameter(Mandatory=$True)][String[]]$ImagePath,
        [Parameter(Mandatory=$False, ParameterSetName="Absolute")][Int]$Size,
        [Parameter(Mandatory=$False)][System.Drawing.Drawing2D.SmoothingMode]$SmoothingMode = "HighQuality",
        [Parameter(Mandatory=$False)][System.Drawing.Drawing2D.InterpolationMode]$InterpolationMode = "HighQualityBicubic",
        [Parameter(Mandatory=$False)][System.Drawing.Drawing2D.PixelOffsetMode]$PixelOffsetMode = "HighQuality"
    )
    process {
        $basename = [System.IO.Path]::GetFileNameWithoutExtension($ImagePath)
        $OldImage = New-Object -TypeName System.Drawing.Bitmap -ArgumentList $ImagePath
        $OldHeight = $OldImage.Height
        $OldWidth = $OldImage.Width
        $percentWidth = $Size / $OldHeight
        $percentHeight = $Size / $OldWidth
        if ($percentWidth -lt $percentHeight) {
            $ratio = $percentWidth
        }
        else {
            $ratio = $percentHeight
        }
        [int32]$Width = $OldHeight * $ratio
        [int32]$Height = $OldWidth * $ratio

        $OutDir = "$env:USERPROFILE\Profilepictures"
        $Global:OutputPath = "$OutDir\$($basename)_$($Size).png"
        if(!(test-Path $OutDir)){mkdir $OutDir}
        $Bitmap = New-Object -TypeName System.Drawing.Bitmap -ArgumentList $Width, $Height
        $NewImage = [System.Drawing.Graphics]::FromImage($Bitmap)

        $NewImage.SmoothingMode = $SmoothingMode
        $NewImage.InterpolationMode = $InterpolationMode
        $NewImage.PixelOffsetMode = $PixelOffsetMode
        $NewImage.DrawImage($OldImage, $(New-Object -TypeName System.Drawing.Rectangle -ArgumentList 0, 0, $Width, $Height))
        $Bitmap.Save($OutputPath)
        $Bitmap.Dispose()
        $NewImage.Dispose()
        $OldImage.Dispose()
        [System.GC]::Collect()
    }
}
function Out-Registry {
   $paths
   try {
       Clear-Content -Path "$env:USERPROFILE\Documents\registrypatcher.ps1" | Out-Null
   }
   catch {
      return
   }
   
    foreach ($size in $paths.keys) {
        $reg = @"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AccountPicture\Users\$sid" -Name "Image$size" -Value "$($paths["$size"])"
"@
        Add-Content -Path "$env:USERPROFILE\Documents\registrypatcher.ps1" -Value $reg 
    }
}
function Backup-Registry {
    $backupdir = "$env:USERPROFILE\Documents\PFP-Backup"
    if (Test-Path -Path "$backupdir\pfp_registrybackup_01.reg") {
        $LatestBackup = $(Get-ChildItem -Path $backupdir -Filter "*pfp_registrybackup_*" | Sort-Object 'LastWriteTime' -Descending)[0]
        [int]$index = [System.IO.Path]::GetFileNameWithoutExtension($LatestBackup).Split('_')[2]
        if ($index -lt 9) {
            [string]$index = '0' + ($index + 1)
        }
        else {
            $index++
        }
        $NewBackup = "pfp_registrybackup_" + $index + '.reg'
    }
    else {
        if(!(Test-Path $backupdir)){mkdir $backupdir}
        $NewBackup = "pfp_registrybackup_01.reg"
    }
    reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AccountPicture\Users\$sid" "$backupdir\$NewBackup"
}
function Set-Registry {
    Out-Registry
    Backup-Registry
    $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ep bypass -file ""$env:USERPROFILE\Documents\registrypatcher.ps1"""
    $principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -RunLevel "Highest"
    Register-ScheduledTask -TaskName "Set-Rergistry" -Action $action -Principal $principal -Force | Out-Null
    Start-ScheduledTask -TaskName "Set-Rergistry" | Out-Null
    Unregister-ScheduledTask -TaskName "Set-Rergistry" -Confirm:$false | Out-Null
    Remove-Item -Path "$env:USERPROFILE\Documents\registrypatcher.ps1"
}
Show-Menu