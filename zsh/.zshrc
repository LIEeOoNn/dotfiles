
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/leon/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/leon/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/leon/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/leon/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# use the r from the r env 
export PATH="$HOME/miniconda3/envs/r-env/bin:$PATH"
# use .NET for vscode 
export DOTNET_ROOT="/opt/homebrew"
export PATH="$DOTNET_ROOT/bin:$PATH"

export EDITOR=nvim
export VISUAL=nvim 
export MANPAGER="nvim +Man!" # MAN opening in nvim 
export PATH="$HOME/.tmux/plugins/tmuxifier/bin:$PATH" # setup tmuxifier
eval "$(tmuxifier init -)"

# https://github.com/junegunn/fzf#setting-up-shell-integration
# fzf setup for keybinds and completions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Starts the completion system
if type brew &>/dev/null; then 
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
  FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
fi

# bookmarks
books() {
  rclone bisync dropbox:/books ~/Books && cd ~/Books
}
alias freeprod='nvim ~/Desktop/freestyle_productivity.md'
alias notes='cd ~/dotfiles/notes'
alias thesis='cd ~/repos/thesis'
alias work='cd ~/repos/work'

# general
alias n='nvim'
alias ls='ls -F --color=auto'
alias ll='ls -alFh' # list with links and hidden 
alias diff='diff -us --color=auto'
alias grep='grep --color=auto'
alias cp='cp -R'  # recursive copying 
alias mkdir='mkdir -vp' # idk if i want verbose yet 
alias lf='ls -Fa | fzf' # fzf in output of ls
alias rm='rm -Iv'  # confirmation if 3 > files and verbose
alias ..='cd ..' go back one
alias tree='tree -lC -L 2' # limit to 2 lvl
alias c='clear'
alias update='if [ -f /etc/os-release ]; then sudo pacman -Syu; elif command -v brew &> /dev/null; then brew update && brew upgrade; fi'
alias space-waste='du -ah ~ | sort -rh | head -n 20'


# git 
alias gs='git status'
alias gd='git diff' 
alias ga='git add' 
alias gc='git commit'
alias gpush='git push'
alias gpull='git pull'
alias gl="git log --graph --pretty=format:'%C(yellow)%h %C(reset)- %C(cyan)(%ad) %C(reset)- %C(bold blue)%an%C(reset)%n  %C(green)%s%C(reset)' --abbrev-commit --date=short --all"
alias gb='git branch'
alias gbs='gb sort=committerdate'

# uni pool remote access 
alias uni-ssh='TERM=xterm-256color ssh peplaul0@login-stud.informatik.uni-bonn.de'
