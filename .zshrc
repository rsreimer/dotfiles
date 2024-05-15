export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' lazy-cmd pnpx tsx

plugins=(nvm git vi-mode macos)

source $ZSH/oh-my-zsh.sh
source ~/.p10k.zsh

alias g="lazygit"

# Neovim
alias e="kitty @ set-tab-title \"\$(basename \$(pwd))\" && nvim"
alias ec="cd ~/.config/nvim && e"

# Angular Playground
alias ngp="cd ~/projects/angular-playground && git checkout main && git reset --hard HEAD && nvim ./src/app/app.component.ts"
