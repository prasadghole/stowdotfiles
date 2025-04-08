!1:: 
if WinExist("ahk_exe WindowsTerminal.exe") {
    WinActivate
} else {
    Run, wt.exe -p "Ubuntu"
}
    
return

!2:: ; Alt + 2
    IfWinExist ahk_exe notepad.exe
        WinActivate
    Else
        Run notepad.exe
return

!3:: ; Alt + 3 — Example for Chrome
    IfWinExist ahk_exe chrome.exe
        WinActivate
    Else
        Run "C:\Program Files\Google\Chrome\Application\chrome.exe"
return

!4:: ; Alt + 4 — Neovim qT
    IfWinExist ahk_exe nvim-qt.exe
        WinActivate
    Else
        Run "C:\Program Files\neovim-qt 0.2.19\bin\nvim-qt.exe"
return

!5:: ; Alt + 5 — Emacs
    IfWinExist ahk_exe runemacs.exe
        WinActivate
    Else
        Run  "C:\Program Files\Emacs\emacs-30.1\bin\runemacs.exe"
return
