#SingleInstance force

; Msgbox,
; ( LTrim
; Parameter(0) = %0%
; Parameter(1) = %1%
; Parameter(2) = %2%
; Parameter(3) = %3%
; )

#Include, %A_ScriptDir%\fileInstallList.ahk

If (A_IsCompiled = 1)
{
	; FileCreateDir, % A_ScriptDir "\res\vpk\steam", 1
	; FileInstall, E:\Downloads\ahk-vpk\source\steam\FileSystem_Stdio.dll, % A_ScriptDir "\res\vpk\steam\FileSystem_Stdio.dll", 1
	; FileInstall, E:\Downloads\ahk-vpk\source\steam\tier0.dll, % A_ScriptDir "\res\vpk\steam\tier0.dll", 1
	; FileInstall, E:\Downloads\ahk-vpk\source\steam\vpk.exe, % A_ScriptDir "\res\vpk\steam\vpk.exe", 1
	; FileInstall, E:\Downloads\ahk-vpk\source\steam\vstdlib.dll, % A_ScriptDir "\res\vpk\steam\vstdlib.dll", 1

	; FileCreateDir, % A_ScriptDir "\res\vpk\nosteam", 1
	; FileInstall, E:\Downloads\ahk-vpk\source\nosteam\FileSystem_Stdio.dll, % A_ScriptDir "\res\vpk\nosteam\FileSystem_Stdio.dll", 1
	; FileInstall, E:\Downloads\ahk-vpk\source\nosteam\tier0.dll, % A_ScriptDir "\res\vpk\nosteam\tier0.dll", 1
	; FileInstall, E:\Downloads\ahk-vpk\source\nosteam\vpk.exe, % A_ScriptDir "\res\vpk\nosteam\vpk.exe", 1
	; FileInstall, E:\Downloads\ahk-vpk\source\nosteam\vstdlib.dll, % A_ScriptDir "\res\vpk\nosteam\vstdlib.dll", 1

	SourcePath = %1%
	SplitPath, SourcePath, , , SourcePathExt
	If !FileExist(SourcePath)
		return
		
	If( InStr( FileExist(SourcePath), "D") )
		run, % A_ScriptDir "\res\vpk\steam\vpk.exe """ SourcePath """ ", , Hide, vpkPID
	else if (SourcePathExt = "vpk")
		run, % A_ScriptDir "\res\vpk\nosteam\vpk.exe """ SourcePath """ ", , Hide, vpkPID
	
	sleep 10 ; give vpk.exe some time to fully boot to improve WinWaitClose reliability
	
	WinWaitClose, % "ahk_pid " vpkPID
}