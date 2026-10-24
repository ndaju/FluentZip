; Inno Setup script for FluentZip.
; Compiled by tools/build-dist.ps1, which passes PublishDir and AppVersion.

#ifndef AppVersion
  #define AppVersion "0.1.0"
#endif
#ifndef PublishDir
  #define PublishDir "..\src\App\bin\x64\Release\net10.0-windows10.0.19041.0\win-x64\publish"
#endif

#define AppName "FluentZip"
#define AppExe "FluentZip.exe"
#define AppPublisher "metawka"
#define AppUrl "https://github.com/metawka/711zip"
; All program files live under {app}\app so the install root stays clean
; (just the launcher shortcut and the uninstaller).
#define AppSub "app"

[Setup]
AppId={{3C9E5A17-8B42-4D6F-A1E9-7F2C6D4B8A50}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppUrl}
AppSupportURL={#AppUrl}
DefaultDirName={autopf}\FluentZip
DefaultGroupName={#AppName}
DisableProgramGroupPage=yes
UninstallDisplayName={#AppName}
UninstallDisplayIcon={app}\{#AppSub}\{#AppExe}
SetupIconFile=..\src\App\Assets\app.ico
OutputDir=..\dist
OutputBaseFilename=FluentZip-{#AppVersion}-setup
Compression=lzma2/ultra64
SolidCompression=yes
LZMANumBlockThreads=4
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
WizardStyle=modern
MinVersion=10.0.17763
ChangesAssociations=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "{#PublishDir}\*"; DestDir: "{app}\{#AppSub}"; Flags: recursesubdirs createallsubdirs ignoreversion

[Icons]
; Clean launcher in the install root, plus Start-menu and (optional) desktop icons.
Name: "{app}\FluentZip File Manager";              Filename: "{app}\{#AppSub}\{#AppExe}"; WorkingDir: "{app}\{#AppSub}"
Name: "{group}\FluentZip File Manager"; Filename: "{app}\{#AppSub}\{#AppExe}"; WorkingDir: "{app}\{#AppSub}"
Name: "{autodesktop}\FluentZip File Manager"; Filename: "{app}\{#AppSub}\{#AppExe}"; WorkingDir: "{app}\{#AppSub}"; Tasks: desktopicon

[Registry]
; ---- "Open with" registration ----
Root: HKA; Subkey: "Software\Classes\Applications\{#AppExe}"; ValueType: string; ValueName: "FriendlyAppName"; ValueData: "FluentZip"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\Applications\{#AppExe}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#AppSub}\{#AppExe},0"
Root: HKA; Subkey: "Software\Classes\Applications\{#AppExe}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppSub}\{#AppExe}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#AppExe}\SupportedTypes"; ValueType: string; ValueName: ".7z"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\{#AppExe}\SupportedTypes"; ValueType: string; ValueName: ".zip"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\{#AppExe}\SupportedTypes"; ValueType: string; ValueName: ".rar"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\{#AppExe}\SupportedTypes"; ValueType: string; ValueName: ".tar"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\{#AppExe}\SupportedTypes"; ValueType: string; ValueName: ".gz"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\{#AppExe}\SupportedTypes"; ValueType: string; ValueName: ".bz2"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\{#AppExe}\SupportedTypes"; ValueType: string; ValueName: ".xz"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\{#AppExe}\SupportedTypes"; ValueType: string; ValueName: ".cab"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\{#AppExe}\SupportedTypes"; ValueType: string; ValueName: ".iso"; ValueData: ""

; ---- Explorer context menu: one cascading "FluentZip" submenu per type ----
; .zip
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.zip\shell\FluentZip"; ValueType: string; ValueName: "MUIVerb"; ValueData: "FluentZip"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.zip\shell\FluentZip"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\{#AppSub}\{#AppExe},0"
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.zip\shell\FluentZip"; ValueType: string; ValueName: "SubCommands"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.zip\shell\FluentZip\shell\01open"; ValueType: string; ValueName: ""; ValueData: "Open with FluentZip"
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.zip\shell\FluentZip\shell\01open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppSub}\{#AppExe}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.zip\shell\FluentZip\shell\02extracthere"; ValueType: string; ValueName: ""; ValueData: "Extract here"
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.zip\shell\FluentZip\shell\02extracthere\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppSub}\{#AppExe}"" --extract-here ""%1"""
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.zip\shell\FluentZip\shell\03extractto"; ValueType: string; ValueName: ""; ValueData: "Extract to folder"
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.zip\shell\FluentZip\shell\03extractto\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppSub}\{#AppExe}"" --extract ""%1"""

; .7z
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.7z\shell\FluentZip"; ValueType: string; ValueName: "MUIVerb"; ValueData: "FluentZip"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.7z\shell\FluentZip"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\{#AppSub}\{#AppExe},0"
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.7z\shell\FluentZip"; ValueType: string; ValueName: "SubCommands"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.7z\shell\FluentZip\shell\01open"; ValueType: string; ValueName: ""; ValueData: "Open with FluentZip"
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.7z\shell\FluentZip\shell\01open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppSub}\{#AppExe}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.7z\shell\FluentZip\shell\02extracthere"; ValueType: string; ValueName: ""; ValueData: "Extract here"
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.7z\shell\FluentZip\shell\02extracthere\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppSub}\{#AppExe}"" --extract-here ""%1"""
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.7z\shell\FluentZip\shell\03extractto"; ValueType: string; ValueName: ""; ValueData: "Extract to folder"
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.7z\shell\FluentZip\shell\03extractto\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppSub}\{#AppExe}"" --extract ""%1"""

; .rar
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.rar\shell\FluentZip"; ValueType: string; ValueName: "MUIVerb"; ValueData: "FluentZip"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.rar\shell\FluentZip"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\{#AppSub}\{#AppExe},0"
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.rar\shell\FluentZip"; ValueType: string; ValueName: "SubCommands"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.rar\shell\FluentZip\shell\01open"; ValueType: string; ValueName: ""; ValueData: "Open with FluentZip"
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.rar\shell\FluentZip\shell\01open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppSub}\{#AppExe}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.rar\shell\FluentZip\shell\02extracthere"; ValueType: string; ValueName: ""; ValueData: "Extract here"
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.rar\shell\FluentZip\shell\02extracthere\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppSub}\{#AppExe}"" --extract-here ""%1"""
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.rar\shell\FluentZip\shell\03extractto"; ValueType: string; ValueName: ""; ValueData: "Extract to folder"
Root: HKA; Subkey: "Software\Classes\SystemFileAssociations\.rar\shell\FluentZip\shell\03extractto\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppSub}\{#AppExe}"" --extract ""%1"""

; Folders: cascading submenu (open + add to archive)
Root: HKA; Subkey: "Software\Classes\Directory\shell\FluentZip"; ValueType: string; ValueName: "MUIVerb"; ValueData: "FluentZip"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\Directory\shell\FluentZip"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\{#AppSub}\{#AppExe},0"
Root: HKA; Subkey: "Software\Classes\Directory\shell\FluentZip"; ValueType: string; ValueName: "SubCommands"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Directory\shell\FluentZip\shell\01open"; ValueType: string; ValueName: ""; ValueData: "Open with FluentZip"
Root: HKA; Subkey: "Software\Classes\Directory\shell\FluentZip\shell\01open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppSub}\{#AppExe}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Directory\shell\FluentZip\shell\02compress"; ValueType: string; ValueName: ""; ValueData: "Add to archive"
Root: HKA; Subkey: "Software\Classes\Directory\shell\FluentZip\shell\02compress\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppSub}\{#AppExe}"" --compress ""%1"""

; Any file: single "Add to archive" entry
Root: HKA; Subkey: "Software\Classes\*\shell\FluentZip.compress"; ValueType: string; ValueName: ""; ValueData: "Add to archive (FluentZip)"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\*\shell\FluentZip.compress"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\{#AppSub}\{#AppExe},0"
Root: HKA; Subkey: "Software\Classes\*\shell\FluentZip.compress\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppSub}\{#AppExe}"" --compress ""%1"""

[Run]
Filename: "{app}\{#AppSub}\{#AppExe}"; Description: "{cm:LaunchProgram,FluentZip}"; Flags: nowait postinstall skipifsilent
