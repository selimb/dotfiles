py2=python2
if ! command -v $py2 >/dev/null; then
    py2=python
fi

if ! command -v pip >/dev/null; then
    echo "Downloading pip"
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    sudo $py2 get-pip.py
    rm get-pip.py
fi
if ! command -v virtualenv >/dev/null; then
    echo "Installing virtualenv"
    sudo pip install virtualenv
fi
if [ "$PIPSI_HOME" -a "$PIPSI_BIN_DIR" ]; then
    echo "Installing pipsi"
    curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | $py2
else
    echo "Set $PIPSI_HOME and $PIPSI_BIN_DIR before running this."
fi

