#!/usr/bin/env bash
# =============================================================================
# bash_aliases.sh — Portable alias definitions (no ZSH / OMZ required)
# Source this file from ~/.bashrc:
#   [ -f "$HOME/.bash_aliases.sh" ] && source "$HOME/.bash_aliases.sh"
#
# Sections:
#   1. Navigation
#   2. Directory listing  (ls / eza / lsd auto-detected)
#   3. Git               (mirrors OMZ git plugin)
#   4. Systemd
#   5. Package management (apt)
#   6. Safety nets
#   7. Misc utilities
#   8. Project shortcuts  ← customise here
# =============================================================================

# Guard: only define once (safe to re-source)
[[ -n "${_BASH_ALIASES_LOADED:-}" ]] && return 0
readonly _BASH_ALIASES_LOADED=1

# =============================================================================
# 1. NAVIGATION
# =============================================================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'          # go to previous directory (OMZ behaviour)

alias md='mkdir -p'
alias rd='rmdir'

# =============================================================================
# 2. DIRECTORY LISTING
#    Prefers eza → lsd → coreutils ls (same priority OMZ uses for modern ls)
# =============================================================================
if command -v eza &>/dev/null; then
    alias ls='eza --group-directories-first'
    alias l='eza -lah --group-directories-first'
    alias ll='eza -lh --group-directories-first'
    alias la='eza -a --group-directories-first'
    alias lt='eza --tree --level=2'
    alias llt='eza --tree --level=3 -lh'
elif command -v lsd &>/dev/null; then
    alias ls='lsd --group-dirs first'
    alias l='lsd -lah --group-dirs first'
    alias ll='lsd -lh --group-dirs first'
    alias la='lsd -a --group-dirs first'
    alias lt='lsd --tree --depth 2'
else
    alias ls='ls --color=auto --group-directories-first'
    alias l='ls -lahF --color=auto'
    alias ll='ls -lhF --color=auto'
    alias la='ls -AhF --color=auto'
fi

alias lsa='ls -lah'    # OMZ: show all including hidden
alias ldot='ls -ld .*' # show only dotfiles

# =============================================================================
# 3. GIT  (mirrors OMZ git plugin — most used subset)
# =============================================================================
alias g='git'

# --- status / info ---
alias gst='git status'
alias gsb='git status -sb'         # short branch view
alias gss='git status -s'

# --- add / commit ---
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'

# --- branch ---
alias gb='git branch'
alias gba='git branch -a'
alias gbD='git branch -D'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gsw='git switch'
alias gswc='git switch -c'

# --- log ---
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias glo='git log --oneline -20'

# --- diff ---
alias gd='git diff'
alias gds='git diff --staged'
alias gdw='git diff --word-diff'

# --- push / pull ---
alias gp='git push'
alias gpf='git push --force-with-lease'   # safer than --force
alias gpsup='git push --set-upstream origin "$(git branch --show-current)"'
alias gl='git pull'
alias gpr='git pull --rebase'
alias gup='git pull --rebase'             # OMZ alias

# --- remote ---
alias gr='git remote'
alias grv='git remote -v'
alias gra='git remote add'

# --- stash ---
alias gsta='git stash push'
alias gstp='git stash pop'
alias gstl='git stash list'
alias gstd='git stash drop'

# --- misc ---
alias gclean='git clean -fd'
alias greset='git reset --hard HEAD'      # nuclear reset — watch out
alias gbrowse='git open'                  # requires git-open plugin

# =============================================================================
# 4. SYSTEMD
# =============================================================================
alias sc='systemctl'
alias scs='systemctl status'
alias scstart='systemctl start'
alias scstop='systemctl stop'
alias screstart='systemctl restart'
alias screload='systemctl reload'
alias scenable='systemctl enable'
alias scdisable='systemctl disable'
alias scdr='systemctl daemon-reload'
alias jctl='journalctl -xe'
alias jctlf='journalctl -fu'   # usage: jctlf my.service

# =============================================================================
# 5. PACKAGE MANAGEMENT (apt)
# =============================================================================
alias aptu='sudo apt update'
alias aptug='sudo apt upgrade -y'
alias aptuug='sudo apt update && sudo apt upgrade -y'
alias apti='sudo apt install -y'
alias aptr='sudo apt remove -y'
alias aptar='sudo apt autoremove -y'
alias apts='apt search'
alias aptshow='apt show'
alias aptlist='apt list --installed'

# =============================================================================
# 6. SAFETY NETS
# =============================================================================
alias rm='rm -i'          # confirm before delete
alias cp='cp -i'          # confirm before overwrite
alias mv='mv -i'          # confirm before overwrite
alias ln='ln -i'

# =============================================================================
# 7. MISC UTILITIES
# =============================================================================
# --- grep ---
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# --- editors ---
alias v='vim'
alias vi='vim'
[[ -n "${VISUAL:-}" ]] && alias e="$VISUAL"  # open in $VISUAL if set

# --- disk / process ---
alias df='df -h'
alias du='du -sh'
alias free='free -h'
alias ps='ps aux'
alias psg='ps aux | grep -v grep | grep'   # usage: psg nginx

# --- network ---
alias myip='curl -s ifconfig.me'
alias localip="ip -br addr show | awk '/UP/ {print \$3}'"
alias ports='ss -tulnp'

# --- time savers ---
alias h='history'
alias hg='history | grep'               # usage: hg git
alias c='clear'
alias q='exit'
alias reload='source ~/.bashrc'         # reload .bashrc in-place
alias path='echo -e "${PATH//:/\\n}"'   # print PATH one entry per line
alias week='date +%V'                   # ISO week number

# --- python ---
alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv .venv && source .venv/bin/activate'
alias activate='source .venv/bin/activate'

# =============================================================================
# 8. PROJECT / MACHINE-SPECIFIC SHORTCUTS  ← add yours here
# =============================================================================

# Example: jump to common project roots
# alias fw='cd ~/projects/firmware'
# alias blog='cd ~/projects/blog'

# Example: build shortcuts
# alias build='cmake --build build'
# alias flash='make flash'

# Example: frequently used SSH hosts
# alias devbox='ssh user@devbox.local'
