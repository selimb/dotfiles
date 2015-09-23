if [ "$PIPSI_HOME" -a "$PIPSI_BIN_DIR" ]; then
    echo "Downloading pipsi"
    wget https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py > /dev/null
    echo "Installing pipsi."
    python2 get-pipsi.py > /dev/null
    echo "Removing installation file."
    rm get-pipsi.py > /dev/null
else
    echo "Set $PIPSI_HOME and $PIPSI_BIN_DIR before running this."
fi

