alias aliases="cat ~/.dotfiles/.bash_aliases; cat ~/.bash_aliases"
alias notessb="sb & notes"
alias buc="bash ~/scripts/backup_config.sh"
alias f="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs -r nvim"
# List directory in tree style
alias lst="tree"

alias bashrc="nvim ~/.bashrc"
alias bash_aliases="nvim ~/.bash_aliases"
alias i3conf="nvim ~/.config/i3/config"
alias tmuxconf="nvim ~/.tmux.conf"
alias kittyconf="nvim ~/.config/kitty/kitty.conf"
alias nconf="cd ~/.config/nvim/ && nvim init.lua"

alias keymaps="nvim ~/.config/nvim/lua/user/keymaps.lua"
alias s="kitty +kitten ssh"
alias cdnotes="cd ~/Data/Obsidian/ml-notes/"
alias cdnvim="cd ~/.config/nvim/"

#bluetooth
alias airpods="bluetoothctl connect EC:73:79:03:D9:49"
alias airpodsdisconnect="bluetoothctl disconnect EC:73:79:03:D9:49"
alias code='code --password-store="gnome"'
