# Force emacs keybindings instead of letting zsh infer it from $VISUAL | $EDITOR.
# Must come before all the `bindkey` commands below.
bindkey -e

# https://unix.stackexchange.com/a/140499
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Always use alt+. to insert last word.
# This is the default, but for some reason doesn't work in vscode or tmux without the explicit bindkey.
# https://github.com/ohmyzsh/ohmyzsh/issues/497#issuecomment-1722575
bindkey '\e.' insert-last-word

zle -N newtab
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char

# Get Ctrl+R to work in tmux
# https://superuser.com/a/405433
bindkey '^R' history-incremental-search-backward

# https://zsh.sourceforge.io/FAQ/zshfaq04.html section 4.6
# Use `Ctrl+x f` to always autocomplete filepaths
zle -C complete-file complete-word _generic
zstyle ':completion:complete-file::::' completer _files
bindkey '^xf' complete-file
