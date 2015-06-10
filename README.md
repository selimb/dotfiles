# Selim’s dotfiles

## First Steps
* Install sublime text 3
* Install [Package Manager](https://packagecontrol.io/installation) for ST3
```bash
sudo apt-get install git
```
[Generate SSH keys](https://help.github.com/articles/generating-ssh-keys/#platform-linux)
Now you're ready to clone this.

## Installation
Start with
```bash
cd ~
git clone https://github.com/Kreger51/dotfiles.git
cd dotfiles
```
To setup dotfiles:
```bash
source bootstrap.sh
```
If your gitconfig user name and email are already setup, you can skip the git setup step by running:
```bash
source bootstrap.sh --no-git
```
To setup packages:
```bash
source install.sh
```

## Pyvenv Wrapper

The functions in `bin/python_funcs.sh` provide a simple wrapper for `pyvenv-3.4`. You can use:
```bash
pyv <existing-project>   #  Make virtual environment for this project
work <existing-project>  #  Work on virtual environment for this project
deactivate
```
Environments are created in `~/.venvs/` so that the project directory is not cluttered.

## Extra
#### Scientific Python
```sudo apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose```

## Inspired from
* [Mathias Bynens](https://mathiasbynens.be/) and his [lovely bash prompt](https://github.com/mathiasbynens/dotfiles)
* [Zach Holman](https://github.com/holman) and his [bootstrapping script](https://github.com/holman/dotfiles/blob/master/script/bootstrap)
* [Paul Miller](https://github.com/paulmillr) and his [dotfiles structure](https://github.com/paulmillr/dotfiles)