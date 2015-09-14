#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
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

# git prompt
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
	. /usr/share/git/completion/git-prompt.sh
fi

# pandoc bash completion

if [ -f /home/djwilcox/.pandoc-completion.bash ]; then
	. /home/djwilcox/.pandoc-completion.bash
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
export GNUPGHOME="~/.gnupg-personal"

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# export alsa settings for ffplay
export SDL_AUDIODRIVER="alsa"
export AUDIODEV="plughw:1,0"

# bash aliases
#=============

alias vlc='vlc "$1" &>/dev/null'

alias ls='ls --color=auto'
alias vim='gvim -v'

# wget - enable continue and set the user agent
alias wget='wget --user-agent="Mozilla" -c'

# mkdir check if dir exists
alias mkdir='mkdir -p'

# btsync alias
alias btsync='btsync --config ~/.btsync/btsync.conf'

# acestream alias
alias acestreamengine='acestreamengine --client-console --port 6881'


# keyboard backlight on
alias backlight='sudo echo 255 > /sys/class/leds/smc::kbd_backlight/brightness'


# keyboard backlight off
alias backlight='sudo echo 0 > /sys/class/leds/smc::kbd_backlight/brightness'



# git aliases
#============

# git
alias g='git'

# git add
alias ga='git add'

# git commit
alias gc='git commit -a'

# git move
alias gm='git mv'

# git push origin master
alias gpom='git push origin master'

# git push ssh master
alias gpsm='git push ssh master'

# git push github master
alias gpgm='git push github master'

# git push nas master
alias gpnm='git push nas master'

# git push drive master, push to usb drive
alias gpdm='git push drive master'

# git remove
alias gr='git rm'

# git status
alias gs='git status'

# git log
alias gl='git log --oneline --all --graph --decorate'

# git pull
alias gp='git pull'

# ecryptfs add passphrase to keyring
alias unlock='ecryptfs-insert-wrapped-passphrase-into-keyring /home/djwilcox/.ecryptfs/dropbox-wrapped-passphrase'


# functions
#==========


# convert magnet link to torrent
#===============================

# mag2torrent
function mag2torrent {
aria2c --bt-metadata-only=true --bt-save-metadata=true --listen-port=6881 "$1"
}


# youtube-dl vlc function
#========================

# vlc youtube-dl
function youtube-vlc {
vlc $(youtube-dl -g "$1") &>/dev/null
}

# mplayer youtube-dl
function youtube-mplayer {
curl --ciphers RC4-SHA $(youtube-dl -g "$1") | mplayer -cache 8192 -
}

# kodi functions
#===============

# xbmc-send play video url
function xbmc-send-url {
xbmc-send --host=192.168.1.4 --port=9777 --action="PlayMedia("$1")"
}

# xbmc-send play youtube videos with youtube-dl
function youtube-kodi {
xbmc-send --host=192.168.1.4 --port=9777 --action="PlayMedia($(youtube-dl -g "$1"))"
}

# sopcast functions
#==================


# sopcast play stream with mplayer
#=================================

sopcast-mplayer () {
(sp-sc "$1" 8901 6881 &>/dev/null &);
sleep 5;
wait $(mplayer -cache 8192 -cache-min 25 http://127.0.0.1:6881);
killall sp-sc;
}

# sopcast vlc
#============

sopcast-vlc () {
(sp-sc "$1" 8901 6881 &>/dev/null &);
sleep 5;
wait $(vlc http://127.0.0.1:6881 &>/dev/null);
killall sp-sc;
}

# sopcast save stream with ffmpeg
#=================================

sopcast-ffmpeg () {
(sp-sc "$1" 8901 6881 &>/dev/null &);
sleep 5;
wait $(ffmpeg -i http://127.0.0.1:6881 -acodec copy -vcodec copy sopcast-stream.mkv);
killall sp-sc;
}

# sopcast open stream
#====================

sopcast-stream () {
(sp-sc "$1" 8901 6881 &>/dev/null &);
}
