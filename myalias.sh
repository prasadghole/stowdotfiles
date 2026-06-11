#!/bin/bash
# ====================================================================
# OMZ-STYLE MULTI-SECTION ALIAS DEFINITIONS FOR BASH
# ====================================================================

# --------------------------------------------------------------------
# SECTION 1: Core System & Directory Navigation (OMZ Essentials)
# --------------------------------------------------------------------
# Standard Oh My Zsh shortcuts for moving around and listing files.

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Detect OS for correct 'ls' color flags
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ls='ls --color=auto'
    alias l='ls -lah'
    alias ll='ls -lh'
    alias la='ls -A'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G'
    alias l='ls -Glah'
    alias ll='ls -Glh'
    alias la='ls -GA'
fi

alias md='mkdir -p'
alias rd='rmdir'

# --------------------------------------------------------------------
# SECTION 2: The "Git" Plugin Section (The most popular OMZ aliases)
# --------------------------------------------------------------------
# Hand-picked core Git shortcuts that mirror the OMZ Git plugin exactly.

if command -v git &> /dev/null; then
    alias g='git'
    
    # Workflow essentials
    alias gst='git status'
    alias ga='git add'
    alias gaa='git add --all'
    alias gapa='git add --patch'
    
    # Commits
    alias gc='git commit --verbose'
    alias gc!'='git commit --verbose --amend'
    alias gcm='git commit -m'
    alias gcam='git commit -a -m'
    
    # Branching & Checking out
    alias gco='git checkout'
    alias gcb='git checkout -b'
    alias gb='git branch'
    alias gba='git branch -a'
    alias gbd='git branch -d'
    
    # Push / Pull
    alias gl='git pull'
    alias gp='git push'
    alias gpf!='git push --force'
    
    # Logging
    alias glo='git log --oneline --decorate'
    alias glog='git log --oneline --decorate --graph'
fi

# --------------------------------------------------------------------
# SECTION 3: Common Tools (Docker & Build Tools)
# --------------------------------------------------------------------
# Conditional checks ensure these only load if the tool is installed.

# Docker Aliases
if command -v docker &> /dev/null; then
    alias d='docker'
    alias dps='docker ps'
    alias dpsa='docker ps -a'
    alias dimgs='docker images'
    alias drms='docker rm $(docker ps -a -q)'
    alias drmis='docker rmi $(docker images -q)'
fi


# --------------------------------------------------------------------
# SECTION 4: Custom Overrides & Functions
# --------------------------------------------------------------------
# Keep this section empty or use it to add your personal custom tweaks.

# Example OMZ-style helper function
take() {
    mkdir -p "$1" && cd "$1"
}
