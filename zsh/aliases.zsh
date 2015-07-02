alias reload!='. ~/.zshrc'

# Inline aliases, zsh -g aliases can be anywhere in command line

# Reduces "ls | grep foo | less" to "ls G foo L"
alias -g G='| grep -'
alias -g L='| less'

# Copy to clipboard
alias -g X='| xclip -selection clipboard'
