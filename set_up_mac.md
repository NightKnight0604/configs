## Follows these steps to install common used tools
1. Install spectacle/iTerm2.
1. homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/tong/.zprofile
1. git: `brew install git`
1. tmux: `brew install tmux`
1. Generate ssh: `ssh-keygen -t rsa`
1. Clone config proj: `git clone git@github.com:NightKnight0604/configs.git`
1. Copy vimrc to config dir: `cp ./vimrc $HOME/.vimrc`
1. `cp ./tmux.config $HOME/.tmux.config`

### Vim plugins

1. Vundle:`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim` `:PluginInstall`
1. vim-plug: `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim` `:PlugInstall`

### FZF
1. `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf`
1. `~/.fzf/install`

### Config fig
1. `git config --global user.name "Ben"`
1. `git config --global user.email "benwong0604@gmail.com"`
1. `git config --global alias.tree "log --graph --decorate --pretty=oneline --abbrev-commit"`

### Oh my Zsh
Follow instructions at: https://gist.github.com/kevin-smets/8568070

### zsh alias
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias tn='tmux new-session -s'
alias tl='tmux list-sessions'
alias tks='tmux kill-session -t'
alias tksv='tmux kill-server'

alias lr='ls -ltr'

