export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=()

source $ZSH/oh-my-zsh.sh
source ~/.p10k.zsh

alias e="kitten @ launch --type=tab --cwd=current --keep-focus lazygit && kitten @ launch --type=tab --tab-title=term --cwd=current --keep-focus && kitty @ set-tab-title \"\$(basename \$(pwd))\" && nvim ."
alias ec="cd ~/.config/nvim && kitty @ set-tab-title \"nvim config\" && nvim ."

alias g="lazygit"

# Node version manager
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
