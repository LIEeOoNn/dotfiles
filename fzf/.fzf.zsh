# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Set up fzf key bindings and fuzzy completion 
source <(fzf --zsh)

# style to full mode 
export FZF_DEFAULT_OPTS="
  --style full \
  --preview 'fzf-preview.sh {}' \
  --bind 'focus:transform-header:file --brief {}'"

# cd into the selected directory 
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

# Paste the selected cmd from history onto the cmd-line
export FZF_CTRL_R_OPTS=""

# Preview file content using bat
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

