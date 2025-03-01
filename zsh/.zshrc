
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

# default editor to nvim 
export EDITOR=nvim
# MAN opening in nvim 
export MANPAGER="nvim +Man!"

# https://github.com/junegunn/fzf#setting-up-shell-integration
# fzf setup for keybinds and completions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
