# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias dot='cd ~/dotfiles'
alias p="cd ~/dev/Projects"

if [[ $(uname) == "Darwin" ]]; then
    ls="gls"
else
    ls="ls"
fi

# Detect which `ls` flavor is in use
if $ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# Always group by directories first.

opt="--group-directories-first"

# List all files colorized in long format
alias l="$ls -lF ${colorflag} ${opt}"

# List files including dot files
alias la="$ls -a ${colorflag} ${opt}"

# List all files colorized in long format, including dot files
alias lla="$ls -laF ${colorflag} ${opt}"

# List only directories
alias lsd="$ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command $ls ${colorflag} ${opt}"
# export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Make temporary directory and cd into it.
alias tmp='mkdir tmp && cd tmp'

# Untar
alias untar="tar xvzf"

# Recursive grep with line numbers on non-binary files
alias grepr="grep -RnHI"
