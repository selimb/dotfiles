# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# https://zsh.sourceforge.io/FAQ/zshfaq04.html section 4.6
# Use `Ctrl+x f` to always autocomplete filepaths
zle -C complete-file complete-word _generic
zstyle ':completion:complete-file::::' completer _files
bindkey '^xf' complete-file
