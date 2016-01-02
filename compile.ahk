; close autohotkey
DetectHiddenWindows On ; List all running instances of this script:
WinGet instances, List, ahk_class AutoHotkey
if (instances > 1) { ; There are 2 or more instances of this script.
    this_pid := DllCall("GetCurrentProcessId"),  closed := 0
    Loop % instances { ; For each instance,
        WinGet pid, PID, % "ahk_id " instances%A_Index%
        if (pid != this_pid) { ; If it's not THIS instance,
            WinClose % "ahk_id " instances%A_Index% ; close it.
            closed += 1
        }
    }
}

FileDelete, % A_ScriptDir "\fileInstallList.ahk"
FileAppend, % FileInstallList(A_ScriptDir "\res", A_ScriptDir "\bin\res", "1"), % A_ScriptDir "\fileInstallList.ahk"
; msgbox % FileInstallList(A_ScriptDir "\res", A_ScriptDir "\res\vpk", "1")

FileRemoveDir, % A_ScriptDir "\bin", 1
FileCreateDir, % A_ScriptDir "\bin"

SplitPath, A_AhkPath, , AhkDir
run "%AhkDir%\Compiler\ahk2exe.exe" /in %A_ScriptDir%\vpk.ahk /out %A_ScriptDir%\bin\vpk.exe ; /icon "%A_ScriptDir%\res\img\a_1.ico"
