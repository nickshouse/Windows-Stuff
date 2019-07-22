# Windows 10 optimization script

## What does this script do?
This script removes potential bloatware comes with Windows 10 and optimizes some settings.

### How to use
Clone or download zip this repo, simply unzip it and run `optimize.bat` file. 
`optimize.bat` is recommended for use after clean Windows install.
`optimize - partial system apps remove.bat` is recommended for average users, recommended for running Windows installation.
`optimize - minimal no apps remove.bat` is recommended for Windows fanboys who likes to keep apps and don't want to change anything.
`enable UAC.bat` is a simple script to enable UAC who likes to keep it.

### What does it optimizes?
The thing it does is listed here.

 - Disable metro boot menu (For BIOS/Legacy MBR dual boot users)
 - Uninstall OneDrive
 - Hide PerfLogs folder
 - Reveal Public Desktop folder
 - Set Hibernation type to Reduced
 - Delete "Microsoft Edge" shortcut from Desktop
 - Delete "Your Phone" shortcut from Desktop
 - Disable some Services
 - Enable Developer mode (not in partial and minimal scripts)
 - Change Folder options
 - Disable Slideshow during Lock Screen
 - Enable Dark Mode
 - Remove "- Shortcut" text from shortcuts
 - Enable Peek at desktop
 - Disable Windows Defender SmartScreen Filter
 - Disable first login animation
 - Disable all Content Delivery Manager features
 - Disable all suggested apps
 - Disable mouse acceleration
 - Disable User Account Control prompts (Use `enable UAC.bat` to enable it)
 - Disable Network Location Wizard prompts
 - Disable Gamebar
 - Disable Game Mode
 - Disable automatic updates
 - Change Performance Options to Adjust for best appearence
 - File Explorer opens to This PC
 - Disable Aero Shake
 - Disable "Look for an app in the Store" dialogue
 - Disable "You have new apps that can open this type of file" notification
 - Disable Automatic Maintenance
 - Disable "Windows protected your PC" dialogue
 - Disable Malicious Software Removal Tool from installing
 - Disable Error Reporting
 - Keep thumbnail cache upon Restart
 - Increase System Restore point frequency
 - Disable Cortana
 - Disable JPEG wallpaper quality reduction
 - Increase 15 file selection limit that hides context menu items
 - Replace "Personalize" with "Appearance" in desktop context menu
 - Replace "Display Settings" with "Settings" in desktop context menu
 - Add "Open Command Prompt here" to context menus
 - Remove "Open PowerShell window here" from Shift+Right-click context menus
 - Enable Windows Installer in Safe Mode
 - Increase 3 pinned contacts limit on taskbar
 - Disable online tips in Settings
 - Set "Do this for all current items" checked by default
 - Add ".bat" to "New" submenu of Desktop context menu
 - Add ".reg" to "New" submenu of Desktop context menu
 - Disable wide context menu
 - Remove Desktop from This PC
 - Remove Documents from This PC
 - Remove Downloads from This PC
 - Remove Music from This PC
 - Remove Pictures from This PC
 - Remove Videos from This PC
 - Remove 3D Objects from This PC
 - Disable search history in File Explorer
 - Remove OneDrive from Navigation Pane
 - Remove Network from Navigation Pane
 - Remove external drives from Navigation Pane
 - Disable suggested apps Windows Ink WorkSpace
 - Disable Sharing of handwriting data
 - Disable Sharing of handwriting error reports
 - Disable Inventory Collector
 - Disable Camera in login screen
 - Disable Advertising ID
 - Disable transmission of typing information
 - Disable Microsoft conducting experiments with this machine
 - Disable advertisements via Bluetooth
 - Disable Windows Customer Experience Improvement Program
 - Disable syncing of text messages to Microsoft
 - Disable application access to user account information
 - Disable tracking of application startups
 - Disable application access of diagnostic information
 - Disable password reveal button
 - Disable user steps recorder
 - Disable telemetry
 - Disable synchronization of all settings to Microsoft
 - Disable Input Personalization
 - Disable updates for Speech Recognition and Speech Synthesis
 - Disable functionality to locate the system
 - Disable peer-to-peer functionality in Windows Update
 - Disable ads in File Explorer and OneDrive
 - Disable feedback reminders
 - Remove Search/Cortana, Task View and People button from taskbar
 - Hide frequently used folders in "Quick access"
 - Hide recent files in "Quick access"
 - Disable Timeline
 - Enable clipboard history
 - Disable Open File security warning
 - Remove "Edit with photos" from context menus
 - Remove "Edit with Paint 3D" from context menus
 - Remove "Include in library" from context menus
 - Disable Microsoft Edge prelaunching
 - Disable Microsoft Edge tab preloading
 - Change active title bar color to black (not in partial and minimal scripts)
 - Change inactive title bar color to grey (not in partial and minimal scripts)
 - Remove acrylic blur on sign-in screen
 - **Removes potential bloat** except Photos, Music, Paint 3D, Snip and Sketch in partial and nothing removes in minimal. Microsoft store and Edge cannot be removed.
 - Delete startup shortcut

# Credits
[kolossalkernel](https://github.com/kolossalkernel/) for making the script and [this thread](https://stackoverflow.com/questions/11525056/how-to-create-a-batch-file-to-run-cmd-as-administrator) for run as admin code.
