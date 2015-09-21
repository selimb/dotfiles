venvwrapper="/usr/local/bin/virtualenvwrapper.sh"
if [ -e $venvwrapper ]; then
    export WORKON_HOME=~/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
    source /usr/local/bin/virtualenvwrapper.sh
fi
