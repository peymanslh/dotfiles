
# Use antigen as plugin manager --> https://github.com/zsh-users/antigen
source /home/peyman/.antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle pass
antigen bundle docker
antigen bundle django
antigen bundle python
antigen bundle pip
antigen bundle sudo
antigen bundle cargo
antigen bundle systemd
antigen bundle colorize
antigen bundle colored-man-pages
antigen bundle celery
antigen bundle command-not-found
antigen bundle copyfile
antigen bundle gitfast
antigen bundle tmux

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
antigen theme bureau

antigen apply



# Use neovim as default editor
export EDITOR=nvim


# Open gnome file manager with open in terminal
alias open="nautilus"


# Go lang
export GOPATH=$HOME/Development/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin:$GOBIN

export PATH=$PATH:$HOME/.local/bin

export PATH=$PATH:$HOME/.cargo/bin
