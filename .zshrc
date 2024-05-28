export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' lazy-cmd pnpx tsx pnpm

plugins=(nvm git vi-mode macos)

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
