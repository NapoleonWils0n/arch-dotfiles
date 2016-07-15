# bash aliases
#=============

alias ls='ls -N --color=auto -h'
alias vim='gvim -v'

# wget - enable continue and set the user agent
alias wget='wget --user-agent="Mozilla" -c'

alias curl='curl -A "Mozilla"'

# mkdir check if dir exists
alias mkdir='mkdir -p'

# keyboard backlight on
alias backlight='sudo echo 255 > /sys/class/leds/smc::kbd_backlight/brightness'

# keyboard backlight off
alias backlight='sudo echo 0 > /sys/class/leds/smc::kbd_backlight/brightness'

# hdmi display on
alias hdmi-on='xrandr --output eDP1 --auto --primary --output HDMI1 --auto --right-of eDP1'

# hdmi display off
alias hdmi-off='xrandr --output eDP1 --auto --primary --output HDMI1 --off'

# remind calendar
alias remstart="remind -z -k'notify-send -i kodi "Reminder" %s &' ~/.reminders &"

# emacs
#======

alias emacs='emacs -nw'

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
