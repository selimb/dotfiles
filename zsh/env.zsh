# Sublime Text
if [ -d "$HOME/.config/sublime-text-3" ]
then
    SUBL_CONFIG="$HOME/.config/sublime-text-3"
    SUBL_PKG="$SUBL_CONFIG/Packages"
fi

# Use vim instead of stupid Nano
export VISUAL=vi
export EDITOR=$VISUAL

