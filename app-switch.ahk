
Capslock::Esc
Esc::Capslock

#1:: ; Alt + 1
if WinExist("ahk_exe WindowsTerminal.exe") {
    WinActivate
} else {
    Run, wt.exe -p "Ubuntu"
}
    
return

#2:: ; Rio
    ifWinExist ahk_exe rio.exe
        winActivate
    else 
        run "c:\Program Files\Rio\rio.exe"
return
    
#3:: ; Alt + 3 — Example for firefox
    IfWinExist ahk_exe firefox.exe
        WinActivate
    Else
        Run "C:\Program Files\Mozilla Firefox\firefox.exe"
    return

#4:: ; Alt + 4 — Neovim qT
    IfWinExist ahk_exe nvim-qt.exe
        WinActivate
    Else
        Run "C:\Program Files\neovim-qt 0.2.19\bin\nvim-qt.exe"
return

#5:: ; Alt + 5
    IfWinExist ahk_exe notepad.exe
        WinActivate
    Else
        Run notepad.exe
return

#6:: ; Alt + 6 — Emacs
    IfWinExist ahk_exe emacs.exe
        WinActivate
    Else
        Run  "C:\Program Files\Emacs\emacs-30.1\bin\runemacs.exe"
return

#7:: ; stm32cube ide
    ifwinexist ahk_exe stm32cubeide.exe
        winactivate
    else
        run "d:\st\stm32cubeide_1.18.0\stm32cubeide\stm32cubeide.exe"

return

