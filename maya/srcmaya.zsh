if [ $MAYA="TRUE" ]; then
    for file in $ZSH/maya/*.maya
    do
        source $file
    done
fi
