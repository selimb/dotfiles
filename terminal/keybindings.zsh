# https://unix.stackexchange.com/a/140499
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Always use alt+. to insert last word.
# This is the default, but for some reason doesn't work in vscode or tmux without the explicit bindkey.
# https://github.com/ohmyzsh/ohmyzsh/issues/497#issuecomment-1722575
bindkey '\e.' insert-last-word
