#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias discordcanary='flatpak run com.discordapp.DiscordCanary'
PS1='[\u@\h \W]\$ '
############
### uwsm ###
# hyprland autostart
if uwsm check may-start; then 
       exec uwsm start hyprland.desktop
fi       
