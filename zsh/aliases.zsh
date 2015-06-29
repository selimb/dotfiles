alias reload!='. ~/.zshrc'

# Inline aliases, zsh -g aliases can be anywhere in command line
alias -g G='| grep -'
alias -g L='| less'
# Reduces "ls | grep foo | less" to "ls G foo L"
