cmdHere()

cmdHere() {
    If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass") {
        WinHWND := WinActive()
        For win in ComObjCreate("Shell.Application").Windows
            If (win.HWND = WinHWND) {
                dir := SubStr(win.LocationURL, 9) ; remove "file:///"
                dir := RegExReplace(dir, "%20", " ")
                Break
            }
    }
    Run, "C:\Program Files\Git\git-bash.exe", % dir ? dir : A_Desktop

    ExitApp
}