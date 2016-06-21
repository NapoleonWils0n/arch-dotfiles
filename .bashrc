#
# ~/.bashrc
#

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# git prompt
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
	. /usr/share/git/completion/git-prompt.sh
fi

# pandoc bash completion

if [ -f "$HOME/.pandoc-completion.bash" ]; then
	. "$HOME/.pandoc-completion.bash"
fi

# bash aliases

if [ -f "$HOME/.bash_aliases" ]; then
	. "$HOME/.bash_aliases"
fi

# set PATH so it includes the kodi playercorefactory scripts
if [ -d "$HOME/git/kodi-playercorefactory/bash-scripts" ] ; then
    PATH="$HOME/git/kodi-playercorefactory/bash-scripts:$PATH"
fi

# set PATH so it includes ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH for android
if [ -d "/opt/android-sdk/platform-tools" ] ; then
    PATH="/opt/android-sdk/platform-tools:$PATH"
fi


# Shell prompt
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto verbose git"

# prompt
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\nYes Master ? '

# cdpath
CDPATH=".:~"

# set $GNUPGHOME for gnupg keys
export GNUPGHOME="~/.gnupg"

# Tell ls to be colourful
export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad

# export alsa settings for ffplay
export SDL_AUDIODRIVER="alsa"
export AUDIODEV="plughw:1,0"
#export AUDIODEV="plughw:0,0"

# editor
export EDITOR="/usr/bin/gvim -v"

# dir colors
export TERM="xterm-color"

if [ -f $HOME/.dir_colors ]; then
	eval `dircolors -b $HOME/.dir_colors`
fi

