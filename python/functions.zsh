#!/bin/bash
VENV_DIR="$HOME/.venvs"
# Activate venv and re-source PS1 from bash_prompt to get colored venv name.
function work() {
    source "$VENV_DIR/$1/bin/activate"
    # source "$HOME/.bash_prompt"
}

#################      OBSOLETE       #####################
###########################################################
# Pyvenv-3.4 is currently broken in Ubuntu 14.04. This script needs to be run to create new
# environments with pyvenv
# function pyv() {
#     if [ -d $VENV_DIR ]; then
#         echo "Making directory for environments in $VENV_DIR"
#         mkdir $VENV_DIR
#     fi
#     venv="$VENV_DIR/$1"
#     echo "Creating virtual environment in $venv"
#     if ! (pyvenv-3.4 --without-pip $venv); then
#         echo "Something wrong happened"
#         return
#     fi
#     source "$venv/bin/activate"
#     curl https://bootstrap.pypa.io/get-pip.py | python
#     deactivate
#     work $1
# }
##############################################################

function pyv() {
    if [ -d $VENV_DIR ]; then
        echo "Making directory for environments in $VENV_DIR"
        mkdir $VENV_DIR
    fi
    venv="$VENV_DIR/$1"
    echo "Creating virtual environment in $venv"
    if ! (pyvenv-3.4 $venv); then
        echo "Something wrong happened"
        return
    fi
    work $1
}


function delete_venv() {
    rm -rf "$VENV_DIR/$1"
}