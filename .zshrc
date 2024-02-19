export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:plugins:nvm' lazy yes

plugins=(nvm git)

source $ZSH/oh-my-zsh.sh
source ~/.p10k.zsh

alias g="lazygit"

# LazyVim
alias el="kitty @ set-tab-title \"\$(basename \$(pwd))\" && NVIM_APPNAME=lazyvim nvim ."
alias elc="cd ~/.config/nvim-custom && n"

# Neovim
alias e="kitty @ set-tab-title \"\$(basename \$(pwd))\" && nvim ."
alias ec="cd ~/.config/nvim && kitty @ set-tab-title \"nvim config\" && nvim ."
