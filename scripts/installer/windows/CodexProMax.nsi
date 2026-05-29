Unicode true
!include "MUI2.nsh"

!ifndef VERSION
  !define VERSION "0.0.0"
!endif
!define ROOT "..\..\.."

Name "codex-pro-max"
OutFile "${ROOT}\dist\windows\CodexProMax-${VERSION}-windows-x64-setup.exe"
InstallDir "$LOCALAPPDATA\Programs\codex-pro-max"
InstallDirRegKey HKCU "Software\codex-pro-max" "InstallDir"
RequestExecutionLevel admin
SetCompressor /SOLID lzma

!define MUI_ICON "${ROOT}\apps\codex-pro-max-manager\src-tauri\icons\icon.ico"
!define MUI_UNICON "${ROOT}\apps\codex-pro-max-manager\src-tauri\icons\icon.ico"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "English"

Section "Install"
  SetOutPath "$INSTDIR"

  nsExec::ExecToLog 'taskkill /IM codex-pro-max.exe /F'
  Pop $0
  nsExec::ExecToLog 'taskkill /IM codex-pro-max-manager.exe /F'
  Pop $0

  File "${ROOT}\dist\windows\app\codex-pro-max.exe"
  File "${ROOT}\dist\windows\app\codex-pro-max-manager.exe"

  Delete "$DESKTOP\codex-pro-max 绠＄悊宸ュ叿.lnk"
  Delete "$SMPROGRAMS\codex-pro-max\codex-pro-max 绠＄悊宸ュ叿.lnk"

  CreateShortcut "$DESKTOP\codex-pro-max.lnk" "$INSTDIR\codex-pro-max.exe" "" "$INSTDIR\codex-pro-max.exe"
  CreateShortcut "$DESKTOP\codex-pro-max 管理工具.lnk" "$INSTDIR\codex-pro-max-manager.exe" "" "$INSTDIR\codex-pro-max-manager.exe"
  CreateDirectory "$SMPROGRAMS\codex-pro-max"
  CreateShortcut "$SMPROGRAMS\codex-pro-max\codex-pro-max.lnk" "$INSTDIR\codex-pro-max.exe" "" "$INSTDIR\codex-pro-max.exe"
  CreateShortcut "$SMPROGRAMS\codex-pro-max\codex-pro-max 管理工具.lnk" "$INSTDIR\codex-pro-max-manager.exe" "" "$INSTDIR\codex-pro-max-manager.exe"
  CreateShortcut "$SMPROGRAMS\codex-pro-max\卸载 codex-pro-max.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\codex-pro-max-manager.exe"

  WriteUninstaller "$INSTDIR\uninstall.exe"
  WriteRegStr HKCU "Software\codex-pro-max" "InstallDir" "$INSTDIR"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\codex-pro-max" "DisplayName" "codex-pro-max"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\codex-pro-max" "DisplayVersion" "${VERSION}"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\codex-pro-max" "Publisher" "shgkz"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\codex-pro-max" "DisplayIcon" "$INSTDIR\codex-pro-max-manager.exe"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\codex-pro-max" "InstallLocation" "$INSTDIR"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\codex-pro-max" "UninstallString" "$INSTDIR\uninstall.exe"
SectionEnd

Section "Uninstall"
  nsExec::ExecToLog 'taskkill /IM codex-pro-max.exe /F'
  Pop $0
  nsExec::ExecToLog 'taskkill /IM codex-pro-max-manager.exe /F'
  Pop $0

  Delete "$DESKTOP\codex-pro-max.lnk"
  Delete "$DESKTOP\codex-pro-max 管理工具.lnk"
  Delete "$DESKTOP\codex-pro-max 绠＄悊宸ュ叿.lnk"
  Delete "$SMPROGRAMS\codex-pro-max\codex-pro-max.lnk"
  Delete "$SMPROGRAMS\codex-pro-max\codex-pro-max 管理工具.lnk"
  Delete "$SMPROGRAMS\codex-pro-max\codex-pro-max 绠＄悊宸ュ叿.lnk"
  Delete "$SMPROGRAMS\codex-pro-max\卸载 codex-pro-max.lnk"
  RMDir "$SMPROGRAMS\codex-pro-max"

  Delete "$INSTDIR\codex-pro-max.exe"
  Delete "$INSTDIR\codex-pro-max-manager.exe"
  Delete "$INSTDIR\uninstall.exe"
  RMDir "$INSTDIR"

  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\codex-pro-max"
  DeleteRegKey HKCU "Software\codex-pro-max"
SectionEnd
