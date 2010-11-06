;@+leo-ver=4-thin
;@+node:EKR.20040519083717:@thin leo.nsi
;@@comment ;

; NSIS Script for Leo
; Version 1.0 of this script by Joe Orr, donated to public domain.
;
; How to create an installer for Leo using this script:
;	1. Install NSIS (from http://www.nullsoft.com)
;	2. Put the leo.nsi file in the directory containing the Leo program files.
;	3. Right-click on the leo.nsi file and choose "Compile"
;
; NOTE: this .NSI script is designed for NSIS v1.8+

;@<< installer settings >>
;@+node:EKR.20040519083717.1:<< installer settings >>
# [Installer Attributes]
Name "Leo"
OutFile "leosetup.exe"
Caption "Leo Installer"

;@<< Additional Installer Settings >>
;@+node:EKR.20040519083717.2:<< Additional Installer Settings >>
# You may not need to change these for your own app...

ShowInstDetails show
AutoCloseWindow false
SilentInstall normal
CRCCheck on
SetCompress auto
SetDatablockOptimize on
SetOverwrite ifnewer
WindowIcon off
;@nonl
;@-node:EKR.20040519083717.2:<< Additional Installer Settings >>
;@nl
;@<< icons used by the installer >>
;@+node:EKR.20040519083717.3:<< icons used by the installer >>
Icon c:\prog\leoCVS\leo\Icons\leo_inst.ico
EnabledBitmap c:\prog\leoCVS\leo\Icons\leo_on.bmp
DisabledBitmap c:\prog\leoCVS\leo\Icons\leo_off.bmp
;@nonl
;@-node:EKR.20040519083717.3:<< icons used by the installer >>
;@nl
;@<< the user license >>
;@+node:EKR.20040519083717.4:<< the user license >>
LicenseText "You must agree to this license before installing."
LicenseData c:\prog\leoCVS\leo\doc\LICENSE.TXT
;@nonl
;@-node:EKR.20040519083717.4:<< the user license >>
;@nl
;@<< the installation dir >>
;@+node:EKR.20040519083717.5:<< the installation dir >>
InstallDir "$PROGRAMFILES\Leo"
InstallDirRegKey HKEY_LOCAL_MACHINE "SOFTWARE\EKR\leo" ""
DirShow show # (make this hide to not let the user change it)
DirText "Select the directory to install Leo in:"
;@nonl
;@-node:EKR.20040519083717.5:<< the installation dir >>
;@nl

ComponentText "This will install Leo on your computer. Select which optional components you would also like to install."
;@nonl
;@-node:EKR.20040519083717.1:<< installer settings >>
;@nl
;@<< required files section >>
;@+node:EKR.20040519083717.6:<< required files section >>
Section "Leo" ; (default, required section)

  ;@  << check to see whether Python is installed >>
  ;@+node:EKR.20040519083717.7:<< check to see whether Python is installed >>
  # I sure hope there is a better way to do this, but other techniques don't seem to work.
  
  # Supposedly the Python installer creates the following registry entry
  # HKEY_LOCAL_MACHINE\Software\Python\PythonCore\CurrentVersion
  # and then we can read find the Python folder location via
  # HKEY_LOCAL_MACHINE\Software\Python\PythonCore\{versionno}. 
  # Unfortunately, at the time of this writing, the Python installer is NOT writing the first entry. There is no way to know what the current versionno is.
  # Hence, the following hack.
  
  # Get pythonw.exe path from registry... except it isn't there, nor is it an environment variable... thanks guys!
  # We'll have to get it in a roundabout way
  ReadRegStr $9 HKEY_LOCAL_MACHINE "SOFTWARE\Classes\Python.NoConFile\shell\open\command" ""
  
  # cut 8 characters from back of the open command
  StrCpy $8 $9 -8
  
  IfFileExists $8 ok tryagain
  
  tryagain:
  # ok, that  didn't work, but since the Python installer doesn't seem to be consistent, we'll try again
  # cut 3 characters from back of the open command
  StrCpy $8 $9 -3
  
  IfFileExists $8 ok ng
  
  ng:
    MessageBox MB_OK "Python is not installed on this system. $\nPlease install Python first. $\n$\nClick OK to cancel installation and remove installation Files."
    
    Delete "$INSTDIR\config\*.*" ; config dir
    RMDir "$INSTDIR\config"
    Delete "$INSTDIR\doc\*.*" ; doc dir
    RMDir "$INSTDIR\doc"
    Delete "$INSTDIR\examples\*.*" ; src dir
    RMDir "$INSTDIR\examples"
    Delete "$INSTDIR\Icons\*.*" ; Icons dir
    RMDir "$INSTDIR\Icons"
    Delete "$INSTDIR\plugins\*.*" ; plugins dir
    RMDir "$INSTDIR\plugins"
    Delete "$INSTDIR\scripts\*.*" ; scripts dir
    RMDir "$INSTDIR\scripts"
    Delete "$INSTDIR\src\*.*" ; src dir
    RMDir "$INSTDIR\src"
    Delete "$INSTDIR\test\*.*" ; test dir
    RMDir "$INSTDIR\test"
    Delete "$INSTDIR\tools\*.*" ; tools dir
    RMDir "$INSTDIR\tools"
    Delete "$INSTDIR\*.*" ; Leo directory
    RMDir "$INSTDIR"
  
    Quit
  ;@nonl
  ;@-node:EKR.20040519083717.7:<< check to see whether Python is installed >>
  ;@nl

ok:
  # List all files to included in installer	
  
  SetOutPath $INSTDIR
  File c:\prog\leoCVS\leo\__init__.py
  File c:\prog\leoCVS\leo\install
  File c:\prog\leoCVS\leo\manifest.in
  File c:\prog\leoCVS\leo\uninstall
  
  CreateShortCut "$INSTDIR\Shortcut to leo.py.lnk" "$INSTDIR\src\leo.py" "" "$INSTDIR\src\leo.py" 0

  SetOutPath $INSTDIR\config
  File c:\prog\leoCVS\leo\config\leoConfig.leo
  File c:\prog\leoCVS\leo\config\leoConfig.txt
  
  SetOutPath $INSTDIR\dist
  File c:\prog\leoCVS\leo\dist\leoDist.leo
  File c:\prog\leoCVS\leo\dist\leo.nsi
  File c:\prog\leoCVS\leo\dist\preSetup.py
  File c:\prog\leoCVS\leo\dist\createLeoDist.py
  File c:\prog\leoCVS\leo\dist\postSetup.py

  SetOutPath $INSTDIR\doc
 
  File c:\prog\leoCVS\leo\doc\LeoDocs.leo
  File c:\prog\leoCVS\leo\doc\leoDiary.txt
  File c:\prog\leoCVS\leo\doc\leoNotes.txt
  File c:\prog\leoCVS\leo\doc\leoToDo.txt

  File c:\prog\leoCVS\leo\doc\README.TXT
  File c:\prog\leoCVS\leo\doc\INSTALL.TXT
  File c:\prog\leoCVS\leo\doc\PKG-INFO.TXT
  File c:\prog\leoCVS\leo\doc\LICENSE.TXT
 
  File c:\prog\leoCVS\leo\doc\default.css
  File c:\prog\leoCVS\leo\doc\leo_rst.css
  File c:\prog\leoCVS\leo\doc\silver_city.css
  
  SetOutPath $INSTDIR\Icons
  File c:\prog\leoCVS\leo\Icons\*.*
  
  SetOutPath $INSTDIR\examples

  SetOutPath $INSTDIR\plugins
  File c:\prog\leoCVS\leo\plugins\leoPlugins.leo
  File c:\prog\leoCVS\leo\plugins\*.py
  File c:\prog\leoCVS\leo\plugins\*.ini
  File c:\prog\leoCVS\leo\plugins\*.txt
  File c:\prog\leoCVS\leo\plugins\aspell.pyd
  
  SetOutPath $INSTDIR\scripts
  File c:\prog\leoCVS\leo\scripts\leoScripts.txt
  File c:\prog\leoCVS\leo\scripts\*.py
  
  SetOutPath $INSTDIR\src
  File c:\prog\leoCVS\leo\src\LeoPy.leo
  File c:\prog\leoCVS\leo\src\leo*.py
  File c:\prog\leoCVS\leo\src\leoProjects.txt
  File c:\prog\leoCVS\leo\src\oldLeoProjects.leo
  
  SetOutPath $INSTDIR\test
  File c:\prog\leoCVS\leo\test\test.leo
 
  SetOutPath $INSTDIR\tools

SectionEnd ; end of default section
;@nonl
;@-node:EKR.20040519083717.6:<< required files section >>
;@nl
;@<< optional files section >>
;@+node:EKR.20040519083717.8:<< optional files section>>
# optional sections

Section "Start Menu Shortcuts"
  CreateDirectory "$SMPROGRAMS\Leo"
  CreateShortCut "$SMPROGRAMS\Leo\Uninstall.lnk" "$INSTDIR\uninst.exe" "" "$INSTDIR\uninst.exe" 0
  CreateShortCut "$SMPROGRAMS\Leo\Leo.lnk" "$8" '"$INSTDIR\src\leo.py"' "$INSTDIR\Icons\LeoApp.ico" 0  
SectionEnd

Section "Desktop Shortcut"
  CreateShortCut "$DESKTOP\Leo.lnk" "$8" '"$INSTDIR\src\leo.py"' "$INSTDIR\Icons\LeoApp.ico" 0
SectionEnd
;@nonl
;@-node:EKR.20040519083717.8:<< optional files section>>
;@nl
;@<< file association >>
;@+node:EKR.20040519083717.9:<< file association >>
Section ".leo File Association"
  SectionIn 1
  SectionIn 2
  SectionIn 3

  # back up old value of .leo in case some other program was using it
  ReadRegStr $1 HKCR ".leo" ""
  StrCmp $1 "" Label1
  StrCmp $1 "LeoFile" Label1
  WriteRegStr HKCR ".leo" "backup_val" $1
 
Label1:
  WriteRegStr HKCR ".leo" "" "LeoFile"
  WriteRegStr HKCR "LeoFile" "" "Leo File"
  WriteRegStr HKCR "LeoFile\shell" "" "open"
  WriteRegStr HKCR "LeoFile\DefaultIcon" "" $INSTDIR\Icons\LeoDoc.ico,0 
  WriteRegStr HKCR "LeoFile\shell\open\command" "" '$8 "$INSTDIR\src\leo.py" %1'  

SectionEnd
;@nonl
;@-node:EKR.20040519083717.9:<< file association >>
;@nl
;@<< post install section >>
;@+node:EKR.20040519083717.10:<< post install section >>
Section "-post" # (post install section, happens last after any optional sections)

  # add any commands that need to happen after any optional sections here
  WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\EKR\leo" "" "$INSTDIR"
  WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\leo" "DisplayName" "Leo (remove only)"
  WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\leo" "UninstallString" '"$INSTDIR\uninst.exe"'

  # write out uninstaller
  WriteUninstaller "$INSTDIR\uninst.exe"

SectionEnd ; end of -post section
;@nonl
;@-node:EKR.20040519083717.10:<< post install section >>
;@nl
;@<< uninstall section >>
;@+node:EKR.20040519083717.11:<< uninstall section >>
# [ begin uninstall settings/section ]
UninstallText "This will uninstall Leo from your system"
UninstallCaption "Uninstall Leo"
UninstallIcon c:\prog\leoCVS\leo\Icons\uninst.ico

Section Uninstall

DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\EKR\leo"
DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\leo"

;@<< remove file association >>
;@+node:EKR.20040519083717.12:<< remove file association >>
  ReadRegStr $1 HKCR ".leo" ""
  StrCmp $1 "LeoFile" 0 NoOwn ; only do this if we own it
	ReadRegStr $1 HKCR ".leo" "backup_val"
	StrCmp $1 "" 0 RestoreBackup ; if backup == "" then delete the whole key
	  DeleteRegKey HKCR ".leo"
	Goto NoOwn
	RestoreBackup:
	  WriteRegStr HKCR ".leo" "" $1
	  DeleteRegValue HKCR ".leo" "backup_val"
  NoOwn:
;@nonl
;@-node:EKR.20040519083717.12:<< remove file association >>
;@nl
;@<< remove program folder >>
;@+node:EKR.20040519083717.13:<< remove program folder >>
MessageBox MB_YESNO|MB_ICONQUESTION \
			 "Delete all files in Leo Program folder?" \
			 IDNO NoDelete  

  Delete "$INSTDIR\config\*.*" ; config dir
  RMDir "$INSTDIR\config"
  Delete "$INSTDIR\dist\*.*" ; dist dir
  RMDir "$INSTDIR\dist"
  Delete "$INSTDIR\doc\*.*" ; doc dir
  RMDir "$INSTDIR\doc"
  Delete "$INSTDIR\examples\*.*" ; src dir
  RMDir "$INSTDIR\examples"
  Delete "$INSTDIR\Icons\*.*" ; Icons dir
  RMDir "$INSTDIR\Icons"
  Delete "$INSTDIR\plugins\*.*" ; plugins dir
  RMDir "$INSTDIR\plugins"
  Delete "$INSTDIR\scripts\install\*.*" ; scripts\install dir
  RMDir "$INSTDIR\scripts\install"
  Delete "$INSTDIR\scripts\other\*.*" ; scripts\other dir
  RMDir "$INSTDIR\scripts\other"
  Delete "$INSTDIR\scripts\tangle\*.*" ; scripts\tangle dir
  RMDir "$INSTDIR\scripts\tangle"
  Delete "$INSTDIR\scripts\*.*" ; scripts dir
  RMDir "$INSTDIR\scripts"
  Delete "$INSTDIR\src\*.*" ; src dir
  RMDir "$INSTDIR\src"
  Delete "$INSTDIR\test\*.*" ; test dir
  RMDir "$INSTDIR\test"
  Delete "$INSTDIR\tools\*.*" ; tools dir
  RMDir "$INSTDIR\tools"
  Delete "$INSTDIR\*.*" ; Leo directory
  RMDir "$INSTDIR"

NoDelete:
;@nonl
;@-node:EKR.20040519083717.13:<< remove program folder >>
;@nl
;@<< remove shortcuts >>
;@+node:EKR.20040519083717.14:<< remove shortcuts >>
Delete "$SMPROGRAMS\Leo\*.*"
Delete "$DESKTOP\Leo.lnk"
;@nonl
;@-node:EKR.20040519083717.14:<< remove shortcuts >>
;@nl

; remove directories used.
RMDir "$SMPROGRAMS\Leo"

SectionEnd ; end of uninstall section
;@nonl
;@-node:EKR.20040519083717.11:<< uninstall section >>
;@nl

; eof
;@nonl
;@-node:EKR.20040519083717:@thin leo.nsi
;@-leo
