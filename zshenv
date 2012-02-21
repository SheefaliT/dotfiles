fpath=($fpath $HOME/.zsh/func)
typeset -U fpath

# vim does not source the .zshrc, but does source this file
#   http://beginrescueend.com/integration/vim/
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
