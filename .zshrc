export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git vi-mode macos)

source $ZSH/oh-my-zsh.sh
source ~/.p10k.zsh

alias g="lazygit"

# Neovim
alias e="kitty @ set-tab-title \"\$(basename \$(pwd))\" && nvim"
alias ec="cd ~/.config/nvim && e"

# Angular Playground
alias ngp="cd ~/projects/angular-playground && git checkout main && git reset --hard HEAD && nvim ./src/app/app.component.ts"

# FZF
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
