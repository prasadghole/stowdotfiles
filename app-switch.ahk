!1:: ; Alt + 1
if WinExist("ahk_exe WindowsTerminal.exe") {
    WinActivate
} else {
    Run, wt.exe -p "Ubuntu"
}
    
return

!2:: ; Alt + 2 — Example for firefox
    IfWinExist ahk_exe firefox.exe
        WinActivate
    Else
        Run "C:\Program Files\Mozilla Firefox\firefox.exe"
    return

!3:: ; Alt + 3 — Neovim qT
    IfWinExist ahk_exe nvim-qt.exe
        WinActivate
    Else
        Run "C:\Program Files\neovim-qt 0.2.19\bin\nvim-qt.exe"
return

!4:: ; Alt + 4
    IfWinExist ahk_exe notepad.exe
        WinActivate
    Else
        Run notepad.exe
return

!5:: ; Alt + 5 — Emacs
    IfWinExist ahk_exe emacs.exe
        WinActivate
    Else
        Run  "C:\Program Files\Emacs\emacs-30.1\bin\runemacs.exe"
return
